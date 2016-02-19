defmodule Snappyex.Query do

  defstruct [:name, :statement, :param_formats, :encoders, :columns,
             :result_formats, :decoders, :types]
end

defimpl DBConnection.Query, for: Snappyex.Query do
  alias Snappyex.Query
  def describe(query, opts) do
  query
  end
  def encode(%Query{}, params, opts) do  
  params
  end
  def decode(%Query{decoders: nil}, res, _), do: res    
  def parse(query, _) do
    query
  end
end
