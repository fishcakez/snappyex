defmodule Snappyex.Protocol do
  @moduledoc false
  @behaviour DBConnection

  alias Snappyex.Query
  
  def connect(opts) do
    state = Keyword.merge(Keyword.new(), opts)
    host = Keyword.get(opts, :host, "localhost")
    port = Keyword.get(opts, :port, 1531)
    token_size = Keyword.get(opts, :token_size, 16)
    use_string_for_decimal = Keyword.get(opts, :use_string_for_decimal, false)
    username = Keyword.get(opts, :username, 'APP')
    password = Keyword.get(opts, :password, 'APP')
    properties = Keyword.get(opts, :properties, HashDict.new)
    {:ok, local_hostname} = :inet.gethostname
    {:ok, pid} = Snappyex.Client.start_link(host, port)
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
      {:ok, result, state} ->
        {:ok, state}
      true -> 
        {:disconnect, Exception.t, state}
    end
  end

  def handle_execute(query, params, opts, state) do
    {:ok, process_id} = Keyword.fetch(state,
      :process_id)
    {:ok, connection_id} = Keyword.fetch(state, :connection_id)
    {:ok, token} = Keyword.fetch(state, :token)
    {:ok, statement_id} = Map.fetch(query, :statement_id)
    row = case params do
            %{params: row} -> row
            [] -> Snappyex.Model.Row.new
          end
    output_param = case params do
                     %{output: output} -> output
                     _ -> Map.new()
                   end
    statement = Snappyex.Client.executePrepared(process_id, statement_id, row, output_param, token)
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
    attributes = Map.get(query,
      :attributes, %Snappyex.Model.StatementAttrs{})
    prepared_result = Snappyex.Client.prepareStatement(process_id, connection_id,
      query.statement, output_parameters, statement_attributes, token)
    query = %{query | statement_id: prepared_result.statementId}
    query = %{query | columns: prepared_result.resultSetMetaData}
    {:ok, query, state}
  end
end
