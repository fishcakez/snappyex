defmodule Snappyex.Locator do
  use Riffed.Client,
  structs: Snappyex.Locator.Models,
  client_opts: [
    retries: 3,
    framed: false
  ],
  service: :locator_service_thrift,
  auto_import_structs: false
end
