# Snappyex: Elixir Client for SnappyData

## Install instructions

Download and install:

* Elixir
* Development only: Compile Thrift 0.10 and put thrift in path.
```bash
sudo apt-get install elixir thrift-compiler
sudo apt-get install libboost-dev libboost-test-dev libboost-program-options-dev libevent-dev automake libtool flex bison pkg-config g++ libssl-dev 
cd /tmp 
git clone https://github.com/apache/thrift
./bootstrap.sh
./configure 
make 
sudo make install
cd -
mix deps.get
mix compile 
iex -S mix

See [README-thrift.md](https://github.com/SnappyDataInc/snappydata/blob/master/snappy-tools/README-thrift.md) for SnappyData programming documents.

1. Connect to locator
2. `Snappy.Client.getPreferredServer(
      serverType, null, null)`
3. `Snappy.Client.getPreferredServer([Snappy.Models.ServerType.thrift_gfxd_bp], ["default"], [Snappy.Models.HostAddress.new(hostName: "example.com", port: 1, ipAddress: "127.0.0.1", serverType: Snappy.Models.ServerType.thrift_gfxd_bp)])`
4.
```elixir
args = [hostName: "192.168.55.4', clientID: "ElixirClient1|0x" <> Base.encode16(inspect self), port: 1531, userName: "APP", password: "APP",  security: Snappyex.Model.SecurityMechanism.plain,  tokenSize: 16, useStringForDecimal: false, properties: :dict.new()]
{:ok, pid} = Snappyex.start_link(args)
params = Map.put_new(Map.new, :params, Snappyex.Model.Row.new(values: []))
{:ok, query, result} = Snappyex.prepare_execute(pid, 'SELECT 1', params, [])
Snappyex.execute(pid, query, params, [])
```

Project is based on code in db_connection and postgrex.

```
# Find listening ports
ss -l -p -n
```
