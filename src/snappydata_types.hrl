-ifndef(_snappydata_types_included).
-define(_snappydata_types_included, yeah).

-define(SNAPPYDATA_SNAPPYTYPE_BOOLEAN, 1).
-define(SNAPPYDATA_SNAPPYTYPE_TINYINT, 2).
-define(SNAPPYDATA_SNAPPYTYPE_SMALLINT, 3).
-define(SNAPPYDATA_SNAPPYTYPE_INTEGER, 4).
-define(SNAPPYDATA_SNAPPYTYPE_BIGINT, 5).
-define(SNAPPYDATA_SNAPPYTYPE_REAL, 6).
-define(SNAPPYDATA_SNAPPYTYPE_DOUBLE, 7).
-define(SNAPPYDATA_SNAPPYTYPE_FLOAT, 8).
-define(SNAPPYDATA_SNAPPYTYPE_DECIMAL, 9).
-define(SNAPPYDATA_SNAPPYTYPE_CHAR, 10).
-define(SNAPPYDATA_SNAPPYTYPE_VARCHAR, 11).
-define(SNAPPYDATA_SNAPPYTYPE_LONGVARCHAR, 12).
-define(SNAPPYDATA_SNAPPYTYPE_DATE, 13).
-define(SNAPPYDATA_SNAPPYTYPE_TIME, 14).
-define(SNAPPYDATA_SNAPPYTYPE_TIMESTAMP, 15).
-define(SNAPPYDATA_SNAPPYTYPE_BINARY, 16).
-define(SNAPPYDATA_SNAPPYTYPE_VARBINARY, 17).
-define(SNAPPYDATA_SNAPPYTYPE_LONGVARBINARY, 18).
-define(SNAPPYDATA_SNAPPYTYPE_BLOB, 19).
-define(SNAPPYDATA_SNAPPYTYPE_CLOB, 20).
-define(SNAPPYDATA_SNAPPYTYPE_SQLXML, 21).
-define(SNAPPYDATA_SNAPPYTYPE_ARRAY, 22).
-define(SNAPPYDATA_SNAPPYTYPE_MAP, 23).
-define(SNAPPYDATA_SNAPPYTYPE_STRUCT, 24).
-define(SNAPPYDATA_SNAPPYTYPE_NULLTYPE, 25).
-define(SNAPPYDATA_SNAPPYTYPE_JSON, 26).
-define(SNAPPYDATA_SNAPPYTYPE_JAVA_OBJECT, 27).
-define(SNAPPYDATA_SNAPPYTYPE_OTHER, 28).

-define(SNAPPYDATA_TRANSACTIONATTRIBUTE_AUTOCOMMIT, 1).
-define(SNAPPYDATA_TRANSACTIONATTRIBUTE_READ_ONLY_CONNECTION, 2).
-define(SNAPPYDATA_TRANSACTIONATTRIBUTE_WAITING_MODE, 3).
-define(SNAPPYDATA_TRANSACTIONATTRIBUTE_DISABLE_BATCHING, 4).
-define(SNAPPYDATA_TRANSACTIONATTRIBUTE_SYNC_COMMITS, 5).

-define(SNAPPYDATA_ROWIDLIFETIME_ROWID_UNSUPPORTED, 1).
-define(SNAPPYDATA_ROWIDLIFETIME_ROWID_VALID_OTHER, 2).
-define(SNAPPYDATA_ROWIDLIFETIME_ROWID_VALID_SESSION, 3).
-define(SNAPPYDATA_ROWIDLIFETIME_ROWID_VALID_TRANSACTION, 4).
-define(SNAPPYDATA_ROWIDLIFETIME_ROWID_VALID_FOREVER, 5).

