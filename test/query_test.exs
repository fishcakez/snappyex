defmodule QueryTest do
  use ExUnit.Case
  import Snappyex.TestHelper
  alias Snappyex, as: S

  setup context do
    opts = [ hostName: "192.168.55.4", clientID: "ElixirClient1|0x" <> Base.encode16(inspect self), 
     port: 1531, userName: "APP", password: "APP",  security: Snappyex.Model.SecurityMechanism.plain, 
     tokenSize: 16, useStringForDecimal: false, properties: :dict.new()]
    {:ok, pid} = S.start_link(opts)
    {:ok, [pid: pid]}
  end

  test "iodata", context do
    params = Map.put_new(Map.new, :params, Snappyex.Model.Row.new(values: []))
    assert [[123]] == prepare_execute(["S", ?E, ["LEC"|"T"], " ", '123'], params)
  end

  test "decode basic types", context do
    params = Map.put_new(Map.new, :params, Snappyex.Model.Row.new(values: []))
    assert [[nil]] ==  prepare_execute("SELECT NULL", params)
    assert [[true, false]] == prepare_execute("SELECT true, false", params)
    #assert [["e"]] == prepare_execute("SELECT 'e'", params)
    #assert [["ẽ"]] == prepare_execute("SELECT 'ẽ'", params)
    assert [[42]] == prepare_execute("SELECT 42", params)
    #assert [[42.0]] == prepare_execute("SELECT CAST(42 AS FLOAT)", params)
    #assert [[:NaN]] == prepare_execute("SELECT CAST('NaN' AS FLOAT)", params)
    #assert [[:inf]] == prepare_execute("SELECT CAST('inf' AS FLOAT)", params)
    #assert [[:"-inf"]] == prepare_execute("SELECT '-inf'::float", params)
    #assert [["ẽric"]] == prepare_execute("SELECT 'ẽric'", params)
    assert [["ẽric"]] == prepare_execute("SELECT CAST('ẽric' AS VARCHAR(10))", params)
    assert [[<<1, 2, 3>>]] == prepare_execute("SELECT '\\001\\002\\003'::bytea", params)
  end
end
