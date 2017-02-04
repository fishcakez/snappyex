defmodule(SnappyData.Thrift.ServiceMetaDataCall) do
  @moduledoc("Auto-generated Thrift enum snappydata.ServiceMetaDataCall")
  defmacro(catalogs) do
    1
  end
  defmacro(schemas) do
    2
  end
  defmacro(tables) do
    3
  end
  defmacro(tabletypes) do
    4
  end
  defmacro(columns) do
    5
  end
  defmacro(tableprivileges) do
    6
  end
  defmacro(columnprivileges) do
    7
  end
  defmacro(primarykeys) do
    8
  end
  defmacro(importedkeys) do
    9
  end
  defmacro(exportedkeys) do
    10
  end
  defmacro(crossreference) do
    11
  end
  defmacro(procedures) do
    12
  end
  defmacro(functions) do
    13
  end
  defmacro(procedurecolumns) do
    14
  end
  defmacro(functioncolumns) do
    15
  end
  defmacro(attributes) do
    16
  end
  defmacro(typeinfo) do
    17
  end
  defmacro(supertypes) do
    18
  end
  defmacro(supertables) do
    19
  end
  defmacro(versioncolumns) do
    20
  end
  defmacro(clientinfoprops) do
    21
  end
  defmacro(pseudocolumns) do
    22
  end
  def(value_to_name(1)) do
    {:ok, :catalogs}
  end
  def(value_to_name(2)) do
    {:ok, :schemas}
  end
  def(value_to_name(3)) do
    {:ok, :tables}
  end
  def(value_to_name(4)) do
    {:ok, :tabletypes}
  end
  def(value_to_name(5)) do
    {:ok, :columns}
  end
  def(value_to_name(6)) do
    {:ok, :tableprivileges}
  end
  def(value_to_name(7)) do
    {:ok, :columnprivileges}
  end
  def(value_to_name(8)) do
    {:ok, :primarykeys}
  end
  def(value_to_name(9)) do
    {:ok, :importedkeys}
  end
  def(value_to_name(10)) do
    {:ok, :exportedkeys}
  end
  def(value_to_name(11)) do
    {:ok, :crossreference}
  end
  def(value_to_name(12)) do
    {:ok, :procedures}
  end
  def(value_to_name(13)) do
    {:ok, :functions}
  end
  def(value_to_name(14)) do
    {:ok, :procedurecolumns}
  end
  def(value_to_name(15)) do
    {:ok, :functioncolumns}
  end
  def(value_to_name(16)) do
    {:ok, :attributes}
  end
  def(value_to_name(17)) do
    {:ok, :typeinfo}
  end
  def(value_to_name(18)) do
    {:ok, :supertypes}
  end
  def(value_to_name(19)) do
    {:ok, :supertables}
  end
  def(value_to_name(20)) do
    {:ok, :versioncolumns}
  end
  def(value_to_name(21)) do
    {:ok, :clientinfoprops}
  end
  def(value_to_name(22)) do
    {:ok, :pseudocolumns}
  end
  def(value_to_name(v)) do
    {:error, {:invalid_enum_value, v}}
  end
  def(value_to_name!(value)) do
    {:ok, name} = value_to_name(value)
    name
  end
  def(names) do
    [:catalogs, :schemas, :tables, :tabletypes, :columns, :tableprivileges, :columnprivileges, :primarykeys, :importedkeys, :exportedkeys, :crossreference, :procedures, :functions, :procedurecolumns, :functioncolumns, :attributes, :typeinfo, :supertypes, :supertables, :versioncolumns, :clientinfoprops, :pseudocolumns]
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
  def(member?(_)) do
    false
  end
end