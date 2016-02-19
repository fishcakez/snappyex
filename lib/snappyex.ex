defmodule Snappyex do

  @timeout 5000
  
  alias Snappyex.Query
  def start_link(opts) do
    DBConnection.start_link(Snappyex.Protocol, opts)
  end

  def query(conn, statement, params, opts \\ []) do
    query = %Query{name: "", statement: statement}
    case DBConnection.query(conn, query, params, defaults(opts)) do
      {:error, %ArgumentError{} = err} ->
        raise err
      other ->
        other
    end
  end

  defp defaults(opts) do
    Keyword.put_new(opts, :timeout, @timeout)
  end
end
