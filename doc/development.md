TCPConnection
=============

`TCPConnection` is a simple `DBConnection` process that behaves in a
similar way to a `:gen_tcp` socket.

This example should help show how to handle the lifecycle of a socket
and checkout/checkin.

```elixir
{:ok, pid} = TCPConnection.start_link("localhost", 8000)
{:ok, listener} = :gen_tcp.listen(8000, [active: false, mode: :binary])
{:ok, socket} = :gen_tcp.accept(listener)
:ok = :gen_tcp.send(socket, "hello")
{:ok, "hello"} = TCPConnection.recv(pid, 5, 1000)
:ok = TCPConnection.send(pid, "hi")
{:ok, "hi"} = :gen_tcp.recv(socket, 2, 1000)
```
The TCPConnection process will automatically reconnect:
```elixir
:ok = :gen_tcp.close(socket)
{:ok, socket} = :gen_tcp.accept(listener)
:ok = TCPConnection.send(pid, "back!")
{:ok, "back!"} = :gen_tcp.recv(socket, 5, 1000)
```

## Install instructions

```bash
sudo apt-get install elixir thrift-compiler
sudo apt-get install libboost-dev libboost-test-dev libboost-program-options-dev libevent-dev automake libtool flex bison pkg-config g++ libssl-dev 
cd /tmp 
git clone https://github.com/apache/thrift --branch 0.9.3
./bootstrap.sh
./configure 
make 
sudo make install
cd - 
mix deps.get
mix compile 
iex -S mix
# {:ok, pid} = :thrift_client_util.new('snappydata', 1531, :snappy_data_service_thrift, [])
opts = [ hostname: 'snappydata', port: 1531, username: 'APP',
password: 'APP', properties: :dict.new() ]
{:ok, pid} = Snappyex.start_link(opts)
{:ConnectionProperties, connId, clientHostName, clientId, _, token} = Snappyex.Client.openConnection(Snappyex.Models.OpenConnectionArgs.new(clientHostName: 'snappydata', clientID: "ElixirClient1|0x" <> Base.encode16(inspect self), userName: 'APP', password: 'APP',  security: Snappyex.Models.SecurityMechanism.plain,  tokenSize: 16, useStringForDecimal: false, properties: :dict.new()))
# Execute sql
Snappyex.Client.execute(connId, "create table foo (bar int primary key)", nil, nil, token)
Snappyex.Client.execute(connId, "insert into foo values (1)", nil, nil,
token)
# Execute sql query
Snappyex.Client.executeQuery(connId, "select * from fortune", Snappyex.Models.StatementAttrs.new(pendingTransactionAttrs: HashDict.new), token)
# Execute prepared statement
pstmt = Snappyex.Client.prepareStatement(connId, "insert into foo values (?)", nil, nil, token)
Snappyex.Client.executePreparedUpdate(pstmt.statementId, Snappyex.Models.Row.new(values: [Snappyex.Models.ColumnValue.new(i32_val: 1)]), token)
Snappyex.Client.executePreparedUpdate(pstmt.statementId, Snappyex.Models.Row.new(values: [Snappyex.Models.ColumnValue.new(i32_val: 2)]), token)
Snappyex.Client.executePreparedUpdate(pstmt.statementId, Snappyex.Models.Row.new(values: [Snappyex.Models.ColumnValue.new(i32_val: 3)]), token)
Snappyex.Client.executePreparedUpdate(pstmt.statementId, Snappyex.Models.Row.new(values: [Snappyex.Models.ColumnValue.new(i32_val: 4)]), token)
Snappyex.Client.executePreparedUpdate(pstmt.statementId, Snappyex.Models.Row.new(values: [Snappyex.Models.ColumnValue.new(i32_val: 5)]), token)
pstmt = Snappyex.Client.prepareStatement(connId, "select * from foo where bar=?", nil, nil, token)
Snappyex.Client.executePreparedQuery(pstmt.statementId, Snappyex.Models.Row.new(values: [Snappyex.Models.ColumnValue.new(i32_val: 1)]), token)
Snappyex.Client.executePreparedQuery(pstmt.statementId, Snappyex.Models.Row.new(values: [Snappyex.Models.ColumnValue.new(i32_val: 2)]), token)
Snappyex.Client.executePreparedQuery(pstmt.statementId, Snappyex.Models.Row.new(values: [Snappyex.Models.ColumnValue.new(i32_val: 3)]), token)
Snappyex.Client.executePreparedQuery(pstmt.statementId, Snappyex.Models.Row.new(values: [Snappyex.Models.ColumnValue.new(i32_val: 4)]), token)
Snappyex.Client.executePreparedQuery(pstmt.statementId, Snappyex.Models.Row.new(values: [Snappyex.Models.ColumnValue.new(i32_val: 5)]), token)
# Get rows
pstmt = Snappyex.Client.prepareStatement(connId, "select * from foo", nil, nil, token)
Snappyex.Client.executePreparedQuery(pstmt.statementId, Snappyex.Models.Row.new(values: []), token)  
# Close connection
Snappyex.Client.closeConnection(connId, token)
```
Download and install:

* Elixir
* Download Thrift https://www.us.apache.org/dist/thrift/0.9.3/thrift-0.9.3.exe 
, rename to thrift.exe and copy to repository.

See [README-thrift.md](https://github.com/SnappyDataInc/snappydata/blob/master/snappy-tools/README-thrift.md) for SnappyData programming documents.

1. Connect to locator
2. `Snappy.Client.getPreferredServer(
      serverType, null, null)`
3. `Snappy.Client.getPreferredServer([Snappy.Models.ServerType.thrift_gfxd_bp], ["default"], [Snappy.Models.HostAddress.new(hostName: "example.com", port: 1, ipAddress: "127.0.0.1", serverType: Snappy.Models.ServerType.thrift_gfxd_bp)])`

Alternative

1.
```elixir
{:ok, client} = :thrift_client_util.new('snappydata', 1531, :snappy_data_service_thrift, [])
args = Snappyex.Models.OpenConnectionArgs.new(clientHostName: "snappydata", clientID: "ElixirClient1|0x" <> Base.encode16(inspect self), port: 1531, userName: "APP", password: "APP",  security: Snappyex.Models.SecurityMechanism.plain,  tokenSize: 16, useStringForDecimal: false, properties: :dict.new())
{:ok, pid} = Snappyex.Client.start_link(args)
{:ok, %Snappyex.Result{columns: nil, rows: nil}} = Snappyex.query(pid, 'SELECT 1', HashDict.new, [])
```
2.
```elixir
opts = [ hostname: 'snappydata', port: 1531, username: 'APP',
password: 'APP', properties: HashDict.new() ]
{:ok, pid} = Snappyex.start_link(opts)
Snappyex.prepare(pid, [statement:  'SELECT 123'], HashDict.new)
```
3.
```elixir
opts = [ hostname: 'snappydata', port: 1531, username: 'APP', password: 'APP', properties: :dict.new]
{:ok, pid} = Snappyex.start_link(opts)
{:ok, state} = Snappyex.Protocol.connect(opts)
Snappyex.Protocol.ping(state)
{:ok, prepared_query, state} = Snappyex.Protocol.handle_prepare(%Snappyex.Query{statement: 'SELECT * FROM NEWTABLE'}, [], state)
params = Map.put_new(Map.new, :params, Snappyex.Models.Row.new(values: []))
Snappyex.Protocol.handle_execute(prepared_query, params, [], state)
```
4.
```elixir
args = [clientHostName: '192.168.55.4', clientID: "ElixirClient1|0x" <> Base.encode16(inspect self), port: 1531, userName: "APP", password: "APP",  security: Snappyex.Model.SecurityMechanism.plain,  tokenSize: 16, useStringForDecimal: false, properties: :dict.new()]
{:ok, pid} = Snappyex.start_link(args)
params = Map.put_new(Map.new, :params, Snappyex.Model.Row.new(values: []))
{:ok, query, result} = Snappyex.prepare_execute(pid, 'SELECT 1', params, [])
Snappyex.execute(pid, query, params, [])
```

Project is based on code in db_connection and postgrex.

```
ss -l -p -n
```