-define(SNAPPYDATA_SERVICEFEATURE_ALL_PROCEDURES_CALLABLE, 1).
-define(SNAPPYDATA_SERVICEFEATURE_ALL_TABLES_SELECTABLE, 2).
-define(SNAPPYDATA_SERVICEFEATURE_INTEGRITY_ENHANCEMENT, 3).
-define(SNAPPYDATA_SERVICEFEATURE_NULLS_SORTED_HIGH, 4).
-define(SNAPPYDATA_SERVICEFEATURE_NULLS_SORTED_LOW, 5).
-define(SNAPPYDATA_SERVICEFEATURE_NULLS_SORTED_START, 6).
-define(SNAPPYDATA_SERVICEFEATURE_NULLS_SORTED_END, 7).
-define(SNAPPYDATA_SERVICEFEATURE_USES_LOCAL_FILES, 8).
-define(SNAPPYDATA_SERVICEFEATURE_USES_LOCAL_FILE_PER_TABLE, 9).
-define(SNAPPYDATA_SERVICEFEATURE_MIXEDCASE_IDENTIFIERS, 10).
-define(SNAPPYDATA_SERVICEFEATURE_MIXEDCASE_QUOTED_IDENTIFIERS, 11).
-define(SNAPPYDATA_SERVICEFEATURE_STORES_UPPERCASE_IDENTIFIERS, 12).
-define(SNAPPYDATA_SERVICEFEATURE_STORES_LOWERCASE_IDENTIFIERS, 13).
-define(SNAPPYDATA_SERVICEFEATURE_STORES_MIXEDCASE_IDENTIFIERS, 14).
-define(SNAPPYDATA_SERVICEFEATURE_STORES_UPPERCASE_QUOTED_IDENTIFIERS, 15).
-define(SNAPPYDATA_SERVICEFEATURE_STORES_LOWERCASE_QUOTED_IDENTIFIERS, 16).
-define(SNAPPYDATA_SERVICEFEATURE_STORES_MIXEDCASE_QUOTED_IDENTIFIERS, 17).
-define(SNAPPYDATA_SERVICEFEATURE_ALTER_TABLE_ADD_COLUMN, 18).
-define(SNAPPYDATA_SERVICEFEATURE_ALTER_TABLE_DROP_COLUMN, 19).
-define(SNAPPYDATA_SERVICEFEATURE_COLUMN_ALIASING, 20).
-define(SNAPPYDATA_SERVICEFEATURE_NULL_CONCAT_NON_NULL_IS_NULL, 21).
-define(SNAPPYDATA_SERVICEFEATURE_CONVERT, 22).
-define(SNAPPYDATA_SERVICEFEATURE_TABLE_CORRELATION_NAMES, 23).
-define(SNAPPYDATA_SERVICEFEATURE_TABLE_CORRELATION_NAMES_DIFFERENT, 24).
-define(SNAPPYDATA_SERVICEFEATURE_ORDER_BY_EXPRESSIONS, 25).
-define(SNAPPYDATA_SERVICEFEATURE_ORDER_BY_UNRELATED, 26).
-define(SNAPPYDATA_SERVICEFEATURE_GROUP_BY, 27).
-define(SNAPPYDATA_SERVICEFEATURE_GROUP_BY_UNRELATED, 28).
-define(SNAPPYDATA_SERVICEFEATURE_GROUP_BY_BEYOND_SELECT, 29).
-define(SNAPPYDATA_SERVICEFEATURE_LIKE_ESCAPE, 30).
-define(SNAPPYDATA_SERVICEFEATURE_MULTIPLE_RESULTSETS, 31).
-define(SNAPPYDATA_SERVICEFEATURE_MULTIPLE_TRANSACTIONS, 32).
-define(SNAPPYDATA_SERVICEFEATURE_NON_NULLABLE_COLUMNS, 33).
-define(SNAPPYDATA_SERVICEFEATURE_SQL_GRAMMAR_MINIMUM, 34).
-define(SNAPPYDATA_SERVICEFEATURE_SQL_GRAMMAR_CORE, 35).
-define(SNAPPYDATA_SERVICEFEATURE_SQL_GRAMMAR_EXTENDED, 36).
-define(SNAPPYDATA_SERVICEFEATURE_SQL_GRAMMAR_ANSI92_ENTRY, 37).
-define(SNAPPYDATA_SERVICEFEATURE_SQL_GRAMMAR_ANSI92_INTERMEDIATE, 38).
-define(SNAPPYDATA_SERVICEFEATURE_SQL_GRAMMAR_ANSI92_FULL, 39).
-define(SNAPPYDATA_SERVICEFEATURE_OUTER_JOINS, 40).
-define(SNAPPYDATA_SERVICEFEATURE_OUTER_JOINS_FULL, 41).
-define(SNAPPYDATA_SERVICEFEATURE_OUTER_JOINS_LIMITED, 42).
-define(SNAPPYDATA_SERVICEFEATURE_SCHEMAS_IN_DMLS, 43).
-define(SNAPPYDATA_SERVICEFEATURE_SCHEMAS_IN_PROCEDURE_CALLS, 44).
-define(SNAPPYDATA_SERVICEFEATURE_SCHEMAS_IN_TABLE_DEFS, 45).
-define(SNAPPYDATA_SERVICEFEATURE_SCHEMAS_IN_INDEX_DEFS, 46).
-define(SNAPPYDATA_SERVICEFEATURE_SCHEMAS_IN_PRIVILEGE_DEFS, 47).
-define(SNAPPYDATA_SERVICEFEATURE_AUTOCOMMIT_FAILURE_CLOSES_ALL_RESULTSETS, 48).
-define(SNAPPYDATA_SERVICEFEATURE_CATALOGS_IN_DMLS, 49).
-define(SNAPPYDATA_SERVICEFEATURE_CATALOGS_IN_PROCEDURE_CALLS, 50).
-define(SNAPPYDATA_SERVICEFEATURE_CATALOGS_IN_TABLE_DEFS, 51).
-define(SNAPPYDATA_SERVICEFEATURE_CATALOGS_IN_INDEX_DEFS, 52).
-define(SNAPPYDATA_SERVICEFEATURE_CATALOGS_IN_PRIVILEGE_DEFS, 53).
-define(SNAPPYDATA_SERVICEFEATURE_POSITIONED_DELETE, 54).
-define(SNAPPYDATA_SERVICEFEATURE_POSITIONED_UPDATE, 55).
-define(SNAPPYDATA_SERVICEFEATURE_SELECT_FOR_UPDATE, 56).
-define(SNAPPYDATA_SERVICEFEATURE_STORED_PROCEDURES, 57).
-define(SNAPPYDATA_SERVICEFEATURE_SUBQUERIES_IN_COMPARISONS, 58).
-define(SNAPPYDATA_SERVICEFEATURE_SUBQUERIES_IN_EXISTS, 59).
-define(SNAPPYDATA_SERVICEFEATURE_SUBQUERIES_IN_INS, 60).
-define(SNAPPYDATA_SERVICEFEATURE_SUBQUERIES_IN_QUANTIFIEDS, 61).
-define(SNAPPYDATA_SERVICEFEATURE_SUBQUERIES_CORRELATED, 62).
-define(SNAPPYDATA_SERVICEFEATURE_UNION, 63).
-define(SNAPPYDATA_SERVICEFEATURE_UNION_ALL, 64).
-define(SNAPPYDATA_SERVICEFEATURE_OPEN_CURSORS_ACROSS_COMMIT, 65).
-define(SNAPPYDATA_SERVICEFEATURE_OPEN_CURSORS_ACROSS_ROLLBACK, 66).
-define(SNAPPYDATA_SERVICEFEATURE_OPEN_STATEMENTS_ACROSS_COMMIT, 67).
-define(SNAPPYDATA_SERVICEFEATURE_OPEN_STATEMENTS_ACROSS_ROLLBACK, 68).
-define(SNAPPYDATA_SERVICEFEATURE_MAX_ROWSIZE_INCLUDES_BLOBSIZE, 69).
-define(SNAPPYDATA_SERVICEFEATURE_TRANSACTIONS, 70).
-define(SNAPPYDATA_SERVICEFEATURE_TRANSACTIONS_BOTH_DMLS_AND_DDLS, 71).
-define(SNAPPYDATA_SERVICEFEATURE_TRANSACTIONS_DMLS_ONLY, 72).
-define(SNAPPYDATA_SERVICEFEATURE_TRANSACTIONS_DDLS_IMPLICIT_COMMIT, 73).
-define(SNAPPYDATA_SERVICEFEATURE_TRANSACTIONS_DDLS_IGNORED, 74).
-define(SNAPPYDATA_SERVICEFEATURE_TRANSACTIONS_SAVEPOINTS, 75).
-define(SNAPPYDATA_SERVICEFEATURE_CALLABLE_NAMED_PARAMETERS, 76).
-define(SNAPPYDATA_SERVICEFEATURE_CALLABLE_MULTIPLE_OPEN_RESULTSETS, 77).
-define(SNAPPYDATA_SERVICEFEATURE_GENERATED_KEYS_RETRIEVAL, 78).
-define(SNAPPYDATA_SERVICEFEATURE_GENERATED_KEYS_ALWAYS_RETURNED, 79).
-define(SNAPPYDATA_SERVICEFEATURE_BATCH_UPDATES, 80).
-define(SNAPPYDATA_SERVICEFEATURE_RESULTSET_FORWARD_ONLY, 81).
-define(SNAPPYDATA_SERVICEFEATURE_RESULTSET_SCROLL_INSENSITIVE, 82).
-define(SNAPPYDATA_SERVICEFEATURE_RESULTSET_SCROLL_SENSITIVE, 83).
-define(SNAPPYDATA_SERVICEFEATURE_RESULTSET_HOLDABILITY_CLOSE_CURSORS_AT_COMMIT, 84).
-define(SNAPPYDATA_SERVICEFEATURE_RESULTSET_HOLDABILITY_HOLD_CURSORS_OVER_COMMIT, 85).
-define(SNAPPYDATA_SERVICEFEATURE_LOB_UPDATES_COPY, 86).
-define(SNAPPYDATA_SERVICEFEATURE_STATEMENT_POOLING, 87).
-define(SNAPPYDATA_SERVICEFEATURE_STORED_FUNCTIONS_USING_CALL, 88).

