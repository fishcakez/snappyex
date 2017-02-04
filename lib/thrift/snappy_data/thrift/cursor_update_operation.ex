defmodule(SnappyData.Thrift.CursorUpdateOperation) do
  @moduledoc("Auto-generated Thrift enum snappydata.CursorUpdateOperation")
  defmacro(update_op) do
    1
  end
  defmacro(insert_op) do
    2
  end
  defmacro(delete_op) do
    3
  end
  def(value_to_name(1)) do
    {:ok, :update_op}
  end
  def(value_to_name(2)) do
    {:ok, :insert_op}
  end
  def(value_to_name(3)) do
    {:ok, :delete_op}
  end
  def(value_to_name(v)) do
    {:error, {:invalid_enum_value, v}}
  end
  def(value_to_name!(value)) do
    {:ok, name} = value_to_name(value)
    name
  end
  def(names) do
    [:update_op, :insert_op, :delete_op]
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
  def(member?(_)) do
    false
  end
end