defmodule(SnappyData.Thrift.LocatorService.Handler) do
  @callback(get_all_servers_with_preferred_server(server_types :: %MapSet{}, server_groups :: %MapSet{}, failed_servers :: %MapSet{}) :: [%SnappyData.Thrift.HostAddress{}])
  @callback(get_preferred_server(server_types :: %MapSet{}, server_groups :: %MapSet{}, failed_servers :: %MapSet{}) :: %SnappyData.Thrift.HostAddress{})
end