-define(SNAPPYDATA_SERVICEFEATUREPARAMETERIZED_TRANSACTIONS_SUPPORT_ISOLATION, 1).
-define(SNAPPYDATA_SERVICEFEATUREPARAMETERIZED_RESULTSET_TYPE, 2).
-define(SNAPPYDATA_SERVICEFEATUREPARAMETERIZED_RESULTSET_CONCURRENCY_READ_ONLY, 3).
-define(SNAPPYDATA_SERVICEFEATUREPARAMETERIZED_RESULTSET_CONCURRENCY_UPDATABLE, 4).
-define(SNAPPYDATA_SERVICEFEATUREPARAMETERIZED_RESULTSET_OWN_UPDATES_VISIBLE, 5).
-define(SNAPPYDATA_SERVICEFEATUREPARAMETERIZED_RESULTSET_OWN_DELETES_VISIBLE, 6).
-define(SNAPPYDATA_SERVICEFEATUREPARAMETERIZED_RESULTSET_OWN_INSERTS_VISIBLE, 7).
-define(SNAPPYDATA_SERVICEFEATUREPARAMETERIZED_RESULTSET_OTHERS_UPDATES_VISIBLE, 8).
-define(SNAPPYDATA_SERVICEFEATUREPARAMETERIZED_RESULTSET_OTHERS_DELETES_VISIBLE, 9).
-define(SNAPPYDATA_SERVICEFEATUREPARAMETERIZED_RESULTSET_OTHERS_INSERTS_VISIBLE, 10).
-define(SNAPPYDATA_SERVICEFEATUREPARAMETERIZED_RESULTSET_UPDATES_DETECTED, 11).
-define(SNAPPYDATA_SERVICEFEATUREPARAMETERIZED_RESULTSET_DELETES_DETECTED, 12).
-define(SNAPPYDATA_SERVICEFEATUREPARAMETERIZED_RESULTSET_INSERTS_DETECTED, 13).

