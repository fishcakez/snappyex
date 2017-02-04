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
{:ok, pid} = Snappyex.start_link([clientHostName: "104.196.243.201", host: "localhost", clientID: "ElixirClient1|0x" <> Base.encode16(inspect self), 
     port: 1531, userName: "APP", password: "APP",  security: Snappyex.Model.SecurityMechanism.plain, 
     tokenSize: 16, use_string_for_decimal: false, properties: :dict.new])
Snappyex.prepare_execute(pid, "SELECT * FROM SCHEMA\_MIGRATIONS", [])  
#Snappyex.prepare_execute(pid, "SELECT * FROM TRANSACTIONS", [])  
#Snappyex.prepare_execute(pid,"INSERT INTO SCHEMA\_MIGRATIONS (\"version\", \"inserted\_at\") VALUES (1, CURRENT\_TIMESTAMP)", [])
Snappyex.prepare_execute(pid,"INSERT INTO test (\"id\", \"text\") VALUES ($1, $2)", [42, "fortytwo"])
```

```elixir
{:ok, pid} = Snappyex.start_link([clientHostName: "localhost", host: "104.196.243.201" , clientID: "ElixirClient1|0x" <> Base.encode16(inspect self), 
     port: 1531, userName: "APP", password: "APP",  security: Snappyex.Model.SecurityMechanism.plain, 
     tokenSize: 16, useStringForDecimal: false, properties: HashDict.put(HashDict.new(), "load-balance", "false")])
Snappyex.prepare(pid, %Snappyex.Query{statement: "SELECT * FROM TEST"}) 
```

```
{:ok, pid} = Snappyex.start_link([clientHostName: "localhost", host: "104.196.243.201" , clientID: "ElixirClient1|0x" <> Base.encode16(inspect self), 
     port: 1531, userName: "APP", password: "APP",  security: Snappyex.Model.SecurityMechanism.plain, 
     tokenSize: 16, useStringForDecimal: false, properties: HashDict.put(HashDict.new(), "load-balance", "false")])
Snappyex.prepare_execute(pid, "name", %Snappyex.Query{statement: "SELECT 123"}, [])
```


Project is based on code in db_connection and postgrex.

```
# Find listening ports
ss -l -p -n
```

```
# Use new framed transport
alias SnappyData.Thrift.SnappyDataService.Binary.Framed.Client
{:ok, client} = Client.start_link("192.168.0.21", 1531, tcp_opts: [timeout: 5_000], gen_server_opts: [timeout: 20_000])
#Todo change hostname.
require SnappyData.Thrift.SecurityMechanism
 {:ok, %SnappyData.Thrift.ConnectionProperties{client_host_name: client_host_name,
  client_id: client_id, conn_id: conn_id,
  token: token, user_name: user_name}} = Client.open_connection(client, %SnappyData.Thrift.OpenConnectionArgs{client_host_name: "localhost", client_id: "ElixirClient1|0x" <> Base.encode16(inspect self),
                                                                        password: "APP", properties: %{"load-balance" => "false"}, for_xa: false, security:  SnappyData.Thrift.SecurityMechanism.plain, token_size: 16,
                                                                        use_string_for_decimal: false, user_name: "APP"})

Client.execute(client, conn_id, "CREATE TABLE APP.TEST (id int primary key, text varchar(10))", nil, nil, token)
{:ok,
 %SnappyData.Thrift.PrepareResult{parameter_meta_data: parameter_meta_data,
  result_set_meta_data: result_set_meta_data, statement_id: statement_id, statement_type: statement_type, warnings: warnings}} = Client.prepare_statement(client, conn_id, "INSERT INTO APP.TEST (id, text) VALUES (?, ?)", nil, nil, token)

Client.execute_prepared(client, statement_id,
 %SnappyData.Thrift.Row{
      values: [%SnappyData.Thrift.ColumnValue{i32_val: 42}, 
               %SnappyData.Thrift.ColumnValue{string_val: "fortytwo"}
      ]}, 
      [],
      %SnappyData.Thrift.StatementAttrs{}, 
      token)

Client.execute_prepared_update(client, statement_id,
 %SnappyData.Thrift.Row{
      values: [%SnappyData.Thrift.ColumnValue{i32_val: 42}, 
               %SnappyData.Thrift.ColumnValue{string_val: "fortytwo"}
      ]}, 
      %SnappyData.Thrift.StatementAttrs{}, 
      token)

Client.prepare_and_execute(client, conn_id, "SELECT * from APP.TEST", [], [], SnappyData.Thrift.StatementAttrs.new, token)

Client.execute(client, conn_id, "SELECT * from APP.TEST", nil, nil, token)

{:ok,
 %SnappyData.Thrift.PrepareResult{parameter_meta_data: parameter_meta_data,
  result_set_meta_data: result_set_meta_data, statement_id: statement_id, statement_type: statement_type, warnings: warnings}} = Client.prepare_statement(client, conn_id, "SELECT * from APP.TEST", nil, nil, token)

Client.execute_prepared(client, statement_id,
 %SnappyData.Thrift.Row{
      values: []}, 
      [],
      %SnappyData.Thrift.StatementAttrs{}, 
      token)
```