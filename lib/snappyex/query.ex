defmodule Snappyex.Query do
  defstruct [:name, :statement, :statement_id, :param_formats, :encoders, :columns,
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

  @gs_epoch :calendar.datetime_to_gregorian_seconds({{1970,1, 1}, {0, 0, 0}})

  def decode(rows, columns), do: decode(rows, columns, [])
  def decode([row | rows], columns, acc) do
    decode(rows, columns, [decode_row(row.values, columns, []) | acc])
  end
  def decode([], _, acc), do: Enum.reverse(acc)
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
  def decode_field(value, :decimal), do: value.decimal_val
  def decode_field(value, :char), do: value.string_val
  def decode_field(value, :varchar), do: value.string_val
#  def decode_field(column_value, :longvarchar), do: elem(column_value, @string_val)
  def decode_field(value, :date) do
    {:DateTime, date} = value.date_val
    {{year, month, day}, {hour, min, sec}} = :calendar.gregorian_seconds_to_datetime(div(date, 1000) + @gs_epoch)
    {year, month, day}
  end
  def decode_field(value, :time) do
    {:DateTime, date} = value.time_val
    {{year, month, day}, {hour, min, sec}} = :calendar.gregorian_seconds_to_datetime(div(date, 1000) + @gs_epoch)
    {hour, min, sec}
  end
  def decode_field(value, :timestamp) do
    # TODO Extract nanoseconds and add it to time
    # https://github.com/elixir-ecto/postgrex/blob/master/lib/postgrex/extensions/timestamp.ex#L24
    # Handle < epoch case
    value.timestamp_val
  end
  def decode_field(value, :binary), do: value.binary_val
  def decode_field(value, :varbinary), do: value.binary_val
  def decode_field(value, :longvarbinary), do: value.binary_val
  def decode_field(value, :blob), do: value.blob_val
  def decode_field(value, :clob) do 
    value.clob_val
  end
#  def decode_field(column_value, :sqlxml), do: elem(column_value, @string_val)
#  def decode_field(column_value, :nulltype), do: elem(column_value, )
#  def decode_field(column_value, :array), do: elem(column_value, )
#  def decode_field(column_value, :map), do: elem(column_value, )
#  def decode_field(column_value, :struct), do: elem(column_value, )
  def decode_field(value, :other), do: raise ArgumentError, "can not be decoded: " <> IO.inspect(value)
  def decode_field(value, :json_object), do: value.json_val
  def decode_field(value, :java_object), do: value.java_val

  def decode(%Query{decoders: nil}, res, _) do
    mapper = fn x -> x end
    {:ok, row_set} = Map.fetch(res, :row_set)
    %Snappyex.Model.RowSet{rows: rows, metadata: metadata} = row_set

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
