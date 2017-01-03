defmodule Snappyex.Model do
  use Riffed.Struct, snappydata_types: :auto
end

defmodule Snappyex.Client do
  use Riffed.Client,
  auto_import_structs: false,
  structs: Snappyex.Model,
  client_opts: [
    retries: 3,
    framed: false,
  ],
  service: :snappy_data_service_thrift
end
