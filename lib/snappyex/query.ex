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

  @bool_val 1
  @byte_val 2
  @i16_val 3
  @i32_val 4
  @i64_val 5
  @float_val 6
  @double_val 7
  @string_val 8
  @decimal_val 9
  @date_val 10
  @time_val 11
  @timestamp_val 12
  @binary_val 13
  @blob_val 14
  @clob_val 15
  @null_val 16
  @json_val 17
  @java_val 18

  def decode(rows, columns), do: decode(rows, columns, [])
  def decode([row | rows], columns, acc) do
    {:Row, row} = row
    decode(rows, columns, [decode_row(row, columns, []) | acc])
  end
  def decode([], _, acc), do: Enum.reverse(acc)
  def decode_row([field | rows], [decoder | cols], acc), do: decode_row(rows, cols, [decode_field(field, decoder) | acc])
  def decode_row([], [], acc), do: Enum.reverse(acc)
  def decode_field(column_value, :boolean), do: elem(column_value, @bool_val)
  def decode_field(column_value, :tinyint), do: elem(column_value, @i16_val)
  def decode_field(column_value, :integer), do: elem(column_value, @i32_val)
  def decode_field(column_value, :bigint), do: elem(column_value, @float_val)
  def decode_field(column_value, :float), do: elem(column_value, @double_val)
#  def decode_field(column_value, :real), do: elem(column_value, @decimal_val)
  def decode_field(column_value, :double), do: elem(column_value, @string_val)
  def decode_field(column_value, :decimal), do: elem(column_value, @decimal_val)
  def decode_field(column_value, :char), do: elem(column_value, @string_val)
  def decode_field(column_value, :varchar), do: elem(column_value, @string_val)
#  def decode_field(column_value, :longvarchar), do: elem(column_value, @string_val)
  def decode_field(column_value, :date), do: elem(column_value, @date_val)
  def decode_field(column_value, :time), do: elem(column_value, @time_val)
  def decode_field(column_value, :timestamp), do: elem(column_value, @timestamp_val)
  def decode_field(column_value, :binary), do: elem(column_value, @binary_val)
  def decode_field(column_value, :varbinary), do: elem(column_value, @binary_val)
  def decode_field(column_value, :longvarbinary), do: elem(column_value, @binary_val)
  def decode_field(column_value, :blob), do: elem(column_value, @blob_val)
  def decode_field(column_value, :clob), do: elem(column_value, @clob_val)
#  def decode_field(column_value, :sqlxml), do: elem(column_value, @string_val)
#  def decode_field(column_value, :nulltype), do: elem(column_value, )
#  def decode_field(column_value, :array), do: elem(column_value, )
#  def decode_field(column_value, :map), do: elem(column_value, )
#  def decode_field(column_value, :struct), do: elem(column_value, )
  def decode_field(column_value, :other), do: raise ArgumentError, "can not be decoded: " <> inspect(column_value)
  def decode_field(column_value, :json_object), do: elem(column_value, @json_val)
  def decode_field(column_value, :java_object), do: elem(column_value, @java_val)

  def decode(%Query{decoders: nil}, res, _) do
    mapper = fn x -> x end
    {:ok, row_set} = Map.fetch(res, :row_set)
    %Snappyex.Model.RowSet{rows: rows, metadata: metadata} = row_set

    columns = Enum.map(metadata, fn descriptor ->
      %Snappyex.Model.ColumnDescriptor{type: %Snappyex.Model.SnappyType{ordinal: ordinal}} = descriptor
      ordinal
    end)

    decode(rows, columns)
  end

  def parse(query, _) do
    query
  end
end
