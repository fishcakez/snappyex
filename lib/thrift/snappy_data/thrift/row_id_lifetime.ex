defmodule(SnappyData.Thrift.RowIdLifetime) do
  @moduledoc("Auto-generated Thrift enum snappydata.RowIdLifetime")
  defmacro(rowid_unsupported) do
    1
  end
  defmacro(rowid_valid_other) do
    2
  end
  defmacro(rowid_valid_session) do
    3
  end
  defmacro(rowid_valid_transaction) do
    4
  end
  defmacro(rowid_valid_forever) do
    5
  end
  def(value_to_name(1)) do
    {:ok, :rowid_unsupported}
  end
  def(value_to_name(2)) do
    {:ok, :rowid_valid_other}
  end
  def(value_to_name(3)) do
    {:ok, :rowid_valid_session}
  end
  def(value_to_name(4)) do
    {:ok, :rowid_valid_transaction}
  end
  def(value_to_name(5)) do
    {:ok, :rowid_valid_forever}
  end
  def(value_to_name(v)) do
    {:error, {:invalid_enum_value, v}}
  end
  def(value_to_name!(value)) do
    {:ok, name} = value_to_name(value)
    name
  end
  def(names) do
    [:rowid_unsupported, :rowid_valid_other, :rowid_valid_session, :rowid_valid_transaction, :rowid_valid_forever]
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
  def(member?(_)) do
    false
  end
end