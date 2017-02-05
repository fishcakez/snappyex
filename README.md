# SnappyData Adapter

Work in Progress Adapter. 

## Example

```elixir
require SnappyData.Thrift.SecurityMechanism
{:ok, pid} = Snappyex.start_link(
  [client_host_name: "127.0.0.1", 
  host: "192.168.0.21", 
  client_id: "ElixirClient1|0x" <> Base.encode16(inspect self()), 
  port: 1531, 
  user_name: "APP", 
  password: "APP",  
  security: SnappyData.Thrift.SecurityMechanism.plain, 
  properties: %{"load-balance" => "false"}, 
  for_xa: false, 
  token_size: 16, 
  use_string_for_decimal: false])
Snappyex.prepare_execute(pid, "SELECT from sys.member", "select id, kind, status, host, port from sys.members", [])
```