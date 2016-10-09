ExUnit.start()

defmodule Snappyex.TestHelper do
  defmacro query(stat, params, opts \\ []) do
    quote do
      case Snappyex.prepare_execute(var!(context)[:pid], unquote(stat),
                          unquote(params), unquote(defaults(opts))) do
        {:ok, _, result} -> result.rows
        #{:error, %Snappyex.Error{} = err} -> err
      end
    end
  end

  defmacro prepare(name, stat, opts \\ []) do
    quote do
      case Snappyex.prepare(var!(context)[:pid], unquote(name),
                                     unquote(stat), unquote(opts)) do
        {:ok, %Snappyex.Query{} = query} -> query
        {:error, %Snappyex.Error{} = err} -> err
      end
    end
  end

  defmacro execute(query, params, opts \\ []) do
    quote do
      case Snappyex.execute(var!(context)[:pid], unquote(query),
                                       unquote(params), unquote(opts)) do
        {:ok, %Snappyex.Result{rows: nil}} -> :ok
        {:ok, %Snappyex.Result{rows: rows}} -> rows
        {:error, %Snappyex.Error{} = err} -> err
      end
    end
  end

  defmacro close(query, opts \\ []) do
    quote do
      case Snappyex.close(var!(context)[:pid], unquote(query),
                                     unquote(opts)) do
        :ok -> :ok
        {:error, %Snappyex.Error{} = err} -> err
      end
    end
  end

  defmacro transaction(fun, opts \\ []) do
    quote do
      Snappyex.transaction(var!(context)[:pid], unquote(fun),
                                      unquote(opts))
    end
  end

  def capture_log(fun) do
    Logger.remove_backend(:console)
    fun.()
    Logger.add_backend(:console, flush: true)
  end

  defp defaults(opts) do
    opt = Keyword.put_new(opts, :pool_timeout, :infinity)
    opt = Keyword.put_new(opts, :ownership_timeout, :infinity)
    opt = Keyword.put_new(opts, :timeout, :infinity)
  end
end
