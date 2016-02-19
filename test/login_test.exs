defmodule LoginTest do
  use ExUnit.Case

  alias Snappyex, as: S

  test "login cleartext password" do
    Process.flag(:trap_exit, true)

    opts = [ hostname: 'fire-elementary', port: 1531, username: 'APP',
             password: 'APP', properties: HashDict.new() ]
    assert {:ok, pid} = S.start_link(opts)
    assert {:ok, %Snappyex.Result{columns: nil, rows: nil}} = S.query(pid, 'SELECT 123', HashDict.new, [])
  end
end
