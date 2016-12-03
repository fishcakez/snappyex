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
```

```bash
sudo yum -y update && sudo yum -y upgrade
sudo yum install -y  gcc gcc-c++ glibc-devel make ncurses-devel openssl-devel autoconf java-1.8.0-openjdk-devel git
sudo yum install -y  wxBase.x86_64
sudo yum groupinstall -y 'Development Tools'
cd /tmp
wget http://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm
sudo rpm -Uvh erlang-solutions-1.0-1.noarch.rpm
sudo yum install -y erlang erlang-rebar
sudo mkdir /opt/elixir
sudo git clone https://github.com/elixir-lang/elixir.git -b v1.3.2 /opt/elixir
cd /opt/elixir
sudo make clean test
sudo ln -s /opt/elixir/bin/iex /usr/local/bin/iex
sudo ln -s /opt/elixir/bin/mix /usr/local/bin/mix
sudo ln -s /opt/elixir/bin/elixir /usr/local/bin/elixir
sudo ln -s /opt/elixir/bin/elixirc /usr/local/bin/elixirc
cd /tmp 
git clone https://github.com/apache/thrift
cd thrift
./bootstrap.sh
./configure 
make 
sudo make install
cd /vagrant/snappyex
mix local.hex --force
# Pause
mix deps.get
mix compile 
iex -S mix
```

See [README-thrift.md](https://github.com/SnappyDataInc/snappydata/blob/master/snappy-tools/README-thrift.md) for SnappyData programming documents.

1. Connect to locator
2. `Snappy.Client.getPreferredServer(
      serverType, null, null)`
3. `Snappy.Client.getPreferredServer([Snappy.Models.ServerType.thrift_gfxd_bp], ["default"], [Snappy.Models.HostAddress.new(hostName: "example.com", port: 1, ipAddress: "127.0.0.1", serverType: Snappy.Models.ServerType.thrift_gfxd_bp)])`
4.
```elixir
args = [host: "192.168.55.4", clientID: "ElixirClient1|0x" <> Base.encode16(inspect self), port: 1531, userName: "APP", password: "APP",  security: Snappyex.Model.SecurityMechanism.plain,  tokenSize: 16, useStringForDecimal: false, properties: :dict.new()]
{:ok, pid} = Snappyex.start_link(args)
params = Map.put_new(Map.new, :params, Snappyex.Model.Row.new(values: []))
{:ok, query, result} = Snappyex.prepare_execute(pid, "CREATE TABLE SCHEMA_MIGRATIONS(HOTEL_ID INT NOT NULL, BOOKING_DATE DATE NOT NULL,ROOMS_TAKEN INT DEFAULT 0, PRIMARY KEY (HOTEL_ID, BOOKING_DATE));", params, [])
Snappyex.execute(pid, query, params, [])

args = [host: "192.168.55.4", clientID: "ElixirClient1|0x" <> Base.encode16(inspect self), port: 1531, userName: "APP", password: "APP",  security: Snappyex.Model.SecurityMechanism.plain,  tokenSize: 16, useStringForDecimal: false, properties: :dict.new()]
{:ok, pid} = Snappyex.start_link(args)
params = Map.put_new(Map.new, :params, Snappyex.Model.Row.new(values: []))
Snappyex.prepare_execute(pid, "CREATE TABLE SCHEMA_MIGRATIONS(HOTEL_ID INT NOT NULL, BOOKING_DATE DATE NOT NULL,ROOMS_TAKEN INT DEFAULT 0, PRIMARY KEY (HOTEL_ID, BOOKING_DATE));", params, [])
#Snappyex.execute(pid, query, params, [])
```

```elixir
{:ok, pid} = Snappyex.start_link([clientHostName: "localhost", host: "localhost", clientID: "ElixirClient1|0x" <> Base.encode16(inspect self), 
     port: 1531, userName: "APP", password: "APP",  security: Snappyex.Model.SecurityMechanism.plain, 
     tokenSize: 16, useStringForDecimal: false, properties: :dict.new])
Snappyex.prepare_execute(pid, "SELECT * FROM SCHEMA\_MIGRATIONS", [])  
#Snappyex.prepare_execute(pid, "SELECT * FROM TRANSACTIONS", [])  
#Snappyex.prepare_execute(pid,"INSERT INTO SCHEMA\_MIGRATIONS (\"version\", \"inserted\_at\") VALUES (1, CURRENT\_TIMESTAMP)", [])
Snappyex.prepare_execute(pid,"INSERT INTO test (\"id\", \"text\") VALUES ($1, $2)", [42, "fortytwo"])
```

```elixir
{:ok, pid} = Snappyex.start_link([clientHostName: "localhost", host: "192.168.55.4", clientID: "ElixirClient1|0x" <> Base.encode16(inspect self), 
     port: 1531, userName: "APP", password: "APP",  security: Snappyex.Model.SecurityMechanism.plain, 
     tokenSize: 16, useStringForDecimal: false, properties: :dict.new])
Snappyex.prepare(pid, %Snappyex.Query{statement: "SELECT * FROM TEST"}) 
```

Project is based on code in db_connection and postgrex.

```
# Find listening ports
ss -l -p -n
```
