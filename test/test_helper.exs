ExUnit.start()

defmodule Snappyex.TestHelper do

  defmacro query(stat, params, opts \\ []) do
    quote do
      case Snappyex.prepare_execute(var!(context)[:pid], unquote(stat),
                          unquote(params), unquote(defaults(opts))) do
        {:ok, _, result} -> result.rows
        {:error, err} -> err.exceptionData.reason
      end
    end
  end

  defmacro prepare(stat, params, opts \\ []) do
    quote do
      case Snappyex.prepare(var!(context)[:pid], unquote(stat),
                                     unquote(params), unquote(opts)) do
        {:ok, %Snappyex.Query{} = query} -> query
        {:error, err} -> err.exceptionData.reason
      end
    end
  end

  defmacro execute(query, params, opts \\ []) do
    quote do
      case Snappyex.execute(var!(context)[:pid], unquote(query),
                                       unquote(params), unquote(opts)) do
        {:ok, %Snappyex.Result{rows: nil}} -> :ok
        {:ok, %Snappyex.Result{rows: rows}} -> rows
        {:error, err} -> err.exceptionData.reason
      end
    end
  end

  defmacro close(query, opts \\ []) do
    quote do
      case Snappyex.close(var!(context)[:pid], unquote(query),
                                     unquote(opts)) do
        :ok -> :ok
        {:error, err} -> err.exceptionData.reason
      end
    end
  end

  defmacro transaction(fun, opts \\ []) do
    quote do
      Snappyex.transaction(var!(context)[:pid], unquote(fun),
                                      unquote(opts))
    end
  end

  def snappydata_address() do
     "104.196.243.201" 
  end 

  def snappydata_properties() do
     dict = HashDict.put(HashDict.new(), "load-balance", "false")
     dict = HashDict.put(dict, "sync-commits", "true")
  end
  
  def capture_log(fun) do
    Logger.remove_backend(:console)
    fun.()
    Logger.add_backend(:console, flush: true)
  end

  defp defaults(opts) do
    opts
  end
end