-define(SNAPPYDATA_SERVICEMETADATACALL_CATALOGS, 1).
-define(SNAPPYDATA_SERVICEMETADATACALL_SCHEMAS, 2).
-define(SNAPPYDATA_SERVICEMETADATACALL_TABLES, 3).
-define(SNAPPYDATA_SERVICEMETADATACALL_TABLETYPES, 4).
-define(SNAPPYDATA_SERVICEMETADATACALL_COLUMNS, 5).
-define(SNAPPYDATA_SERVICEMETADATACALL_TABLEPRIVILEGES, 6).
-define(SNAPPYDATA_SERVICEMETADATACALL_COLUMNPRIVILEGES, 7).
-define(SNAPPYDATA_SERVICEMETADATACALL_PRIMARYKEYS, 8).
-define(SNAPPYDATA_SERVICEMETADATACALL_IMPORTEDKEYS, 9).
-define(SNAPPYDATA_SERVICEMETADATACALL_EXPORTEDKEYS, 10).
-define(SNAPPYDATA_SERVICEMETADATACALL_CROSSREFERENCE, 11).
-define(SNAPPYDATA_SERVICEMETADATACALL_PROCEDURES, 12).
-define(SNAPPYDATA_SERVICEMETADATACALL_FUNCTIONS, 13).
-define(SNAPPYDATA_SERVICEMETADATACALL_PROCEDURECOLUMNS, 14).
-define(SNAPPYDATA_SERVICEMETADATACALL_FUNCTIONCOLUMNS, 15).
-define(SNAPPYDATA_SERVICEMETADATACALL_ATTRIBUTES, 16).
-define(SNAPPYDATA_SERVICEMETADATACALL_TYPEINFO, 17).
-define(SNAPPYDATA_SERVICEMETADATACALL_SUPERTYPES, 18).
-define(SNAPPYDATA_SERVICEMETADATACALL_SUPERTABLES, 19).
-define(SNAPPYDATA_SERVICEMETADATACALL_VERSIONCOLUMNS, 20).
-define(SNAPPYDATA_SERVICEMETADATACALL_CLIENTINFOPROPS, 21).
-define(SNAPPYDATA_SERVICEMETADATACALL_PSEUDOCOLUMNS, 22).

