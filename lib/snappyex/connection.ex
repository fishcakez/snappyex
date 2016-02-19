defmodule Snappyex.Connection do
  alias Snappyex.Query

  @typedoc ~s(
  A connection process name, pid or reference.
  A connection reference is used when making multiple requests to the same
  connection, see `transaction/3` and `:after_connect` in `start_link/1`.
  )

  @type conn :: DBConnection.conn
  @timeout 5000

  def query(conn, statement, params, opts \\ []) do
    query = %Query{name: "", statement: statement}
    case DBConnection.query(conn, query, params, defaults(opts)) do
      {:error, %ArgumentError{} = err} ->
        raise err
      other ->
        other
    end
  end

  def execute(conn, query, params, opts \\ []) do
    case DBConnection.execute(conn, query, params, defaults(opts)) do
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
