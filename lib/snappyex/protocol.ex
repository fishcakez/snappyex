defmodule Snappyex.Protocol do
  @moduledoc false

  alias Snappyex.Query
  
  def connect(opts) do
    state = Keyword.merge(Keyword.new(), opts) 
    host = Keyword.get(opts, :hostname, 'snappydata')
    port = Keyword.get(opts, :port, 1531)
    token_size = Keyword.get(opts, :token_size, 16)
    use_string_for_decimal = Keyword.get(opts, :use_string_for_decimal, false)
    {:ok, username} = Keyword.fetch(opts, :username)
    {:ok, password} = Keyword.fetch(opts, :password)
    {:ok, properties} = Keyword.fetch(opts, :properties)
    {:ok, client} = :thrift_client_util.new(host, port, :snappy_data_service_thrift, [])
    {:ok, connection}= Snappyex.Client.start_link(client)
    state = Keyword.put_new(state, :connection, connection)
    {:ConnectionProperties, connection_id, client_hostname, client_id, _, token} = Snappyex.Client.openConnection(Snappyex.Models.OpenConnectionArgs.new(clientHostName: host, clientID: "ElixirClient1|0x" <> Base.encode16(inspect self), userName: username, password: password,  security: Snappyex.Models.SecurityMechanism.plain, properties: properties, tokenSize: token_size, useStringForDecimal: use_string_for_decimal))
    state = Keyword.put_new(state, :connection_id, connection_id)
    state = Keyword.put_new(state, :client_host_name, client_hostname)
    state = Keyword.put_new(state, :client_id, client_id)
    state = Keyword.put_new(state, :token, token)
    IO.inspect state
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
    case handle_execute(query, HashDict.new , [], state) do
      {:ok, %{}, state} ->
        {:ok, state}
      true -> 
        {:disconnect, Exception.t, state}
    end
  end

  def handle_execute(query, params, opts, state) do
    {:ok, connection_id} = Keyword.fetch(state, :connection_id)
    {:ok, token} = Keyword.fetch(state, :token)
    attrs = Keyword.get(state, :attrs, HashDict.new)
    output_parameters = Keyword.get(state, :output_parameters, [])
    statement_attributes = Keyword.get(state, :statement_attributes, HashDict.new)
    result = Map.new
    IO.inspect Snappyex.Client.prepareAndExecute(connection_id, query.statement, output_parameters, attrs, Snappyex.Models.StatementAttrs.new(pendingTransactionAttrs: statement_attributes), token)
    %Snappyex.Models.StatementResult{batchUpdateCounts: batch_update_counts, generatedKeys: generated_keys, preparedResult: prepared_result, procedureOutParams: procedure_out_params, resultSet: result_set, updateCount: update_count, warnings: warnings} = Snappyex.Client.prepareAndExecute(connection_id, query.statement, output_parameters, attrs, Snappyex.Models.StatementAttrs.new(pendingTransactionAttrs: statement_attributes), token)
    result = Map.put_new(result, :batch_update_counts, batch_update_counts)
    result = Map.put_new(result, :generated_keys, generated_keys)
    result = Map.put_new(result, :prepared_result, prepared_result)
    result = Map.put_new(result, :procedure_out_params, procedure_out_params)
    result = Map.put_new(result, :result_set,  result_set)
    result = Map.put_new(result, :update_count, update_count)
    result = Map.put_new(result, :warnings, warnings)
    {:ok, result, state}
  end

  def handle_execute_close(query, params, opts, state) do
    {:ok, connection_id} = Keyword.fetch(state, :connection_id)
    {:ok, token} = Keyword.fetch(state, :token)
    pending_transaction_attrs = Keyword.get(query, :pending_transaction_attrs, HashDict.new)
    parameters_batch = Keyword.get(query, :parameters_batch, [])
    statement_attributes = Keyword.get(query, :statement_attributes, HashDict.new)
    %Snappyex.Models.StatementResult{resultSet: result_set, generatedKeys: generated_keys, preparedResult: prepared_result} = Snappyex.Client.prepareAndExecute(connection_id, query.statement, parameters_batch, pending_transaction_attrs, Snappyex.Models.StatementAttrs.new(pendingTransactionAttrs: statement_attributes), token)
    result = Map.new
    result = %Snappyex.Result{columns: generated_keys, rows: result_set}
    Snappyex.Client.closeStatement(prepared_result.statementId, token)
    {:ok, result, state}
  end

  def handle_prepare(query, opts, state) do
    {:ok, connection_id} = Keyword.fetch(state,
      :connection_id)
    {:ok, token} = Keyword.fetch(state,
      :token)
    #output_parameters = Map.get(query,
    #  :output_parameters,
    #  %Snappyex.Models.OutputParameter{})
    attributes = Map.get(query,
      :attributes, %Snappyex.Models.StatementAttrs{})
    %Snappyex.Models.PrepareResult{statementId: statement_id} = Snappyex.Client.prepareStatement(connection_id,
      query.statement, nil, nil, token)
    query = Map.put_new(query,
      :statement_id,
      statement_id)
    {:ok, query, state}
  end
end
