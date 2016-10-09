defmodule Snappyex do
  @timeout 15_000

  alias Snappyex.Query
  def start_link(opts) do
    DBConnection.start_link(Snappyex.Protocol, defaults(opts))
  end

  def execute(conn, query, params, opts \\ []) do
    case DBConnection.execute(conn, query, params, defaults(opts)) do
      {:ok, result, state} -> {:ok, result}
      {:error, err} ->
        raise err
    end
  end

  def prepare_execute(conn, statement, params, opts \\ []) do
    query = %Query{statement: statement}
    case DBConnection.prepare_execute(conn, query, params, defaults(opts)) do
      {:ok, query, result} -> {:ok, query, result}
      {:error, err} ->
          raise err
    end    
  end

  def prepare(conn, query, opts \\ []) do
    case DBConnection.prepare(conn, query, defaults(opts)) do
      {:ok, query} ->
        {:ok, query}
      {:error, err} ->
        raise err
    end
  end

  @doc """
  Returns a supervisor child specification for a DBConnection pool.
  """
  @spec child_spec(Keyword.t) :: Supervisor.Spec.spec
  def child_spec(opts) do
    DBConnection.child_spec(Snappyex.Protocol, opts)
  end

  defp defaults(opts) do
    opts =
    opts
    |> Keyword.put_new(:timeout, @timeout)
    |> Keyword.put_new(:host, "localhost")
    |> Keyword.put_new(:port, 1531)
    |> Keyword.put_new(:username, 'APP')
    |> Keyword.put_new(:password, 'APP')
    |> Keyword.put_new(:properties, HashDict.new)
    |> Keyword.put_new(:token_size, 16)
    |> Keyword.put_new(:pool, DBConnection.Poolboy)
  end
end
