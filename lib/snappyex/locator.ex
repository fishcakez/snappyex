defmodule Snappyex.Locator do
  use Riffed.Client,
  structs: Snappyex.Model,
  client_opts: [
    retries: 3,
    framed: false,
    recv_timeout: 15_000
  ],
  service: :locator_service_thrift,
  auto_import_structs: false
end
