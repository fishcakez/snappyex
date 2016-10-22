# Portions from https://github.com/elixir-ecto/postgrex/blob/af1b62ae06121f02f2d63f1446eb99b962884edb/lib/postgrex/extensions/numeric.ex

defmodule Snappyex.Query do
  defstruct [:ref, :name, :statement, :statement_id, :param_formats, :encoders, :columns,
             :result_formats, :decoders, :types]
end

defimpl DBConnection.Query, for: Snappyex.Query do
  alias Snappyex.Query
  use Timex
  def describe(query, _opts) do
    query
  end
  def encode(%Query{}, params, _opts) do  
    params
  end

  def decode(rows, columns), do: decode(rows, columns, [])
  def decode([row | rows], columns, acc) do
    decode(rows, columns, [decode_row(row.values, columns, []) | acc])
  end
  def decode([], _, acc), do: Enum.reverse(acc)
  def decode(%Query{decoders: nil, columns: _columns}, res, _) do
    _mapper = fn x -> x end
    {:ok, rows} = Map.fetch(res, :rows)    
    rows = decode_row_set(rows)
    num_rows = case rows do 
      nil -> 0
      _ -> length(rows)
    end
    %Snappyex.Result{rows: rows, num_rows: num_rows}
  end
  def decode_row([field | rows], [decoder | cols], acc) do 
    type = Snappyex.Model.SnappyType.value(decoder)
    decode_row(rows, cols, [decode_field(field, type.ordinal) | acc])
  end
  def decode_row([], [], acc), do: Enum.reverse(acc)
  def decode_field(value, :boolean), do: value.bool_val
  def decode_field(value, :tinyint), do: value.i16_val
  def decode_field(value, :integer) do 
    value.i32_val
  end
  def decode_field(value, :bigint), do: value.i64_val
  def decode_field(value, :float), do: value.float_val
#  def decode_field(column_value, :real), do: elem(column_value, @decimal_val)
  def decode_field(value, :double), do: value.double_val
  def decode_field(value, :decimal) do 
    %Snappyex.Model.Decimal{magnitude: _magnitude, scale: _scale, signum: _signum} = value.decimal_val
    #decode_numeric(signum, magnitude)
  end  

  def decode_field(value, :char), do: value.string_val
  def decode_field(value, :varchar), do: value.string_val
#  def decode_field(column_value, :longvarchar), do: elem(column_value, @string_val)
  def decode_field(value, :date) do
    %Snappyex.Model.DateTime{secsSinceEpoch: secsSinceEpoch} = value.date_val
    {:ok, time} = DateTime.from_unix(secsSinceEpoch)
    time
  end
  def decode_field(value, :time) do
    %Snappyex.Model.DateTime{secsSinceEpoch: secsSinceEpoch} = value.time_val
    {:ok, time} = DateTime.from_unix(secsSinceEpoch)
    {_, {hour, minute, second}} = Timex.to_erl(time)
    {hour, minute, second, 0}
  end
  def decode_field(value, :timestamp) do
    # TODO Extract nanoseconds and add it to time
    # https://github.com/elixir-ecto/postgrex/blob/master/lib/postgrex/extensions/timestamp.ex#L24
    value.timestamp_val
  end
  def decode_field(value, :binary), do: value.binary_val
  def decode_field(value, :varbinary), do: value.binary_val
  def decode_field(value, :longvarbinary), do: value.binary_val
  def decode_field(value, :blob), do: decode_blob(value.blob_val)
  def decode_field(value, :clob) do 
    decode_clob(value.clob_val)
  end
#  def decode_field(column_value, :sqlxml), do: elem(column_value, @string_val)
#  def decode_field(column_value, :nulltype), do: elem(column_value, )
#  def decode_field(column_value, :array), do: elem(column_value, )
#  def decode_field(column_value, :map), do: elem(column_value, )
#  def decode_field(column_value, :struct), do: elem(column_value, )
  def decode_field(value, :other), do: raise ArgumentError, "can not be decoded: " <> IO.inspect(value)
  def decode_field(value, :json_object), do: value.json_val
  def decode_field(value, :java_object), do: value.java_val


  def decode_blob(val) do
    case val do
      %Snappyex.Model.BlobChunk{chunk: _chunk, last: true} -> val
      %Snappyex.Model.BlobChunk{last: false} -> raise "Not Implemented"
      nil -> nil
    end
  end


  def decode_clob(val) do
    case val do
      %Snappyex.Model.ClobChunk{chunk: chunk, last: true} -> chunk
      %Snappyex.Model.ClobChunk{last: false} -> raise "Not Implemented"
      nil -> nil
    end
  end
  def decode_row_set(nil) do
    nil
  end

  def decode_row_set(%Snappyex.Model.RowSet{rows: rows, metadata: metadata}) do    
    columns = Enum.map(metadata, fn descriptor ->
      %Snappyex.Model.ColumnDescriptor{type: ordinal} = descriptor
      ordinal      
    end)    
    decode(rows, columns)
  end
  def parse(query, _) do
    query
  end
end
