defmodule(SnappyData.Thrift.RowSet) do
  _ = "Auto-generated Thrift struct snappydata.RowSet"
  _ = "1: list<snappydata.Row> rows"
  _ = "2: i8 flags"
  _ = "3: i64 cursor_id"
  _ = "4: i64 statement_id"
  _ = "5: i64 conn_id"
  _ = "6: binary token"
  _ = "7: snappydata.HostAddress source"
  _ = "8: i32 offset"
  _ = "9: list<snappydata.ColumnDescriptor> metadata"
  _ = "10: string cursor_name"
  _ = "11: snappydata.SnappyExceptionData warnings"
  _ = "12: list<i64> row_ids_for_update_or_delete"
  defstruct(rows: nil, flags: nil, cursor_id: nil, statement_id: nil, conn_id: nil, token: nil, source: nil, offset: nil, metadata: nil, cursor_name: nil, warnings: nil, row_ids_for_update_or_delete: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    def(deserialize(binary)) do
      deserialize(binary, %SnappyData.Thrift.RowSet{})
    end
    defp(deserialize(<<0, rest::binary>>, %SnappyData.Thrift.RowSet{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<15, 1::16-signed, 12, remaining::size(32), rest::binary>>, struct)) do
      deserialize__rows(rest, [[], remaining, struct])
    end
    defp(deserialize(<<3, 2::16-signed, value, rest::binary>>, acc)) do
      deserialize(rest, %{acc | flags: value})
    end
    defp(deserialize(<<10, 3::16-signed, value::size(64), rest::binary>>, acc)) do
      deserialize(rest, %{acc | cursor_id: value})
    end
    defp(deserialize(<<10, 4::16-signed, value::size(64), rest::binary>>, acc)) do
      deserialize(rest, %{acc | statement_id: value})
    end
    defp(deserialize(<<10, 5::16-signed, value::size(64), rest::binary>>, acc)) do
      deserialize(rest, %{acc | conn_id: value})
    end
    defp(deserialize(<<11, 6::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | token: value})
    end
    defp(deserialize(<<12, 7::16-signed, rest::binary>>, acc)) do
      case(Elixir.SnappyData.Thrift.HostAddress.BinaryProtocol.deserialize(rest)) do
        {value, rest} ->
          deserialize(rest, %{acc | source: value})
        :error ->
          :error
      end
    end
    defp(deserialize(<<8, 8::16-signed, value::size(32), rest::binary>>, acc)) do
      deserialize(rest, %{acc | offset: value})
    end
    defp(deserialize(<<15, 9::16-signed, 12, remaining::size(32), rest::binary>>, struct)) do
      deserialize__metadata(rest, [[], remaining, struct])
    end
    defp(deserialize(<<11, 10::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | cursor_name: value})
    end
    defp(deserialize(<<12, 11::16-signed, rest::binary>>, acc)) do
      case(Elixir.SnappyData.Thrift.SnappyExceptionData.BinaryProtocol.deserialize(rest)) do
        {value, rest} ->
          deserialize(rest, %{acc | warnings: value})
        :error ->
          :error
      end
    end
    defp(deserialize(<<15, 12::16-signed, 10, remaining::size(32), rest::binary>>, struct)) do
      deserialize__row_ids_for_update_or_delete(rest, [[], remaining, struct])
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    defp(deserialize__metadata(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | metadata: Enum.reverse(list)})
    end
    defp(deserialize__metadata(<<rest::binary>>, [list, remaining | stack])) do
      case(Elixir.SnappyData.Thrift.ColumnDescriptor.BinaryProtocol.deserialize(rest)) do
        {element, rest} ->
          deserialize__metadata(rest, [[element | list], remaining - 1 | stack])
        :error ->
          :error
      end
    end
    defp(deserialize__metadata(_, _)) do
      :error
    end
    defp(deserialize__row_ids_for_update_or_delete(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | row_ids_for_update_or_delete: Enum.reverse(list)})
    end
    defp(deserialize__row_ids_for_update_or_delete(<<element::size(64), rest::binary>>, [list, remaining | stack])) do
      deserialize__row_ids_for_update_or_delete(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__row_ids_for_update_or_delete(_, _)) do
      :error
    end
    defp(deserialize__rows(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | rows: Enum.reverse(list)})
    end
    defp(deserialize__rows(<<rest::binary>>, [list, remaining | stack])) do
      case(Elixir.SnappyData.Thrift.Row.BinaryProtocol.deserialize(rest)) do
        {element, rest} ->
          deserialize__rows(rest, [[element | list], remaining - 1 | stack])
        :error ->
          :error
      end
    end
    defp(deserialize__rows(_, _)) do
      :error
    end
    def(serialize(%SnappyData.Thrift.RowSet{rows: rows, flags: flags, cursor_id: cursor_id, statement_id: statement_id, conn_id: conn_id, token: token, source: source, offset: offset, metadata: metadata, cursor_name: cursor_name, warnings: warnings, row_ids_for_update_or_delete: row_ids_for_update_or_delete})) do
      [case(rows) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :rows on SnappyData.Thrift.RowSet must not be nil")
        _ ->
          [<<15, 1::size(16), 12, length(rows)::size(32)>> | for(e <- rows) do
            SnappyData.Thrift.Row.serialize(e)
          end]
      end, case(flags) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :flags on SnappyData.Thrift.RowSet must not be nil")
        _ ->
          <<3, 2::size(16), flags::8-signed>>
      end, case(cursor_id) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :cursor_id on SnappyData.Thrift.RowSet must not be nil")
        _ ->
          <<10, 3::size(16), cursor_id::64-signed>>
      end, case(statement_id) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :statement_id on SnappyData.Thrift.RowSet must not be nil")
        _ ->
          <<10, 4::size(16), statement_id::64-signed>>
      end, case(conn_id) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :conn_id on SnappyData.Thrift.RowSet must not be nil")
        _ ->
          <<10, 5::size(16), conn_id::64-signed>>
      end, case(token) do
        nil ->
          <<>>
        _ ->
          [<<11, 6::size(16), byte_size(token)::size(32)>> | token]
      end, case(source) do
        nil ->
          <<>>
        _ ->
          [<<12, 7::size(16)>> | SnappyData.Thrift.HostAddress.serialize(source)]
      end, case(offset) do
        nil ->
          <<>>
        _ ->
          <<8, 8::size(16), offset::32-signed>>
      end, case(metadata) do
        nil ->
          <<>>
        _ ->
          [<<15, 9::size(16), 12, length(metadata)::size(32)>> | for(e <- metadata) do
            SnappyData.Thrift.ColumnDescriptor.serialize(e)
          end]
      end, case(cursor_name) do
        nil ->
          <<>>
        _ ->
          [<<11, 10::size(16), byte_size(cursor_name)::size(32)>> | cursor_name]
      end, case(warnings) do
        nil ->
          <<>>
        _ ->
          [<<12, 11::size(16)>> | SnappyData.Thrift.SnappyExceptionData.serialize(warnings)]
      end, case(row_ids_for_update_or_delete) do
        nil ->
          <<>>
        _ ->
          [<<15, 12::size(16), 10, length(row_ids_for_update_or_delete)::size(32)>> | for(e <- row_ids_for_update_or_delete) do
            <<e::64-signed>>
          end]
      end | <<0>>]
    end
  end
  def(serialize(struct)) do
    BinaryProtocol.serialize(struct)
  end
  def(serialize(struct, :binary)) do
    BinaryProtocol.serialize(struct)
  end
  def(deserialize(binary)) do
    BinaryProtocol.deserialize(binary)
  end
end