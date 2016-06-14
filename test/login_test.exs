defmodule LoginTest do
  use ExUnit.Case

  alias Snappyex, as: S

  test "login cleartext password" do
    Process.flag(:trap_exit, true)

    opts = [ hostname: 'snappydata', port: 1531, username: 'APP',
             password: 'APP',  security: Snappyex.Models.SecurityMechanism.plain,  tokenSize: 16, useStringForDecimal: false, properties: :dict.new ]
    assert {:ok, pid} = S.start_link(opts)
    params = Map.put_new(Map.new, :params, Snappyex.Models.Row.new(values: []))
    assert {:ok, {_, _}} = S.prepare_execute(pid, 'SELECT 1', params, [])
  end
end
