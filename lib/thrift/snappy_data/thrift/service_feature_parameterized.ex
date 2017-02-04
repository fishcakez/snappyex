defmodule(SnappyData.Thrift.ServiceFeatureParameterized) do
  @moduledoc("Auto-generated Thrift enum snappydata.ServiceFeatureParameterized")
  defmacro(transactions_support_isolation) do
    1
  end
  defmacro(resultset_type) do
    2
  end
  defmacro(resultset_concurrency_read_only) do
    3
  end
  defmacro(resultset_concurrency_updatable) do
    4
  end
  defmacro(resultset_own_updates_visible) do
    5
  end
  defmacro(resultset_own_deletes_visible) do
    6
  end
  defmacro(resultset_own_inserts_visible) do
    7
  end
  defmacro(resultset_others_updates_visible) do
    8
  end
  defmacro(resultset_others_deletes_visible) do
    9
  end
  defmacro(resultset_others_inserts_visible) do
    10
  end
  defmacro(resultset_updates_detected) do
    11
  end
  defmacro(resultset_deletes_detected) do
    12
  end
  defmacro(resultset_inserts_detected) do
    13
  end
  def(value_to_name(1)) do
    {:ok, :transactions_support_isolation}
  end
  def(value_to_name(2)) do
    {:ok, :resultset_type}
  end
  def(value_to_name(3)) do
    {:ok, :resultset_concurrency_read_only}
  end
  def(value_to_name(4)) do
    {:ok, :resultset_concurrency_updatable}
  end
  def(value_to_name(5)) do
    {:ok, :resultset_own_updates_visible}
  end
  def(value_to_name(6)) do
    {:ok, :resultset_own_deletes_visible}
  end
  def(value_to_name(7)) do
    {:ok, :resultset_own_inserts_visible}
  end
  def(value_to_name(8)) do
    {:ok, :resultset_others_updates_visible}
  end
  def(value_to_name(9)) do
    {:ok, :resultset_others_deletes_visible}
  end
  def(value_to_name(10)) do
    {:ok, :resultset_others_inserts_visible}
  end
  def(value_to_name(11)) do
    {:ok, :resultset_updates_detected}
  end
  def(value_to_name(12)) do
    {:ok, :resultset_deletes_detected}
  end
  def(value_to_name(13)) do
    {:ok, :resultset_inserts_detected}
  end
  def(value_to_name(v)) do
    {:error, {:invalid_enum_value, v}}
  end
  def(value_to_name!(value)) do
    {:ok, name} = value_to_name(value)
    name
  end
  def(names) do
    [:transactions_support_isolation, :resultset_type, :resultset_concurrency_read_only, :resultset_concurrency_updatable, :resultset_own_updates_visible, :resultset_own_deletes_visible, :resultset_own_inserts_visible, :resultset_others_updates_visible, :resultset_others_deletes_visible, :resultset_others_inserts_visible, :resultset_updates_detected, :resultset_deletes_detected, :resultset_inserts_detected]
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
  def(member?(_)) do
    false
  end
end