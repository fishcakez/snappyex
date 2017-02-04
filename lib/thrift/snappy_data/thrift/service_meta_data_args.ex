defmodule(SnappyData.Thrift.ServiceMetaDataArgs) do
  _ = "Auto-generated Thrift struct snappydata.ServiceMetaDataArgs"
  _ = "1: i64 conn_id"
  _ = "2: i8 driver_type"
  _ = "3: binary token"
  _ = "4: string schema"
  _ = "5: string table"
  _ = "6: list<string> table_types"
  _ = "7: string column_name"
  _ = "8: string foreign_schema"
  _ = "9: string foreign_table"
  _ = "10: string procedure_name"
  _ = "11: string function_name"
  _ = "12: string attribute_name"
  _ = "13: string type_name"
  _ = "14: snappydata.SnappyType type_id"
  defstruct(conn_id: nil, driver_type: nil, token: nil, schema: nil, table: nil, table_types: nil, column_name: nil, foreign_schema: nil, foreign_table: nil, procedure_name: nil, function_name: nil, attribute_name: nil, type_name: nil, type_id: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    def(deserialize(binary)) do
      deserialize(binary, %SnappyData.Thrift.ServiceMetaDataArgs{})
    end
    defp(deserialize(<<0, rest::binary>>, %SnappyData.Thrift.ServiceMetaDataArgs{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<10, 1::16-signed, value::size(64), rest::binary>>, acc)) do
      deserialize(rest, %{acc | conn_id: value})
    end
    defp(deserialize(<<3, 2::16-signed, value, rest::binary>>, acc)) do
      deserialize(rest, %{acc | driver_type: value})
    end
    defp(deserialize(<<11, 3::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | token: value})
    end
    defp(deserialize(<<11, 4::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | schema: value})
    end
    defp(deserialize(<<11, 5::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | table: value})
    end
    defp(deserialize(<<15, 6::16-signed, 11, remaining::size(32), rest::binary>>, struct)) do
      deserialize__table_types(rest, [[], remaining, struct])
    end
    defp(deserialize(<<11, 7::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | column_name: value})
    end
    defp(deserialize(<<11, 8::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | foreign_schema: value})
    end
    defp(deserialize(<<11, 9::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | foreign_table: value})
    end
    defp(deserialize(<<11, 10::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | procedure_name: value})
    end
    defp(deserialize(<<11, 11::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | function_name: value})
    end
    defp(deserialize(<<11, 12::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | attribute_name: value})
    end
    defp(deserialize(<<11, 13::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | type_name: value})
    end
    defp(deserialize(<<8, 14::16-signed, value::size(32), rest::binary>>, acc)) do
      deserialize(rest, %{acc | type_id: value})
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    defp(deserialize__table_types(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | table_types: Enum.reverse(list)})
    end
    defp(deserialize__table_types(<<string_size::32-signed, element::binary-size(string_size), rest::binary>>, [list, remaining | stack])) do
      deserialize__table_types(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__table_types(_, _)) do
      :error
    end
    def(serialize(%SnappyData.Thrift.ServiceMetaDataArgs{conn_id: conn_id, driver_type: driver_type, token: token, schema: schema, table: table, table_types: table_types, column_name: column_name, foreign_schema: foreign_schema, foreign_table: foreign_table, procedure_name: procedure_name, function_name: function_name, attribute_name: attribute_name, type_name: type_name, type_id: type_id})) do
      [case(conn_id) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :conn_id on SnappyData.Thrift.ServiceMetaDataArgs must not be nil")
        _ ->
          <<10, 1::size(16), conn_id::64-signed>>
      end, case(driver_type) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :driver_type on SnappyData.Thrift.ServiceMetaDataArgs must not be nil")
        _ ->
          <<3, 2::size(16), driver_type::8-signed>>
      end, case(token) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :token on SnappyData.Thrift.ServiceMetaDataArgs must not be nil")
        _ ->
          [<<11, 3::size(16), byte_size(token)::size(32)>> | token]
      end, case(schema) do
        nil ->
          <<>>
        _ ->
          [<<11, 4::size(16), byte_size(schema)::size(32)>> | schema]
      end, case(table) do
        nil ->
          <<>>
        _ ->
          [<<11, 5::size(16), byte_size(table)::size(32)>> | table]
      end, case(table_types) do
        nil ->
          <<>>
        _ ->
          [<<15, 6::size(16), 11, length(table_types)::size(32)>> | for(e <- table_types) do
            [<<byte_size(e)::size(32)>> | e]
          end]
      end, case(column_name) do
        nil ->
          <<>>
        _ ->
          [<<11, 7::size(16), byte_size(column_name)::size(32)>> | column_name]
      end, case(foreign_schema) do
        nil ->
          <<>>
        _ ->
          [<<11, 8::size(16), byte_size(foreign_schema)::size(32)>> | foreign_schema]
      end, case(foreign_table) do
        nil ->
          <<>>
        _ ->
          [<<11, 9::size(16), byte_size(foreign_table)::size(32)>> | foreign_table]
      end, case(procedure_name) do
        nil ->
          <<>>
        _ ->
          [<<11, 10::size(16), byte_size(procedure_name)::size(32)>> | procedure_name]
      end, case(function_name) do
        nil ->
          <<>>
        _ ->
          [<<11, 11::size(16), byte_size(function_name)::size(32)>> | function_name]
      end, case(attribute_name) do
        nil ->
          <<>>
        _ ->
          [<<11, 12::size(16), byte_size(attribute_name)::size(32)>> | attribute_name]
      end, case(type_name) do
        nil ->
          <<>>
        _ ->
          [<<11, 13::size(16), byte_size(type_name)::size(32)>> | type_name]
      end, case(type_id) do
        nil ->
          <<>>
        _ ->
          <<8, 14::size(16), type_id::32-signed>>
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