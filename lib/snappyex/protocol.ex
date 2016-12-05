defmodule Snappyex.Protocol do
  @moduledoc false
  @behaviour DBConnection 
  @repeatable_read 3

  require Logger

  def connect(opts) do
    Process.flag(:trap_exit, true)
    {:ok, host} = Keyword.fetch(opts, :host)
    {:ok, port} = Keyword.fetch(opts, :port)
    status = Snappyex.Client.start_link(host, port)
    connect_start_link(status, opts)
  end
  
   def connect_start_link({:error, err}, _opts) do
    {:error, err}
  end

  def connect_start_link({:ok, pid}, opts) do
    {:ok, token_size} = Keyword.fetch(opts, :token_size)
    use_string_for_decimal = Keyword.get(opts, :use_string_for_decimal, false)
    {:ok, username} = Keyword.fetch(opts, :username)
    {:ok, password} = Keyword.fetch(opts, :password)
    {:ok, properties} = Keyword.fetch(opts, :properties)
    {:ok, local_hostname} = :inet.gethostname
    {:ok, properties} = Snappyex.Client.openConnection(pid, Snappyex.Model.OpenConnectionArgs.new(clientHostName: local_hostname, clientID: "ElixirClient1|0x" <> Base.encode16(inspect self), userName: username, password: password, security: Snappyex.Model.SecurityMechanism.plain, properties: properties, tokenSize: token_size, useStringForDecimal: use_string_for_decimal))
    state = [process_id: pid, connection_id: properties.connId, client_host_name: properties.clientHostName, client_id: properties.clientID, cache: Snappyex.Cache.new(), token: properties.token]    
    {:ok, state}
  end

  def checkout(state) do
    {:ok, state}
  end

  def checkin(state) do
    {:ok, state}
  end

  def disconnect(err, %{types: ref}) when is_reference(ref) do
    err
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

  defp prepare_insert(id, num_params, %Snappyex.Query{name: name, ref: ref} = query, state) do
    {:ok, cache} = Keyword.fetch(state,
      :cache)
    ref = ref || make_ref()
    true = Snappyex.Cache.insert_new(cache, name, id, ref)
    %{query | ref: ref, num_params: num_params}
  end

  def handle_commit(_opts, state) do
    query = %Snappyex.Query{statement: 'COMMIT'}
    {:ok, prepared_query, state} = Snappyex.Protocol.handle_prepare(query, [], state)
    params = Map.put_new(Map.new, :params, Snappyex.Model.Row.new(values: []))
    case Snappyex.Protocol.handle_execute(prepared_query, params , [], state) do
      {:ok, result, state} ->
        {:ok, result, state}
      {:disconnect, err, state} -> 
        {:disconnect, err, state}
    end
  end
  def handle_begin(opts, state) do
    {:ok, process_id} = Keyword.fetch(state,
      :process_id)
    {:ok, token} = Keyword.fetch(state, :token)
    {:ok, flags} = Map.fetch(opts, :flags)    
    case Snappyex.Client.beginTransaction(process_id, @repeatable_read, flags, token) do
      {:ok, result} ->
        {:ok, result, state}
      {:error, error} ->
        {:error, error, state}
    end
  end
  
  def handle_close(query, _opts, state) do    
    {:ok, process_id} = Keyword.fetch(state,
      :process_id)
    {:ok, token} = Keyword.fetch(state, :token)
    case close_lookup(query, state) do
      {:close, id} ->
        Snappyex.Client.closeStatement(process_id, id, token)
        {:ok, nil, state}
      :closed ->
        {:ok, nil, state}
    end
  end

  defp close_lookup(%Snappyex.Query{name: name}, state) do
    {:ok, cache} = Keyword.fetch(state,
      :cache)
    case Snappyex.Cache.take(cache, name) do
      id when is_integer(id) ->
        {:close, id}
      nil ->
        :closed
    end
  end

  def handle_execute(query, params, _opts, state) do
    case execute_lookup(query, state) do
      {:execute, id, query} ->
        execute(id, query, params, state)
      {:prepare_execute, query} ->
        prepare_execute(&prepare(query, &1), params, state)
      {:close_prepare_execute, id, query} ->
        prepare_execute(&close_prepare(id, query, &1), params, state)
    end
  end

  defp prepare_execute(prepare, params, state) do
    case prepare.(state) do
      {:ok, query, state} ->
        id = prepare_execute_lookup(query, state)
        execute(id, query, params, state)
      {err, _, _} = error when err in [:error, :disconnect] ->
        error
    end
  end

  def execute(id, _query, params, state) do
     {:ok, process_id} = Keyword.fetch(state,
      :process_id)
     {:ok, token} = Keyword.fetch(state,
      :token)
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
    case Snappyex.Client.executePrepared(process_id, id, rows, nil, token) do
      {:ok, statement} ->
        result = Map.new
        result = Map.put_new(result, :rows, statement.resultSet)
        {:ok, result, state}
      {:error, error} ->
        {:error, error, state}
    end
  end
  
 defp prepare_execute_lookup(%Snappyex.Query{name: name}, state) do
    {:ok, cache} = Keyword.fetch(state,
      :cache)
    Snappyex.Cache.id(cache, name)
  end  

  defp execute_lookup(%Snappyex.Query{name: name, ref: ref} = query, state) do
    {:ok, cache} = Keyword.fetch(state,
      :cache)
    case Snappyex.Cache.lookup(cache, name) do
      {id, ^ref} ->
        {:execute, id, query}
      {id, _} ->
        Snappyex.Cache.delete(cache, name)
        {:close_prepare_execute, id, query}
      nil ->
        {:prepare_execute, query}
    end
  end

  def handle_prepare(query, _opts, state) do 
    query = Map.put_new(query, :name, "")
    case prepare_lookup(query, state) do
      {:prepared, query} ->
        {:ok, query, state}       
      {:prepare, query} ->
        prepare(query, state)        
      {:close_prepare, id, query} ->
        close_prepare(id, query, state)
    end
  end
  
  defp close_prepare(id, %Snappyex.Query{statement: statement} = query, state) do
    {:ok, process_id} = Keyword.fetch(state,
      :process_id)
    {:ok, token} = Keyword.fetch(state,
      :token)
    Snappyex.Client.closeStatement(process_id, id, token)
    prepare(query, state)
  end

  def prepare(query, state) do
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
      case  Snappyex.Client.prepareStatement(process_id, connection_id,
        query.statement, output_parameters, statement_attributes, token) do
          {:ok, prepared_result} -> 
            prepare_result(query, prepared_result, state)   
          {:error, error} ->
            {:error, error, state}
      end
  end

  defp prepare_result(query, prepared_result, state) do
    query = %{query | columns: prepared_result.resultSetMetaData}         
    num_params = case prepared_result.resultSetMetaData do
      nil -> 0
      result -> Enum.count(result)
    end
    query = prepare_insert(prepared_result.statementId, num_params, %Snappyex.Query{query | ref: make_ref()}, state)
    {:ok, query, state}
  end

  defp prepare_lookup(%Snappyex.Query{name: name} = query, state) do
    {:ok, cache} = Keyword.fetch(state,
      :cache)        
    case Snappyex.Cache.take(cache, name) do
      id when is_integer(id) ->
        {:close_prepare, id, query}
      nil ->
        {:prepare, query}
    end
  end
end
