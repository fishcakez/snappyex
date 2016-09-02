defmodule Snappyex do
  @timeout 5000

  alias Snappyex.Query
  def start_link(opts) do
    DBConnection.start_link(Snappyex.Protocol, opts)
  end

  def disconnect(err, state) do
    case DBConnection.disconnect(err, state) do
      {error, err} ->
        raise err
      other ->
        other
    end
  end

  def query(conn, statement, params, opts \\ []) do
    query = %Query{name: "", statement: statement}
    case DBConnection.prepare_execute(conn, query, params, defaults(opts)) do
      {:ok, result, state} -> {:ok, result}
      other ->
        other
    end
  end

  def query!(conn, statement, params, opts \\ []) do
    query = %Query{name: "", statement: statement}
    opts =
      opts
      |> defaults()
      |> Keyword.put(:function, :prepare_execute)
    {_, result} = DBConnection.prepare_execute!(conn, query, params, opts)
    result
  end

  @doc """
  Returns a supervisor child specification for a DBConnection pool.
  """
  @spec child_spec(Keyword.t) :: Supervisor.Spec.spec
  def child_spec(opts) do
    DBConnection.child_spec(Snappyex.Protocol, opts)
  end

  defp defaults(opts) do
    Keyword.put_new(opts, :timeout, @timeout)
  end
end