-define(SNAPPYDATA_SECURITYMECHANISM_PLAIN, 1).
-define(SNAPPYDATA_SECURITYMECHANISM_DIFFIE_HELLMAN, 2).

-define(SNAPPYDATA_SERVERTYPE_DRDA, 1).
-define(SNAPPYDATA_SERVERTYPE_THRIFT_LOCATOR_CP, 2).
-define(SNAPPYDATA_SERVERTYPE_THRIFT_LOCATOR_BP, 3).
-define(SNAPPYDATA_SERVERTYPE_THRIFT_LOCATOR_CP_SSL, 4).
-define(SNAPPYDATA_SERVERTYPE_THRIFT_LOCATOR_BP_SSL, 5).
-define(SNAPPYDATA_SERVERTYPE_THRIFT_SNAPPY_CP, 6).
-define(SNAPPYDATA_SERVERTYPE_THRIFT_SNAPPY_BP, 7).
-define(SNAPPYDATA_SERVERTYPE_THRIFT_SNAPPY_CP_SSL, 8).
-define(SNAPPYDATA_SERVERTYPE_THRIFT_SNAPPY_BP_SSL, 9).

-define(SNAPPYDATA_CURSORUPDATEOPERATION_UPDATE_OP, 1).
-define(SNAPPYDATA_CURSORUPDATEOPERATION_INSERT_OP, 2).
-define(SNAPPYDATA_CURSORUPDATEOPERATION_DELETE_OP, 3).

%% struct 'Decimal'

