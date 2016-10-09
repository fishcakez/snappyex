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
    #Logger.debug "#{inspect self()} connect_start_link " <> inspect properties
    state = Keyword.put_new(state, :process_id, pid)
    state = Keyword.put_new(state, :connection_id, properties.connId)
    state = Keyword.put_new(state, :client_host_name, properties.clientHostName)
    state = Keyword.put_new(state, :client_id, properties.clientID)
    state = Keyword.put_new(state, :token, properties.token)
    
    queries_new

    # experimental
    #state = Keyword.put_new(state, :connection, []) 
    #{:ok, connection} = Keyword.fetch(state, :connection)
    #state = Keyword.put(state, :connection,  connection ++ [%{connection_id: properties.connId, token: properties.token}])
    #Logger.debug "#{inspect self()} connect_start_link" <> inspect state
    # end experimental
    {:ok, state}
  end

  def checkout(s) do
    #{:ok, connection} = Keyword.fetch(s, :connection)
    #{:ok, [%{connection_id: connection_id}]} = Keyword.fetch(s, :connection)
    #{:ok, [%{token: token}]} = Keyword.fetch(s, :connection)
    #s = Keyword.put(s, :connection,  connection ++ [%{connection_id: connection_id, token: token}])
    #Logger.debug "#{inspect self()} checkout" <> inspect s
    {:ok, s}
  end

  def checkin(s) do
    #Logger.debug "#{inspect self()} checkin" <> inspect s
    {:ok, s}
  end

  def disconnect(err, %{types: ref}) when is_reference(ref) do
    raise err
  end

  def disconnect(_, state) do
    {:ok, process_id} = Keyword.fetch(state,
      :process_id)
    {:ok, connection_id} = Keyword.fetch(state, :connection_id)
    {:ok, token} = Keyword.fetch(state, :token)
    Snappyex.Client.closeConnection(process_id, connection_id, token)
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
    #Logger.debug "#{inspect self()} handle_execute" <> inspect state
    {:ok, process_id} = Keyword.fetch(state,
      :process_id)
    {:ok, connection_id} = Keyword.fetch(state,
      :connection_id)
    {:ok, token} = Keyword.fetch(state, :token)
    #Logger.debug "#{inspect self()} handle_execute token" <> token
    {:ok, statement_id} = Map.fetch(query, :statement_id)
    #Logger.debug "#{inspect self()} handle_execute received params " <> inspect params    
    #Logger.debug "#{inspect self()} handle_execute query_prepare" <> inspect query_prepare(state, query)

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
                                         Map.put(output, 1, Snappyex.Model.OutputParameter.new(type: Snappyex.Model.SnappyType.clob)) 
                   end
    #Logger.debug "#{inspect self()} handle_execute output_param" <> inspect output_param          
    statement = Snappyex.Client.executePrepared(process_id, statement_id, rows, nil, token)    
    #Logger.debug "#{inspect self()} handle_execute received result " <> inspect statement.resultSet
    #Logger.debug "#{inspect self()} handle_execute received result " <> inspect statement
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
    #Logger.debug "#{inspect self()} handle_prepare query " <> inspect query.statement
    prepared_result = Snappyex.Client.prepareStatement(process_id, connection_id,
      query.statement, output_parameters, statement_attributes, token)
    query = %{query | statement_id: prepared_result.statementId}
    query = %{query | columns: prepared_result.resultSetMetaData}
    {:ok, query, state}
  end

  defp queries_new(), do: :ets.new(__MODULE__, [:set, :public])

  defp query_prepare(%{queries: queries}, query) when queries != nil do
    %Query{name: name, ref: ref} = query
    try do
      :ets.lookup_element(queries, name, 2)
    rescue
      ArgumentError ->
        {:parse_describe, query}
    else
      ^ref ->
        {:ready, query}
      _ ->
        {:close_parse_describe, query}
    end
  end
end
