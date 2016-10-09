defmodule Snappyex.Locator do
  use Riffed.Client,
  structs: Snappyex.Locator.Models,
  client_opts: [
    recv_timeout: 15_000,
    retries: 3,
    keepalive: true,
    framed: false
  ],
  service: :locator_service_thrift,
  auto_import_structs: false
end
