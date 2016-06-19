defmodule Snappyex.Client do
  use Riffed.Client,
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

  defenum SnappyType do
    :boolean           -> 1
    :tinyint           -> 2
    :smallint          -> 3
    :integer           -> 4
    :bigint            -> 5
    :float             -> 6
    :real              -> 7
    :double            -> 8
    :decimal           -> 9
    :char              -> 10
    :varchar           -> 11
    :longvarchar       -> 12
    :date              -> 13
    :time              -> 14
    :timestamp         -> 15
    :binary            -> 16
    :varbinary         -> 17
    :longvarbinary     -> 18
    :blob              -> 19
    :clob              -> 20
    :sqlxml            -> 21
    :nulltype          -> 22
    :array             -> 23
    :map               -> 24
    :struct            -> 25
    :other             -> 26
    :json_object       -> 27
    :java_object       -> 28
  end

  defenum ServerType do
    # old DRDA servers
    :drda -> 1
    # Thrift LocatorService using TCompactProtocol
    :thrift_locator_cp -> 2
    # Thrift LocatorService using TBinaryProtocol
    :thrift_locator_bp -> 3
    # Thrift LocatorService using TCompactProtocol over SSL
    :thrift_locator_cp_ssl -> 4
    # Thrift LocatorService using TBinaryProtocol over SSL
    :thrift_locator_bp_ssl -> 5
    # Thrift SnappyDataService using TCompactProtocol
    :thrift_gfxd_cp -> 6
    # Thrift SnappyDataService using TBinaryProtocol
    :thrift_gfxd_bp -> 7
    # Thrift SnappyDataService using TCompactProtocol over SSL
    :thrift_gfxd_cp_ssl -> 8
    # Thrift SnappyDataService using TBinaryProtocol over SSL
    :thrift_gfxd_bp_ssl -> 9
  end

  defenum TransactionAttribute do
    :autocommit -> 1
    :read_only_connection -> 2
    :waiting_mode -> 3
    :disable_batching -> 4
    :sync_commits -> 5
  end

  defenum RowIdLifetime do
    :rowid_unsupported -> 1
    :rowid_valid_other -> 2
    :rowid_valid_session -> 3
    :rowid_valid_transaction -> 4
    :rowid_valid_forever -> 5
  end
  
  defenum ServiceFeature do
    :all_procedures_callable -> 1
    :all_tables_selectable -> 2
    :integrity_enhancement -> 3
    :nulls_sorted_high -> 4
    :nulls_sorted_low -> 5
    :nulls_sorted_start -> 6
    :nulls_sorted_end -> 7
    :uses_local_files -> 8
    :uses_local_file_per_table -> 9
    :mixedcase_identifiers -> 10
    :mixedcase_quoted_identifiers -> 11
    :stores_uppercase_identifiers -> 12
    :stores_lowercase_identifiers -> 13
    :stores_mixedcase_identifiers -> 14
    :stores_uppercase_quoted_identifiers -> 15
    :stores_lowercase_quoted_identifiers -> 16
    :stores_mixedcase_quoted_identifiers -> 17
    :alter_table_add_column -> 18
    :alter_table_drop_column -> 19
    :column_aliasing -> 20
    :null_concat_non_null_is_null -> 21
    :convert -> 22
    :table_correlation_names -> 23
    :table_correlation_names_different -> 24
    :order_by_expressions -> 25
    :order_by_unrelated -> 26
    :group_by -> 27
    :group_by_unrelated -> 28
    :group_by_beyond_select -> 29
    :like_escape -> 30
    :multiple_resultsets -> 31
    :multiple_transactions -> 32
    :non_nullable_columns -> 33
    :sql_grammar_minimum -> 34
    :sql_grammar_core -> 35
    :sql_grammar_extended -> 36
    :sql_grammar_ansi92_entry -> 37
    :sql_grammar_ansi92_intermediate -> 38
    :sql_grammar_ansi92_full -> 39
    :outer_joins -> 40
    :outer_joins_full -> 41
    :outer_joins_limited -> 42
    :schemas_in_dmls -> 43
    :schemas_in_procedure_calls -> 44
    :schemas_in_table_defs -> 45
    :schemas_in_index_defs -> 46
    :schemas_in_privilege_defs -> 47
    :autocommit_failure_closes_all_resultsets -> 48
    :catalogs_in_dmls -> 49
    :catalogs_in_procedure_calls -> 50
    :catalogs_in_table_defs -> 51
    :catalogs_in_index_defs -> 52
    :catalogs_in_privilege_defs -> 53
    :positioned_delete -> 54
    :positioned_update -> 55
    :select_for_update -> 56
    :stored_procedures -> 57
    :subqueries_in_comparisons -> 58
    :subqueries_in_exists -> 59
    :subqueries_in_ins -> 60
    :subqueries_in_quantifieds -> 61
    :subqueries_correlated -> 62
    :union -> 63
    :union_all -> 64
    :open_cursors_across_commit -> 65
    :open_cursors_across_rollback -> 66
    :open_statements_across_commit -> 67
    :open_statements_across_rollback -> 68
    :max_rowsize_includes_blobsize -> 69
    :transactions -> 70
    :transactions_both_dmls_and_ddls -> 71
    :transactions_dmls_only -> 72
    :transactions_ddls_implicit_commit -> 73
    :transactions_ddls_ignored -> 74
    :transactions_savepoints -> 75
    :callable_named_parameters -> 76
    :callable_multiple_open_resultsets -> 77
    :generated_keys_retrieval -> 78
    :generated_keys_always_returned -> 79
    :batch_updates -> 80
    :resultset_forward_only -> 81
    :resultset_scroll_insensitive -> 82
    :resultset_scroll_sensitive -> 83
    :resultset_holdability_close_cursors_at_commit -> 84
    :resultset_holdability_hold_cursors_over_commit -> 85
    :lob_updates_copy -> 86
    :statement_pooling -> 87
    :stored_functions_using_call -> 88
  end

  defenum ServiceFeatureParameterized do
    :transactions_support_isolation -> 1
    :resultset_type -> 2
    :resultset_concurrency_read_only -> 3
    :resultset_concurrency_updatable -> 4
    :resultset_own_updates_visible -> 5
    :resultset_own_deletes_visible -> 6
    :resultset_own_inserts_visible -> 7
    :resultset_others_updates_visible -> 8
    :resultset_others_deletes_visible -> 9
    :resultset_others_inserts_visible -> 10
    :resultset_updates_detected -> 11
    :resultset_deletes_detected -> 12
    :resultset_inserts_detected -> 13
  end
  
  defenum ServiceMetaDataCall do
    :catalogs          -> 1
    :schemas           -> 2
    :tables            -> 3
    :tabletypes        -> 4
    :columns           -> 5
    :tableprivileges   -> 6
    :columnprivileges  -> 7
    :primarykeys       -> 8
    :importedkeys      -> 9
    :exportedkeys      -> 10
    :crossreference    -> 11
    :procedures        -> 12
    :functions         -> 13
    :procedurecolumns  -> 14
    :functioncolumns   -> 15
    :attributes        -> 16
    :typeinfo          -> 17
    :supertypes        -> 18
    :supertables       -> 19
    :versioncolumns    -> 20
    :clientinfoprops   -> 21
    :pseudocolumns     -> 22
  end

  defenum SecurityMechanism do
    :plain -> 1
    :diffie_hellman -> 2
  end
  
  enumerize_struct RowSet, rows: {:list, Row}
  enumerize_struct HostAddress, serverType: ServerType
  enumerize_struct FieldDescriptor, type: FieldType    
  enumerize_struct OpenConnectionArgs, security: SecurityMechanism
  enumerize_struct StatementAttrs, pendingTransactionAttrs: {:map, {TransactionAttribute, :bool}}
  enumerize_struct ServiceMetaData, supportedCONVERT: {:map, {SnappyType, {:set, SnappyType}}}
  enumerize_struct ServiceMetaDataArgs, typeId: SnappyType
  enumerize_struct ColumnDescriptor, type: SnappyType
  enumerize_struct OutputParameter, type: SnappyType
  enumerize_function executeQuery(_, _, StatementAttrs, _) 
  enumerize_function getUDTs(ServiceMetaDataArgs,
                             {:list, SnappyType}), returns: RowSet
  enumerize_function getSchemaMetaData(ServiceMetaDataCall, ServiceMetaDataArgs)
  enumerize_function openConnection(OpenConnectionArgs), returns: ConnectionProperties
  enumerize_function prepareStatement(_, _, {:map, {:i32, OutputParameter}}, StatementAttrs, _)
  enumerize_function getPreferredServer({:set, ServerType}, _, _, HostAddress)
end
