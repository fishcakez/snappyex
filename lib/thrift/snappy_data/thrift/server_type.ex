defmodule(SnappyData.Thrift.ServerType) do
  @moduledoc("Auto-generated Thrift enum snappydata.ServerType")
  defmacro(drda) do
    1
  end
  defmacro(thrift_locator_cp) do
    2
  end
  defmacro(thrift_locator_bp) do
    3
  end
  defmacro(thrift_locator_cp_ssl) do
    4
  end
  defmacro(thrift_locator_bp_ssl) do
    5
  end
  defmacro(thrift_snappy_cp) do
    6
  end
  defmacro(thrift_snappy_bp) do
    7
  end
  defmacro(thrift_snappy_cp_ssl) do
    8
  end
  defmacro(thrift_snappy_bp_ssl) do
    9
  end
  def(value_to_name(1)) do
    {:ok, :drda}
  end
  def(value_to_name(2)) do
    {:ok, :thrift_locator_cp}
  end
  def(value_to_name(3)) do
    {:ok, :thrift_locator_bp}
  end
  def(value_to_name(4)) do
    {:ok, :thrift_locator_cp_ssl}
  end
  def(value_to_name(5)) do
    {:ok, :thrift_locator_bp_ssl}
  end
  def(value_to_name(6)) do
    {:ok, :thrift_snappy_cp}
  end
  def(value_to_name(7)) do
    {:ok, :thrift_snappy_bp}
  end
  def(value_to_name(8)) do
    {:ok, :thrift_snappy_cp_ssl}
  end
  def(value_to_name(9)) do
    {:ok, :thrift_snappy_bp_ssl}
  end
  def(value_to_name(v)) do
    {:error, {:invalid_enum_value, v}}
  end
  def(value_to_name!(value)) do
    {:ok, name} = value_to_name(value)
    name
  end
  def(names) do
    [:drda, :thrift_locator_cp, :thrift_locator_bp, :thrift_locator_cp_ssl, :thrift_locator_bp_ssl, :thrift_snappy_cp, :thrift_snappy_bp, :thrift_snappy_cp_ssl, :thrift_snappy_bp_ssl]
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
  def(member?(_)) do
    false
  end
end