-record('Decimal', {'signum' :: integer(),
                    'scale' :: integer(),
                    'magnitude' :: string() | binary()}).
-type 'Decimal'() :: #'Decimal'{}.

%% struct 'Timestamp'

-record('Timestamp', {'secsSinceEpoch' :: integer(),
                      'nanos' :: integer()}).
-type 'Timestamp'() :: #'Timestamp'{}.

%% struct 'JSONValue'

-record('JSONValue', {'string_val' :: string() | binary(),
                      'bool_val' :: boolean(),
                      'i32_val' :: integer(),
                      'i64_val' :: integer(),
                      'double_val' :: float(),
                      'object_val' :: dict:dict(),
                      'array_val' :: list(),
                      'null_val' :: boolean()}).
-type 'JSONValue'() :: #'JSONValue'{}.

%% struct 'JSONObject'

-record('JSONObject', {'pairs' :: dict:dict(),
                       'array' :: list()}).
-type 'JSONObject'() :: #'JSONObject'{}.

%% struct 'BlobChunk'

-record('BlobChunk', {'chunk' :: string() | binary(),
                      'last' :: boolean(),
                      'lobId' :: integer(),
                      'offset' :: integer(),
                      'totalLength' :: integer()}).
-type 'BlobChunk'() :: #'BlobChunk'{}.

%% struct 'ClobChunk'

-record('ClobChunk', {'chunk' :: string() | binary(),
                      'last' :: boolean(),
                      'lobId' :: integer(),
                      'offset' :: integer(),
                      'totalLength' :: integer()}).
-type 'ClobChunk'() :: #'ClobChunk'{}.

%% struct 'ServiceMetaData'

-record('ServiceMetaData', {'productName' :: string() | binary(),
                            'productVersion' :: string() | binary(),
                            'productMajorVersion' :: integer(),
                            'productMinorVersion' :: integer(),
                            'jdbcMajorVersion' :: integer(),
                            'jdbcMinorVersion' :: integer(),
                            'identifierQuote' :: string() | binary(),
                            'sqlKeywords' = [] :: list(),
                            'numericFunctions' = [] :: list(),
                            'stringFunctions' = [] :: list(),
                            'systemFunctions' = [] :: list(),
                            'dateTimeFunctions' = [] :: list(),
                            'searchStringEscape' :: string() | binary(),
                            'extraNameCharacters' :: string() | binary(),
                            'supportedCONVERT' = dict:new() :: dict:dict(),
                            'schemaTerm' :: string() | binary(),
                            'procedureTerm' :: string() | binary(),
                            'catalogTerm' :: string() | binary(),
                            'catalogSeparator' :: string() | binary(),
                            'maxBinaryLiteralLength' :: integer(),
                            'maxCharLiteralLength' :: integer(),
                            'maxColumnsInGroupBy' :: integer(),
                            'maxColumnsInIndex' :: integer(),
                            'maxColumnsInOrderBy' :: integer(),
                            'maxColumnsInSelect' :: integer(),
                            'maxColumnsInTable' :: integer(),
                            'maxConnections' :: integer(),
                            'maxIndexLength' :: integer(),
                            'maxRowSize' :: integer(),
                            'maxStatementLength' :: integer(),
                            'maxOpenStatements' :: integer(),
                            'maxTableNamesInSelect' :: integer(),
                            'maxColumnNameLength' :: integer(),
                            'maxCursorNameLength' :: integer(),
                            'maxSchemaNameLength' :: integer(),
                            'maxProcedureNameLength' :: integer(),
                            'maxCatalogNameLength' :: integer(),
                            'maxTableNameLength' :: integer(),
                            'maxUserNameLength' :: integer(),
                            'defaultTransactionIsolation' :: integer(),
                            'defaultResultSetType' :: integer(),
                            'defaultResultSetHoldabilityHoldCursorsOverCommit' :: boolean(),
                            'sqlStateIsXOpen' :: boolean(),
                            'catalogAtStart' :: boolean(),
                            'transactionDefaults' = dict:new() :: dict:dict(),
                            'rowIdLifeTime' :: integer(),
                            'supportedFeatures' = sets:new() :: sets:set(),
                            'featuresWithParams' = dict:new() :: dict:dict()}).
