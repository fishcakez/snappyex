defmodule(SnappyData.Thrift.TransactionAttribute) do
  @moduledoc("Auto-generated Thrift enum snappydata.TransactionAttribute")
  defmacro(autocommit) do
    1
  end
  defmacro(read_only_connection) do
    2
  end
  defmacro(waiting_mode) do
    3
  end
  defmacro(disable_batching) do
    4
  end
  defmacro(sync_commits) do
    5
  end
  def(value_to_name(1)) do
    {:ok, :autocommit}
  end
  def(value_to_name(2)) do
    {:ok, :read_only_connection}
  end
  def(value_to_name(3)) do
    {:ok, :waiting_mode}
  end
  def(value_to_name(4)) do
    {:ok, :disable_batching}
  end
  def(value_to_name(5)) do
    {:ok, :sync_commits}
  end
  def(value_to_name(v)) do
    {:error, {:invalid_enum_value, v}}
  end
  def(value_to_name!(value)) do
    {:ok, name} = value_to_name(value)
    name
  end
  def(names) do
    [:autocommit, :read_only_connection, :waiting_mode, :disable_batching, :sync_commits]
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