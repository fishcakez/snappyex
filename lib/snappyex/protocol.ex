defmodule Snappyex.Protocol do
  @moduledoc false

  alias Snappyex.Query
  
  def connect(opts) do
    state = Keyword.merge(Keyword.new(), opts) 
    host = Keyword.get(opts, :hostname, 'localhost')
    port = Keyword.get(opts, :port, 1531)
    {:ok, username} = Keyword.fetch(opts, :username)
    {:ok, password} = Keyword.fetch(opts, :password)
    {:ok, properties} = Keyword.fetch(opts, :properties)
    {:ok, client} = :thrift_client_util.new(host, port, :g_f_x_d_service_thrift, [])
    {:ok, connection}= Snappyex.Client.start_link(client)
    state = Keyword.put_new(state, :connection, connection)
    {:ConnectionProperties, connection_id, client_hostname, client_id, _, token} = Snappyex.Client.openConnection(Snappyex.Models.OpenConnectionArgs.new(clientHostName: host, clientID: "ElixirClient1|0x" <> Base.encode16(inspect self), userName: username, password: password,  security: Snappyex.Models.SecurityMechanism.plain, properties: properties))
    state = Keyword.put_new(state, :connection_id, connection_id)
    state = Keyword.put_new(state, :client_host_name, client_hostname)
    state = Keyword.put_new(state, :client_id, client_id)
    state = Keyword.put_new(state, :token, token)
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
    query  = %Query{statement: 'SELECT 1'}
    case handle_execute_close(query,  HashDict.new, [], state) do
      {:ok, %Snappyex.Result{}, state} ->
        {:ok, state}
      true -> 
        {:disconnect, Exception.t, state}
    end
  end

  def handle_execute(query, params, opts, state) do
    {:ok, connection_id} = Keyword.fetch(state, :connection_id)
    {:ok, token} = Keyword.fetch(state, :token)
    pending_transaction_attrs = Keyword.get(state, :pending_transaction_attrs, HashDict.new)
    parameters_batch = Keyword.get(state, :parameters_batch, [])
    statement_attributes = Keyword.get(state, :statement_attributes, HashDict.new)
    result = Map.new
    %Snappyex.Models.StatementResult{resultSet: result_set, generatedKeys: generated_keys, preparedResult: prepared_result} = Snappyex.Client.prepareAndExecute(connection_id, query.statement, parameters_batch, pending_transaction_attrs, Snappyex.Models.StatementAttrs.new(pendingTransactionAttrs: statement_attributes), token)
    result = Map.put_new(result, :result_set,  result_set)
    result = Map.put_new(result, :generated_keys, generated_keys)
    result = Map.put_new(result, :statement_id, prepared_result.statementId)
    {:ok, result, state}
  end

  def handle_execute_close(query, params, opts, state) do
    {:ok, connection_id} = Keyword.fetch(state, :connection_id)
    {:ok, token} = Keyword.fetch(state, :token)
    pending_transaction_attrs = Keyword.get(state, :pending_transaction_attrs, HashDict.new)
    parameters_batch = Keyword.get(state, :parameters_batch, [])
    statement_attributes = Keyword.get(state, :statement_attributes, HashDict.new)
    %Snappyex.Models.StatementResult{resultSet: result_set, generatedKeys: generated_keys, preparedResult: prepared_result} = Snappyex.Client.prepareAndExecute(connection_id, query.statement, parameters_batch, pending_transaction_attrs, Snappyex.Models.StatementAttrs.new(pendingTransactionAttrs: statement_attributes), token)
    result = %Snappyex.Result{columns: generated_keys, rows: result_set}
    Snappyex.Client.closeStatement(prepared_result.statementId, token)
    {:ok, result, state}
  end

  def handle_prepare(query, opts, state) do
  # Todo
    {:ok, query, state}
  end
end