-type 'ServiceMetaData'() :: #'ServiceMetaData'{}.

%% struct 'ServiceMetaDataArgs'

-record('ServiceMetaDataArgs', {'connId' :: integer(),
                                'driverType' :: integer(),
                                'token' :: string() | binary(),
                                'schema' :: string() | binary(),
                                'table' :: string() | binary(),
                                'tableTypes' :: list(),
                                'columnName' :: string() | binary(),
                                'foreignSchema' :: string() | binary(),
                                'foreignTable' :: string() | binary(),
                                'procedureName' :: string() | binary(),
                                'functionName' :: string() | binary(),
                                'attributeName' :: string() | binary(),
                                'typeName' :: string() | binary(),
                                'typeId' :: integer()}).
-type 'ServiceMetaDataArgs'() :: #'ServiceMetaDataArgs'{}.

%% struct 'OpenConnectionArgs'

-record('OpenConnectionArgs', {'clientHostName' :: string() | binary(),
                               'clientID' :: string() | binary(),
                               'security' :: integer(),
                               'userName' :: string() | binary(),
                               'password' :: string() | binary(),
                               'tokenSize' :: integer(),
                               'useStringForDecimal' :: boolean(),
                               'properties' :: dict:dict()}).
-type 'OpenConnectionArgs'() :: #'OpenConnectionArgs'{}.

%% struct 'ConnectionProperties'

-record('ConnectionProperties', {'connId' :: integer(),
                                 'clientHostName' :: string() | binary(),
                                 'clientID' :: string() | binary(),
                                 'userName' :: string() | binary(),
                                 'token' :: string() | binary()}).
-type 'ConnectionProperties'() :: #'ConnectionProperties'{}.

%% struct 'HostAddress'

-record('HostAddress', {'hostName' :: string() | binary(),
                        'port' :: integer(),
                        'ipAddress' :: string() | binary(),
                        'serverType' :: integer()}).
-type 'HostAddress'() :: #'HostAddress'{}.

%% struct 'SnappyExceptionData'

-record('SnappyExceptionData', {'reason' :: string() | binary(),
                                'sqlState' :: string() | binary(),
                                'severity' :: integer()}).
-type 'SnappyExceptionData'() :: #'SnappyExceptionData'{}.

%% struct 'SnappyException'

-record('SnappyException', {'exceptionData' = #'SnappyExceptionData'{} :: 'SnappyExceptionData'(),
                            'serverInfo' :: string() | binary(),
                            'nextExceptions' :: list()}).
-type 'SnappyException'() :: #'SnappyException'{}.

%% struct 'StatementAttrs'

-record('StatementAttrs', {'resultSetType' :: integer(),
                           'updatable' :: boolean(),
                           'holdCursorsOverCommit' :: boolean(),
                           'requireAutoIncCols' :: boolean(),
                           'autoIncColumns' :: list(),
                           'autoIncColumnNames' :: list(),
                           'batchSize' = 1024 :: integer(),
                           'fetchReverse' :: boolean(),
                           'lobChunkSize' :: integer(),
                           'maxRows' :: integer(),
                           'maxFieldSize' :: integer(),
                           'timeout' :: integer(),
                           'cursorName' :: string() | binary(),
                           'possibleDuplicate' :: boolean(),
                           'poolable' :: boolean(),
                           'doEscapeProcessing' :: boolean(),
                           'pendingTransactionAttrs' :: dict:dict()}).
-type 'StatementAttrs'() :: #'StatementAttrs'{}.

%% struct 'DateTime'

-record('DateTime', {'secsSinceEpoch' :: integer()}).
-type 'DateTime'() :: #'DateTime'{}.

%% struct 'ColumnValue'

