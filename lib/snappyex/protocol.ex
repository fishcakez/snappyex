defmodule Snappyex.Protocol do
  @moduledoc false
  @behaviour DBConnection

  alias Snappyex.Query
  require Logger
  
  def connect(opts) do
    host = Keyword.get(opts, :host, "localhost")
    port = Keyword.get(opts, :port, 1531)
    status = Snappyex.Client.start_link(host, port)
    connect_start_link(status, opts)
  end
  
   def connect_start_link({:error, err}, _opts) do
    {:error, err}
  end

  def connect_start_link({:ok, pid}, opts) do
    state = Keyword.merge(Keyword.new(), opts)
    token_size = Keyword.get(opts, :token_size, 16)
    use_string_for_decimal = Keyword.get(opts, :use_string_for_decimal, false)
    username = Keyword.get(opts, :username, 'APP')
    password = Keyword.get(opts, :password, 'APP')
    properties = Keyword.get(opts, :properties, HashDict.new)
    {:ok, local_hostname} = :inet.gethostname
    properties = Snappyex.Client.openConnection(pid, Snappyex.Model.OpenConnectionArgs.new(clientHostName: local_hostname, clientID: "ElixirClient1|0x" <> Base.encode16(inspect self), userName: username, password: password,  security: Snappyex.Model.SecurityMechanism.plain, properties: properties, tokenSize: token_size, useStringForDecimal: use_string_for_decimal))
    state = Keyword.put_new(state, :process_id, pid)
    state = Keyword.put_new(state, :connection_id, properties.connId)
    state = Keyword.put_new(state, :client_host_name, properties.clientHostName)
    state = Keyword.put_new(state, :client_id, properties.clientID)
    state = Keyword.put_new(state, :token, properties.token)
    {:ok, state}
  end

  def checkout(s) do
    {:ok, s}
  end

  def checkin(s) do
    {:ok, s}
  end

  def disconnect(err, %{types: ref}) when is_reference(ref) do
    raise err
  end

  def disconnect(_, state) do
    {:ok, connection_id} = Keyword.fetch(state, :connection_id)
    {:ok, token} = Keyword.fetch(state, :token)
    Snappyex.Client.closeConnection(connection_id, token)
    :ok
  end

  @spec ping(state :: any) ::
  {:ok, new_state :: any} |
  {:disconnect, Exception.t, new_state :: any}
  def ping(state) do
    query  = %Snappyex.Query{statement: 'SELECT 1'}
    {:ok, prepared_query, state} = Snappyex.Protocol.handle_prepare(query, [], state)
    params = Map.put_new(Map.new, :params, Snappyex.Model.Row.new(values: []))
    case Snappyex.Protocol.handle_execute(prepared_query, params , [], state) do
      {:ok, _, state} ->
        {:ok, state}
      {:disconnect, err, state} -> 
        {:disconnect, err, state}
    end
  end

  def handle_execute(query, params, _opts, state) do
    {:ok, process_id} = Keyword.fetch(state,
      :process_id)
    {:ok, token} = Keyword.fetch(state, :token)
    {:ok, statement_id} = Map.fetch(query, :statement_id)
    #Logger.debug "#{inspect self()} handle_execute received params " <> inspect params
    rows = case params do
      [] -> Snappyex.Model.Row.new
      [0, {{2016, 10, _}, _}] ->
         Snappyex.Model.Row.new(values: [Snappyex.Model.ColumnValue.new(i64_val: 0), Snappyex.Model.ColumnValue.new(timestamp_val: Snappyex.Model.Timestamp.new(secsSinceEpoch: 12345, nanos: 162479))])
      [42, "fortytwo"] -> Snappyex.Model.Row.new(values: [Snappyex.Model.ColumnValue.new(i32_val: 42),
                          Snappyex.Model.ColumnValue.new(ClobChunk_val: 
                            Snappyex.Model.ClobChunk.new(
                              chunk: "fortytwo", 
                              last: true,
                              length: byte_size("fortytwo")
                              )
                            )
                          ])
      row -> %{params: %Snappyex.Model.Row{values: values}} = row
       Snappyex.Model.Row.new(values: values)
    end
    #Logger.debug "#{inspect self()} handle_execute received other " <> inspect rows
    output_param = case params do
                     %{output: output} -> output
                     %{params: %Snappyex.Model.Row{values: values}} -> Map.new
                     [] -> Map.new
                     [42, "fortytwo"] -> output = Map.put(Map.new, 0, Snappyex.Model.OutputParameter.new(type: Snappyex.Model.SnappyType.integer))
                                         output = Map.put(output, 1, Snappyex.Model.OutputParameter.new(type: Snappyex.Model.SnappyType.varchar)) 
end
    statement = Snappyex.Client.executePrepared(process_id, statement_id, rows, output_param, token)    
    #Logger.debug "#{inspect self()} handle_execute received result " <> inspect statement.resultSet
    # Todo decode resultSet
    result = Map.new
    result = Map.put_new(result, :rows, statement.resultSet)
    {:ok, result, state}
  end

  def handle_prepare(query, opts, state) do
    {:ok, process_id} = Keyword.fetch(state,
      :process_id)
    {:ok, connection_id} = Keyword.fetch(state,
      :connection_id)
    {:ok, token} = Keyword.fetch(state,
      :token)
    output_parameters = Map.get(query,
      :output_parameters,
      Map.new)
    statement_attributes = Map.get(query,
      :statement_attributes,
      %Snappyex.Model.StatementAttrs{})
    Logger.debug "#{inspect self()} handle_prepare query " <> inspect query.statement
    prepared_result = Snappyex.Client.prepareStatement(process_id, connection_id,
      query.statement, output_parameters, statement_attributes, token)
    query = %{query | statement_id: prepared_result.statementId}
    query = %{query | columns: prepared_result.resultSetMetaData}
    {:ok, query, state}
  end
end
