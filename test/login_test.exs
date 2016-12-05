defmodule LoginTest do
  use ExUnit.Case
  import Snappyex.TestHelper

  alias Snappyex, as: S

  setup do
    opts = [ host: snappydata_address(), clientID: "ElixirClient1|0x" <> Base.encode16(inspect self), 
     port: 1531, username: "APP", password: "APP",  security: Snappyex.Model.SecurityMechanism.plain, 
     token_size: 16, use_string_for_decimal: false, properties: snappydata_properties()]
    {:ok, pid} = S.start_link(opts)    
    Process.flag(:trap_exit, true)
    {:ok, [pid: pid]}
  end

  test "login cleartext password", context do
    capture_log fn ->
    params = Map.put_new(Map.new, :params, Snappyex.Model.Row.new(values: []))
    assert [[1]] == query('SELECT 1', params)
    end
  end
end