-record('ColumnValue', {'bool_val' :: boolean(),
                        'byte_val' :: integer(),
                        'i16_val' :: integer(),
                        'i32_val' :: integer(),
                        'i64_val' :: integer(),
                        'float_val' :: integer(),
                        'double_val' :: float(),
                        'string_val' :: string() | binary(),
                        'decimal_val' :: 'Decimal'(),
                        'date_val' :: 'DateTime'(),
                        'time_val' :: 'DateTime'(),
                        'timestamp_val' :: 'Timestamp'(),
                        'binary_val' :: string() | binary(),
                        'blob_val' :: 'BlobChunk'(),
                        'clob_val' :: 'ClobChunk'(),
                        'array_val' :: list(),
                        'map_val' :: dict:dict(),
                        'struct_val' :: list(),
                        'null_val' :: boolean(),
                        'json_val' :: 'JSONObject'(),
                        'java_val' :: string() | binary()}).
-type 'ColumnValue'() :: #'ColumnValue'{}.

%% struct 'ColumnDescriptor'

-record('ColumnDescriptor', {'type' :: integer(),
                             'precision' :: integer(),
                             'scale' :: integer(),
                             'name' :: string() | binary(),
                             'fullTableName' :: string() | binary(),
                             'updatable' :: boolean(),
                             'definitelyUpdatable' :: boolean(),
                             'nullable' :: boolean(),
                             'autoIncrement' :: boolean(),
                             'parameterIn' :: boolean(),
                             'parameterOut' :: boolean(),
                             'elementTypes' :: list(),
                             'udtTypeAndClassName' :: string() | binary()}).
-type 'ColumnDescriptor'() :: #'ColumnDescriptor'{}.

%% struct 'Row'

-record('Row', {'values' = [] :: list()}).
-type 'Row'() :: #'Row'{}.

%% struct 'OutputParameter'

-record('OutputParameter', {'type' :: integer(),
                            'scale' :: integer(),
                            'typeName' :: string() | binary()}).
-type 'OutputParameter'() :: #'OutputParameter'{}.

%% struct 'RowSet'

-record('RowSet', {'rows' = [] :: list(),
                   'flags' :: integer(),
                   'cursorId' :: integer(),
                   'statementId' :: integer(),
                   'connId' :: integer(),
                   'token' :: string() | binary(),
                   'source' :: 'HostAddress'(),
                   'offset' :: integer(),
                   'metadata' :: list(),
                   'cursorName' :: string() | binary(),
                   'warnings' :: 'SnappyExceptionData'(),
                   'rowIdsForUpdateOrDelete' :: list()}).
-type 'RowSet'() :: #'RowSet'{}.

%% struct 'PrepareResult'

-record('PrepareResult', {'statementId' :: integer(),
                          'statementType' :: integer(),
                          'parameterMetaData' = [] :: list(),
                          'resultSetMetaData' :: list(),
                          'warnings' :: 'SnappyExceptionData'()}).
-type 'PrepareResult'() :: #'PrepareResult'{}.

%% struct 'UpdateResult'

-record('UpdateResult', {'updateCount' :: integer(),
                         'batchUpdateCounts' :: list(),
                         'generatedKeys' :: 'RowSet'(),
                         'warnings' :: 'SnappyExceptionData'()}).
-type 'UpdateResult'() :: #'UpdateResult'{}.

%% struct 'StatementResult'

-record('StatementResult', {'resultSet' :: 'RowSet'(),
                            'updateCount' :: integer(),
                            'batchUpdateCounts' :: list(),
                            'procedureOutParams' :: dict:dict(),
                            'generatedKeys' :: 'RowSet'(),
                            'warnings' :: 'SnappyExceptionData'(),
                            'preparedResult' :: 'PrepareResult'()}).
-type 'StatementResult'() :: #'StatementResult'{}.

%% struct 'EntityId'

-record('EntityId', {'id' :: integer(),
                     'type' :: integer(),
                     'connId' :: integer(),
                     'token' :: string() | binary()}).
-type 'EntityId'() :: #'EntityId'{}.

-endif.
