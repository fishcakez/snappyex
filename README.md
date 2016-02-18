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
conn = Snappy.Client.openConnection(Snappy.Models.OpenConnectionArgs.new(clientHostName: "fire-elementary", clientID: "Home", userName: "APP", password: "APP",  security: Snappy.Models.SecurityMechanism.plain, properties: :dict.new()))    
connId = elem(conn, 1)  
token = elem(conn, 5)  
Snappy.Client.executeQuery(connId, "select * from fortune", Snappy.Models.StatementAttrs.new(pendingTransactionAttrs: HashDict.new), token)
```
Download and install:

* Elixir
* Download Thrift https://www.us.apache.org/dist/thrift/0.9.3/thrift-0.9.3.exe 
, rename to thrift.exe and copy to repository.

See [https://github.com/SnappyDataInc/snappydata/blob/master/snappy-tools/README-thrift.md](README-thrift.md) for SnappyData programming documents.