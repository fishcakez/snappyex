defmodule(SnappyData.Thrift.ColumnDescriptor) do
  _ = "Auto-generated Thrift struct snappydata.ColumnDescriptor"
  _ = "1: snappydata.SnappyType type"
  _ = "2: i16 precision"
  _ = "3: i16 scale"
  _ = "4: string name"
  _ = "5: string full_table_name"
  _ = "6: bool updatable"
  _ = "7: bool definitely_updatable"
  _ = "8: bool nullable"
  _ = "9: bool auto_increment"
  _ = "10: bool parameter_in"
  _ = "11: bool parameter_out"
  _ = "12: list<snappydata.SnappyType> element_types"
  _ = "13: string udt_type_and_class_name"
  defstruct(type: nil, precision: nil, scale: nil, name: nil, full_table_name: nil, updatable: nil, definitely_updatable: nil, nullable: nil, auto_increment: nil, parameter_in: nil, parameter_out: nil, element_types: nil, udt_type_and_class_name: nil)
  @type(t :: %__MODULE__{})
  def(new) do
    %__MODULE__{}
  end
  defmodule(BinaryProtocol) do
    def(deserialize(binary)) do
      deserialize(binary, %SnappyData.Thrift.ColumnDescriptor{})
    end
    defp(deserialize(<<0, rest::binary>>, %SnappyData.Thrift.ColumnDescriptor{} = acc)) do
      {acc, rest}
    end
    defp(deserialize(<<8, 1::16-signed, value::size(32), rest::binary>>, acc)) do
      deserialize(rest, %{acc | type: value})
    end
    defp(deserialize(<<6, 2::16-signed, value::size(16), rest::binary>>, acc)) do
      deserialize(rest, %{acc | precision: value})
    end
    defp(deserialize(<<6, 3::16-signed, value::size(16), rest::binary>>, acc)) do
      deserialize(rest, %{acc | scale: value})
    end
    defp(deserialize(<<11, 4::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | name: value})
    end
    defp(deserialize(<<11, 5::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | full_table_name: value})
    end
    defp(deserialize(<<2, 6::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | updatable: true})
    end
    defp(deserialize(<<2, 6::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | updatable: false})
    end
    defp(deserialize(<<2, 7::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | definitely_updatable: true})
    end
    defp(deserialize(<<2, 7::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | definitely_updatable: false})
    end
    defp(deserialize(<<2, 8::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | nullable: true})
    end
    defp(deserialize(<<2, 8::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | nullable: false})
    end
    defp(deserialize(<<2, 9::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | auto_increment: true})
    end
    defp(deserialize(<<2, 9::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | auto_increment: false})
    end
    defp(deserialize(<<2, 10::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | parameter_in: true})
    end
    defp(deserialize(<<2, 10::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | parameter_in: false})
    end
    defp(deserialize(<<2, 11::16-signed, 1, rest::binary>>, acc)) do
      deserialize(rest, %{acc | parameter_out: true})
    end
    defp(deserialize(<<2, 11::16-signed, 0, rest::binary>>, acc)) do
      deserialize(rest, %{acc | parameter_out: false})
    end
    defp(deserialize(<<15, 12::16-signed, 8, remaining::size(32), rest::binary>>, struct)) do
      deserialize__element_types(rest, [[], remaining, struct])
    end
    defp(deserialize(<<11, 13::16-signed, string_size::32-signed, value::binary-size(string_size), rest::binary>>, acc)) do
      deserialize(rest, %{acc | udt_type_and_class_name: value})
    end
    defp(deserialize(<<field_type, _id::16-signed, rest::binary>>, acc)) do
      rest |> Thrift.Protocol.Binary.skip_field(field_type) |> deserialize(acc)
    end
    defp(deserialize(_, _)) do
      :error
    end
    defp(deserialize__element_types(<<rest::binary>>, [list, 0, struct])) do
      deserialize(rest, %{struct | element_types: Enum.reverse(list)})
    end
    defp(deserialize__element_types(<<element::size(32), rest::binary>>, [list, remaining | stack])) do
      deserialize__element_types(rest, [[element | list], remaining - 1 | stack])
    end
    defp(deserialize__element_types(_, _)) do
      :error
    end
    def(serialize(%SnappyData.Thrift.ColumnDescriptor{type: type, precision: precision, scale: scale, name: name, full_table_name: full_table_name, updatable: updatable, definitely_updatable: definitely_updatable, nullable: nullable, auto_increment: auto_increment, parameter_in: parameter_in, parameter_out: parameter_out, element_types: element_types, udt_type_and_class_name: udt_type_and_class_name})) do
      [case(type) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :type on SnappyData.Thrift.ColumnDescriptor must not be nil")
        _ ->
          <<8, 1::size(16), type::32-signed>>
      end, case(precision) do
        nil ->
          raise(Thrift.InvalidValueException, "Required field :precision on SnappyData.Thrift.ColumnDescriptor must not be nil")
        _ ->
          <<6, 2::size(16), precision::16-signed>>
      end, case(scale) do
        nil ->
          <<>>
        _ ->
          <<6, 3::size(16), scale::16-signed>>
      end, case(name) do
        nil ->
          <<>>
        _ ->
          [<<11, 4::size(16), byte_size(name)::size(32)>> | name]
      end, case(full_table_name) do
        nil ->
          <<>>
        _ ->
          [<<11, 5::size(16), byte_size(full_table_name)::size(32)>> | full_table_name]
      end, case(updatable) do
        nil ->
          <<>>
        false ->
          <<2, 6::size(16), 0>>
        true ->
          <<2, 6::size(16), 1>>
        _ ->
          raise(Thrift.InvalidValueException, "Optional boolean field :updatable on SnappyData.Thrift.ColumnDescriptor must be true, false, or nil")
      end, case(definitely_updatable) do
        nil ->
          <<>>
        false ->
          <<2, 7::size(16), 0>>
        true ->
          <<2, 7::size(16), 1>>
        _ ->
          raise(Thrift.InvalidValueException, "Optional boolean field :definitely_updatable on SnappyData.Thrift.ColumnDescriptor must be true, false, or nil")
      end, case(nullable) do
        nil ->
          <<>>
        false ->
          <<2, 8::size(16), 0>>
        true ->
          <<2, 8::size(16), 1>>
        _ ->
          raise(Thrift.InvalidValueException, "Optional boolean field :nullable on SnappyData.Thrift.ColumnDescriptor must be true, false, or nil")
      end, case(auto_increment) do
        nil ->
          <<>>
        false ->
          <<2, 9::size(16), 0>>
        true ->
          <<2, 9::size(16), 1>>
        _ ->
          raise(Thrift.InvalidValueException, "Optional boolean field :auto_increment on SnappyData.Thrift.ColumnDescriptor must be true, false, or nil")
      end, case(parameter_in) do
        nil ->
          <<>>
        false ->
          <<2, 10::size(16), 0>>
        true ->
          <<2, 10::size(16), 1>>
        _ ->
          raise(Thrift.InvalidValueException, "Optional boolean field :parameter_in on SnappyData.Thrift.ColumnDescriptor must be true, false, or nil")
      end, case(parameter_out) do
        nil ->
          <<>>
        false ->
          <<2, 11::size(16), 0>>
        true ->
          <<2, 11::size(16), 1>>
        _ ->
          raise(Thrift.InvalidValueException, "Optional boolean field :parameter_out on SnappyData.Thrift.ColumnDescriptor must be true, false, or nil")
      end, case(element_types) do
        nil ->
          <<>>
        _ ->
          [<<15, 12::size(16), 8, length(element_types)::size(32)>> | for(e <- element_types) do
            <<e::32-signed>>
          end]
      end, case(udt_type_and_class_name) do
        nil ->
          <<>>
        _ ->
          [<<11, 13::size(16), byte_size(udt_type_and_class_name)::size(32)>> | udt_type_and_class_name]
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