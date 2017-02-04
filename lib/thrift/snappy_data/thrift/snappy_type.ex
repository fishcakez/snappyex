defmodule(SnappyData.Thrift.SnappyType) do
  @moduledoc("Auto-generated Thrift enum snappydata.SnappyType")
  defmacro(boolean) do
    1
  end
  defmacro(tinyint) do
    2
  end
  defmacro(smallint) do
    3
  end
  defmacro(integer) do
    4
  end
  defmacro(bigint) do
    5
  end
  defmacro(float) do
    6
  end
  defmacro(double) do
    7
  end
  defmacro(decimal) do
    8
  end
  defmacro(char) do
    9
  end
  defmacro(varchar) do
    10
  end
  defmacro(longvarchar) do
    11
  end
  defmacro(date) do
    12
  end
  defmacro(time) do
    13
  end
  defmacro(timestamp) do
    14
  end
  defmacro(binary) do
    15
  end
  defmacro(varbinary) do
    16
  end
  defmacro(longvarbinary) do
    17
  end
  defmacro(blob) do
    18
  end
  defmacro(clob) do
    19
  end
  defmacro(sqlxml) do
    20
  end
  defmacro(array) do
    21
  end
  defmacro(map) do
    22
  end
  defmacro(struct) do
    23
  end
  defmacro(nulltype) do
    24
  end
  defmacro(json) do
    25
  end
  defmacro(java_object) do
    26
  end
  defmacro(other) do
    27
  end
  def(value_to_name(1)) do
    {:ok, :boolean}
  end
  def(value_to_name(2)) do
    {:ok, :tinyint}
  end
  def(value_to_name(3)) do
    {:ok, :smallint}
  end
  def(value_to_name(4)) do
    {:ok, :integer}
  end
  def(value_to_name(5)) do
    {:ok, :bigint}
  end
  def(value_to_name(6)) do
    {:ok, :float}
  end
  def(value_to_name(7)) do
    {:ok, :double}
  end
  def(value_to_name(8)) do
    {:ok, :decimal}
  end
  def(value_to_name(9)) do
    {:ok, :char}
  end
  def(value_to_name(10)) do
    {:ok, :varchar}
  end
  def(value_to_name(11)) do
    {:ok, :longvarchar}
  end
  def(value_to_name(12)) do
    {:ok, :date}
  end
  def(value_to_name(13)) do
    {:ok, :time}
  end
  def(value_to_name(14)) do
    {:ok, :timestamp}
  end
  def(value_to_name(15)) do
    {:ok, :binary}
  end
  def(value_to_name(16)) do
    {:ok, :varbinary}
  end
  def(value_to_name(17)) do
    {:ok, :longvarbinary}
  end
  def(value_to_name(18)) do
    {:ok, :blob}
  end
  def(value_to_name(19)) do
    {:ok, :clob}
  end
  def(value_to_name(20)) do
    {:ok, :sqlxml}
  end
  def(value_to_name(21)) do
    {:ok, :array}
  end
  def(value_to_name(22)) do
    {:ok, :map}
  end
  def(value_to_name(23)) do
    {:ok, :struct}
  end
  def(value_to_name(24)) do
    {:ok, :nulltype}
  end
  def(value_to_name(25)) do
    {:ok, :json}
  end
  def(value_to_name(26)) do
    {:ok, :java_object}
  end
  def(value_to_name(27)) do
    {:ok, :other}
  end
  def(value_to_name(v)) do
    {:error, {:invalid_enum_value, v}}
  end
  def(value_to_name!(value)) do
    {:ok, name} = value_to_name(value)
    name
  end
  def(names) do
    [:boolean, :tinyint, :smallint, :integer, :bigint, :float, :double, :decimal, :char, :varchar, :longvarchar, :date, :time, :timestamp, :binary, :varbinary, :longvarbinary, :blob, :clob, :sqlxml, :array, :map, :struct, :nulltype, :json, :java_object, :other]
  end
  def(member?(1)) do
    true
  end
  def(member?(2)) do
    true
  end
  def(member?(3)) do
    true
  end
  def(member?(4)) do
    true
  end
  def(member?(5)) do
    true
  end
  def(member?(6)) do
    true
  end
  def(member?(7)) do
    true
  end
  def(member?(8)) do
    true
  end
  def(member?(9)) do
    true
  end
  def(member?(10)) do
    true
  end
  def(member?(11)) do
    true
  end
  def(member?(12)) do
    true
  end
  def(member?(13)) do
    true
  end
  def(member?(14)) do
    true
  end
  def(member?(15)) do
    true
  end
  def(member?(16)) do
    true
  end
  def(member?(17)) do
    true
  end
  def(member?(18)) do
    true
  end
  def(member?(19)) do
    true
  end
  def(member?(20)) do
    true
  end
  def(member?(21)) do
    true
  end
  def(member?(22)) do
    true
  end
  def(member?(23)) do
    true
  end
  def(member?(24)) do
    true
  end
  def(member?(25)) do
    true
  end
  def(member?(26)) do
    true
  end
  def(member?(27)) do
    true
  end
  def(member?(_)) do
    false
  end
end