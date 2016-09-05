defmodule Snappyex.Protocol do
  @moduledoc false
  @behaviour DBConnection

  alias Snappyex.Query
  
  def connect(opts) do
    state = Keyword.merge(Keyword.new(), opts)
    host = Keyword.get(opts, :host, "localhost")
    host = String.to_char_list(host)
    port = Keyword.get(opts, :port, 1531)
    token_size = Keyword.get(opts, :token_size, 16)
    use_string_for_decimal = Keyword.get(opts, :use_string_for_decimal, false)
    username = Keyword.get(opts, :username, 'APP')
    password = Keyword.get(opts, :password, 'APP')
    properties = Keyword.get(opts, :properties, HashDict.new)
    case :thrift_client_util.new(host, port, :snappy_data_service_thrift, []) do
      {:ok, client} -> Snappyex.Client.start_link(client)
      properties = Snappyex.Client.openConnection( Snappyex.Model.OpenConnectionArgs.new(clientHostName: host, clientID: "ElixirClient1|0x" <> Base.encode16(inspect self), userName: username, password: password,  security: Snappyex.Model.SecurityMechanism.plain, properties: properties, tokenSize: token_size, useStringForDecimal: use_string_for_decimal))
      state = Keyword.put_new(state, :connection_id, properties.connId)
      state = Keyword.put_new(state, :client_host_name, properties.clientHostName)
      state = Keyword.put_new(state, :client_id, properties.clientID)
      state = Keyword.put_new(state, :token, properties.token)
      {:ok, state}
      {:error, :econnrefused} -> {:error, :econnrefused}
      {:error, :nxdomain} -> {:error, :nxdomain}
    end
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
    {:ok, connection_id} = Keyword.fetch(state, :connection_id)
    {:ok, token} = Keyword.fetch(state, :token)
    attrs = Keyword.get(state, :attrs, HashDict.new)
    statement_attributes = Keyword.get(state, :statement_attributes, HashDict.new)
    {:ok, statement_id} = Map.fetch(query, :statement_id)
    result = Map.new
    statement = Snappyex.Client.executePrepared(statement_id, Snappyex.Model.Row.new(values: []), nil, token)
    result = Map.put_new(result, :row_set, statement.resultSet)
    {:ok, result, state}
  end

  def handle_prepare(query, opts, state) do
    {:ok, connection_id} = Keyword.fetch(state,
      :connection_id)
    {:ok, token} = Keyword.fetch(state,
      :token)
    output_parameters = Map.get(query,
      :output_parameters,
      Map.new)
    statement_attributes = Map.get(query,
      :output_parameters,
      %Snappyex.Model.StatementAttrs{})
    attributes = Map.get(query,
      :attributes, %Snappyex.Model.StatementAttrs{})
    prepared_result = Snappyex.Client.prepareStatement(connection_id,
      query.statement, output_parameters, statement_attributes, token)
    query = %{query | statement_id: prepared_result.statementId}
    query = %{query | columns: prepared_result.resultSetMetaData}
    {:ok, query, state}
  end
end
