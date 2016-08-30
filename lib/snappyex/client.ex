defmodule Snappyex.Model do
  use Riffed.Struct, snappydata_types: :auto
end

defmodule Snappyex.Client do
  use Riffed.Client,
  auto_import_structs: false,
  structs: Snappyex.Model,
    client_opts: [
      retries: 3,
      framed: false
    ],
  service: :snappy_data_service_thrift,
  import: [:getPreferredServer,
           :getAllServersWithPreferredServer,
           :openConnection,
           :execute,
           :executeUpdate,
           :executeQuery,
           :prepareStatement,
           :executePrepared,
           :executePreparedUpdate,
           :executePreparedQuery,
           :executePreparedBatch,
           :prepareAndExecute,
           :beginTransaction,
           :setTransactionAttributes,
           :getTransactionAttributes,
           :commitTransaction,
           :rollbackTransaction,
           :prepareCommitTransaction,
           :getNextResultSet,
           :getBlobChunk,
           :getClobChunk,
           :sendBlobChunk,
           :sendClobChunk,
           :freeLob,
           :scrollCursor,
           :executeCursorUpdate,
           :getServiceMetaData,
           :getSchemaMetaData,
           :getIndexInfo,
           :getUDTs,
           :getBestRowIdentifier,
           # end meta-data API
           :fetchActiveConnections,
           :fetchActiveStatements,
           :cancelStatement,
           :closeResultSet,
           :closeStatement,
           :closeConnection,
           :bulkClose]
end
