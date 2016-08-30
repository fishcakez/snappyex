defmodule Snappyex.Locator do
  use Riffed.Client,
  structs: Snappyex.Locator.Models,
  client_opts: [
    retries: 3,
    framed: false
  ],
  service: :locator_service_thrift,
  import: [:getPreferredServer,
           :getAllServersWithPreferredServer]
  
  defenum ServerType do
    :drda -> 1
    :thrift_locator_cp -> 2
    :thrift_locator_bp -> 3
    :thrift_locator_cp_ssl -> 4
    :thrift_locator_bp_ssl -> 5
    :thrift_gfxd_cp -> 6
    :thrift_gfxd_bp -> 7
    :thrift_gfxd_cp_ssl -> 8
    :thrift_gfxd_bp_ssl -> 9
  end
  enumerize_struct HostAdress, serverType: ServerType
  enumerize_function getPreferredServer({:set, ServerType}, _, _, HostAddress)
end
