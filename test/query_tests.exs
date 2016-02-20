defmodule QueryTest do
  use ExUnit.Case
  import Snappyex.TestHelper
  alias Snappyex, as: S

  setup context do
    opts = [ hostname: 'fire-elementary', port: 1531, username: 'APP',
             password: 'APP', properties: HashDict.new, backoff_type: :stop
             prepare: context[:prepare] || :named]
   {:ok, pid} = S.start_link(opts)   
   {:ok, [pid: pid]} 
  end
  
  test "iodata", context do
    assert [[123]] = query(["S", ?E, ["LEC"|"T"], " ", '123'], [])
  end

  test "decode basic types", context do
    assert [[nil]] = query("SELECT NULL", [])
    assert [[true, false]] = S.query("SELECT true, false", [])
    assert [["e"]] = query("SELECT 'e'::char", [])
    assert [["ẽ"]] = query("SELECT 'ẽ'::char", [])
    assert [[42]] = query("SELECT 42", [])
    assert [[42.0]] = query("SELECT 42::float", [])
    assert [[:NaN]] = query("SELECT 'NaN'::float", [])
    assert [[:inf]] = query("SELECT 'inf'::float", [])
    assert [[:"-inf"]] = query("SELECT '-inf'::float", [])
    assert [["ẽric"]] = query("SELECT 'ẽric'", [])
    assert [["ẽric"]] = query("SELECT 'ẽric'::varchar", [])
    assert [[<<1, 2, 3>>]] = query("SELECT '\\001\\002\\003'::bytea", [])
  end
end
