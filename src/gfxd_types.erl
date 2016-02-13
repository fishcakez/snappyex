%%
%% Autogenerated by Thrift Compiler (0.9.3)
%%
%% DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
%%

-module(gfxd_types).

-include("gfxd_types.hrl").

-export([struct_info/1, struct_info_ext/1]).

struct_info('FieldDescriptor') ->
  {struct, [{1, string},
          {2, i32},
          {3, bool}]}
;

struct_info('Decimal') ->
  {struct, [{1, byte},
          {2, i32},
          {3, string}]}
;

struct_info('Timestamp') ->
  {struct, [{1, i64},
          {2, i32}]}
;

struct_info('FieldValue') ->
  {struct, [{1, bool},
          {2, byte},
          {3, i16},
          {4, i16},
          {5, i32},
          {6, i64},
          {7, i32},
          {8, double},
          {9, string},
          {10, {struct, {'gfxd_types', 'Decimal'}}},
          {11, {struct, {'gfxd_types', 'Timestamp'}}},
          {12, {list, bool}},
          {13, string},
          {14, string},
          {15, {list, i16}},
          {16, {list, i32}},
          {17, {list, i64}},
          {18, {list, i32}},
          {19, {list, double}},
          {20, {list, string}},
          {21, {list, string}},
          {22, i32},
          {23, {list, i32}},
          {24, string},
          {25, bool}]}
;

struct_info('PDXNode') ->
  {struct, [{1, {struct, {'gfxd_types', 'FieldValue'}}},
          {2, {list, {struct, {'gfxd_types', 'FieldValue'}}}},
          {3, i32}]}
;

struct_info('PDXObject') ->
  {struct, [{1, {list, {struct, {'gfxd_types', 'FieldValue'}}}},
          {2, {list, {struct, {'gfxd_types', 'PDXNode'}}}}]}
;

struct_info('PDXSchemaNode') ->
  {struct, [{1, {struct, {'gfxd_types', 'FieldDescriptor'}}},
          {2, {list, {struct, {'gfxd_types', 'FieldDescriptor'}}}},
          {3, i32}]}
;

struct_info('PDXSchema') ->
  {struct, [{1, {list, {struct, {'gfxd_types', 'PDXSchemaNode'}}}}]}
;

struct_info('JSONField') ->
  {struct, [{1, string},
          {2, bool},
          {3, i32},
          {4, i64},
          {5, double},
          {6, bool},
          {7, i32},
          {8, {list, i32}}]}
;

struct_info('JSONNode') ->
  {struct, [{1, {map, string, {struct, {'gfxd_types', 'JSONField'}}}},
          {2, {struct, {'gfxd_types', 'JSONField'}}},
          {3, i32}]}
;

struct_info('JSONObject') ->
  {struct, [{1, {list, {struct, {'gfxd_types', 'JSONNode'}}}}]}
;

struct_info('BlobChunk') ->
  {struct, [{1, string},
          {2, bool},
          {3, i32},
          {4, i64},
          {5, i64}]}
;

struct_info('ClobChunk') ->
  {struct, [{1, string},
          {2, bool},
          {3, i32},
          {4, i64},
          {5, i64}]}
;

struct_info('ServiceMetaData') ->
  {struct, [{1, string},
          {2, string},
          {3, i32},
          {4, i32},
          {5, i32},
          {6, i32},
          {7, string},
          {8, {list, string}},
          {9, {list, string}},
          {10, {list, string}},
          {11, {list, string}},
          {12, {list, string}},
          {13, string},
          {14, string},
          {15, {map, i32, {set, i32}}},
          {16, string},
          {17, string},
          {18, string},
          {19, string},
          {20, i32},
          {21, i32},
          {22, i32},
          {23, i32},
          {24, i32},
          {25, i32},
          {26, i32},
          {27, i32},
          {28, i32},
          {29, i32},
          {30, i32},
          {31, i32},
          {32, i32},
          {33, i32},
          {34, i32},
          {35, i32},
          {36, i32},
          {37, i32},
          {38, i32},
          {39, i32},
          {40, i32},
          {41, byte},
          {42, bool},
          {43, bool},
          {44, bool},
          {45, {map, i32, bool}},
          {46, i32},
          {47, {set, i32}},
          {48, {map, i32, {list, i32}}}]}
;

struct_info('ServiceMetaDataArgs') ->
  {struct, [{1, i32},
          {2, byte},
          {3, string},
          {4, string},
          {5, string},
          {6, {list, string}},
          {7, string},
          {8, string},
          {9, string},
          {10, string},
          {11, string},
          {12, string},
          {13, string},
          {14, i32}]}
;

struct_info('OpenConnectionArgs') ->
  {struct, [{1, string},
          {2, string},
          {3, i32},
          {4, string},
          {5, string},
          {6, i32},
          {7, bool},
          {8, {map, string, string}}]}
;

struct_info('ConnectionProperties') ->
  {struct, [{1, i32},
          {2, string},
          {3, string},
          {4, string},
          {5, string}]}
;

struct_info('HostAddress') ->
  {struct, [{1, string},
          {2, i32},
          {3, string},
          {4, i32}]}
;

struct_info('GFXDExceptionData') ->
  {struct, [{1, string},
          {2, string},
          {3, i32}]}
;

struct_info('GFXDException') ->
  {struct, [{1, {struct, {'gfxd_types', 'GFXDExceptionData'}}},
          {2, string},
          {3, {list, {struct, {'gfxd_types', 'GFXDExceptionData'}}}}]}
;

struct_info('StatementAttrs') ->
  {struct, [{1, byte},
          {2, bool},
          {3, bool},
          {4, bool},
          {5, {list, i32}},
          {6, {list, string}},
          {7, i32},
          {8, bool},
          {9, i32},
          {10, i32},
          {11, i32},
          {12, i32},
          {13, string},
          {14, bool},
          {15, bool},
          {16, bool},
          {17, {map, i32, bool}}]}
;

struct_info('DateTime') ->
  {struct, [{1, i64}]}
;

struct_info('ColumnValue') ->
  {struct, [{1, bool},
          {2, byte},
          {3, i16},
          {4, i32},
          {5, i64},
          {6, i32},
          {7, double},
          {8, string},
          {9, {struct, {'gfxd_types', 'Decimal'}}},
          {10, {struct, {'gfxd_types', 'DateTime'}}},
          {11, {struct, {'gfxd_types', 'DateTime'}}},
          {12, {struct, {'gfxd_types', 'Timestamp'}}},
          {13, string},
          {14, {struct, {'gfxd_types', 'BlobChunk'}}},
          {15, {struct, {'gfxd_types', 'ClobChunk'}}},
          {16, bool},
          {17, {struct, {'gfxd_types', 'PDXObject'}}},
          {18, {struct, {'gfxd_types', 'JSONObject'}}},
          {19, string}]}
;

struct_info('ColumnDescriptor') ->
  {struct, [{1, i32},
          {2, i16},
          {3, i16},
          {4, i16},
          {5, string},
          {6, string},
          {7, string}]}
;

struct_info('Row') ->
  {struct, [{1, {list, {struct, {'gfxd_types', 'ColumnValue'}}}}]}
;

struct_info('OutputParameter') ->
  {struct, [{1, i32},
          {2, i32},
          {3, string}]}
;

struct_info('RowSet') ->
  {struct, [{1, {list, {struct, {'gfxd_types', 'Row'}}}},
          {2, byte},
          {3, i32},
          {4, i32},
          {5, i32},
          {6, string},
          {7, {struct, {'gfxd_types', 'HostAddress'}}},
          {8, i32},
          {9, {list, {struct, {'gfxd_types', 'ColumnDescriptor'}}}},
          {10, string},
          {11, {struct, {'gfxd_types', 'GFXDExceptionData'}}},
          {12, {list, i64}}]}
;

struct_info('PrepareResult') ->
  {struct, [{1, i32},
          {2, {list, {struct, {'gfxd_types', 'ColumnDescriptor'}}}},
          {3, {list, {struct, {'gfxd_types', 'ColumnDescriptor'}}}},
          {4, {struct, {'gfxd_types', 'GFXDExceptionData'}}}]}
;

struct_info('UpdateResult') ->
  {struct, [{1, i32},
          {2, {list, i32}},
          {3, {struct, {'gfxd_types', 'RowSet'}}},
          {4, {struct, {'gfxd_types', 'GFXDExceptionData'}}}]}
;

struct_info('StatementResult') ->
  {struct, [{1, {struct, {'gfxd_types', 'RowSet'}}},
          {2, i32},
          {3, {list, i32}},
          {4, {struct, {'gfxd_types', 'Row'}}},
          {5, {struct, {'gfxd_types', 'RowSet'}}},
          {6, {struct, {'gfxd_types', 'GFXDExceptionData'}}},
          {7, {struct, {'gfxd_types', 'PrepareResult'}}}]}
;

struct_info('EntityId') ->
  {struct, [{1, i32},
          {2, byte},
          {3, i32},
          {4, string}]}
;

struct_info(_) -> erlang:error(function_clause).

struct_info_ext('FieldDescriptor') ->
  {struct, [{1, required, string, 'name', undefined},
          {2, required, i32, 'type', undefined},
          {3, optional, bool, 'identity', undefined}]}
;

struct_info_ext('Decimal') ->
  {struct, [{1, required, byte, 'signum', undefined},
          {2, required, i32, 'scale', undefined},
          {3, required, string, 'magnitude', undefined}]}
;

struct_info_ext('Timestamp') ->
  {struct, [{1, required, i64, 'secsSinceEpoch', undefined},
          {2, optional, i32, 'nanos', undefined}]}
;

struct_info_ext('FieldValue') ->
  {struct, [{1, optional, bool, 'bool_val', undefined},
          {2, optional, byte, 'byte_val', undefined},
          {3, optional, i16, 'char_val', undefined},
          {4, optional, i16, 'short_val', undefined},
          {5, optional, i32, 'int_val', undefined},
          {6, optional, i64, 'long_val', undefined},
          {7, optional, i32, 'float_val', undefined},
          {8, optional, double, 'double_val', undefined},
          {9, optional, string, 'string_val', undefined},
          {10, optional, {struct, {'gfxd_types', 'Decimal'}}, 'decimal_val', #'Decimal'{}},
          {11, optional, {struct, {'gfxd_types', 'Timestamp'}}, 'timestamp_val', #'Timestamp'{}},
          {12, optional, {list, bool}, 'bool_array', []},
          {13, optional, string, 'byte_array', undefined},
          {14, optional, string, 'char_array', undefined},
          {15, optional, {list, i16}, 'short_array', []},
          {16, optional, {list, i32}, 'int_array', []},
          {17, optional, {list, i64}, 'long_array', []},
          {18, optional, {list, i32}, 'float_array', []},
          {19, optional, {list, double}, 'double_array', []},
          {20, optional, {list, string}, 'string_array', []},
          {21, optional, {list, string}, 'byte_array_array', []},
          {22, optional, i32, 'ref_val', undefined},
          {23, optional, {list, i32}, 'list_val', []},
          {24, optional, string, 'native_val', undefined},
          {25, optional, bool, 'null_val', undefined}]}
;

struct_info_ext('PDXNode') ->
  {struct, [{1, optional, {struct, {'gfxd_types', 'FieldValue'}}, 'singleField', #'FieldValue'{}},
          {2, optional, {list, {struct, {'gfxd_types', 'FieldValue'}}}, 'fields', []},
          {3, optional, i32, 'refId', undefined}]}
;

struct_info_ext('PDXObject') ->
  {struct, [{1, optional, {list, {struct, {'gfxd_types', 'FieldValue'}}}, 'fields', []},
          {2, optional, {list, {struct, {'gfxd_types', 'PDXNode'}}}, 'nodes', []}]}
;

struct_info_ext('PDXSchemaNode') ->
  {struct, [{1, optional, {struct, {'gfxd_types', 'FieldDescriptor'}}, 'singleFieldDesc', #'FieldDescriptor'{}},
          {2, optional, {list, {struct, {'gfxd_types', 'FieldDescriptor'}}}, 'fieldDescs', []},
          {3, optional, i32, 'refId', undefined}]}
;

struct_info_ext('PDXSchema') ->
  {struct, [{1, required, {list, {struct, {'gfxd_types', 'PDXSchemaNode'}}}, 'nodes', []}]}
;

struct_info_ext('JSONField') ->
  {struct, [{1, optional, string, 'string_val', undefined},
          {2, optional, bool, 'bool_val', undefined},
          {3, optional, i32, 'i32_val', undefined},
          {4, optional, i64, 'i64_val', undefined},
          {5, optional, double, 'double_val', undefined},
          {6, optional, bool, 'null_val', undefined},
          {7, optional, i32, 'ref_val', undefined},
          {8, optional, {list, i32}, 'array_val', []}]}
;

struct_info_ext('JSONNode') ->
  {struct, [{1, optional, {map, string, {struct, {'gfxd_types', 'JSONField'}}}, 'pairs', dict:new()},
          {2, optional, {struct, {'gfxd_types', 'JSONField'}}, 'singleField', #'JSONField'{}},
          {3, required, i32, 'refId', undefined}]}
;

struct_info_ext('JSONObject') ->
  {struct, [{1, required, {list, {struct, {'gfxd_types', 'JSONNode'}}}, 'nodes', []}]}
;

struct_info_ext('BlobChunk') ->
  {struct, [{1, required, string, 'chunk', undefined},
          {2, required, bool, 'last', undefined},
          {3, optional, i32, 'lobId', undefined},
          {4, optional, i64, 'offset', undefined},
          {5, optional, i64, 'totalLength', undefined}]}
;

struct_info_ext('ClobChunk') ->
  {struct, [{1, required, string, 'chunk', undefined},
          {2, required, bool, 'last', undefined},
          {3, optional, i32, 'lobId', undefined},
          {4, optional, i64, 'offset', undefined},
          {5, optional, i64, 'totalLength', undefined}]}
;

struct_info_ext('ServiceMetaData') ->
  {struct, [{1, required, string, 'productName', undefined},
          {2, required, string, 'productVersion', undefined},
          {3, required, i32, 'productMajorVersion', undefined},
          {4, required, i32, 'productMinorVersion', undefined},
          {5, required, i32, 'jdbcMajorVersion', undefined},
          {6, required, i32, 'jdbcMinorVersion', undefined},
          {7, required, string, 'identifierQuote', undefined},
          {8, required, {list, string}, 'sqlKeywords', []},
          {9, required, {list, string}, 'numericFunctions', []},
          {10, required, {list, string}, 'stringFunctions', []},
          {11, required, {list, string}, 'systemFunctions', []},
          {12, required, {list, string}, 'dateTimeFunctions', []},
          {13, required, string, 'searchStringEscape', undefined},
          {14, optional, string, 'extraNameCharacters', undefined},
          {15, required, {map, i32, {set, i32}}, 'supportedCONVERT', dict:new()},
          {16, required, string, 'schemaTerm', undefined},
          {17, required, string, 'procedureTerm', undefined},
          {18, required, string, 'catalogTerm', undefined},
          {19, required, string, 'catalogSeparator', undefined},
          {20, required, i32, 'maxBinaryLiteralLength', undefined},
          {21, required, i32, 'maxCharLiteralLength', undefined},
          {22, required, i32, 'maxColumnsInGroupBy', undefined},
          {23, required, i32, 'maxColumnsInIndex', undefined},
          {24, required, i32, 'maxColumnsInOrderBy', undefined},
          {25, required, i32, 'maxColumnsInSelect', undefined},
          {26, required, i32, 'maxColumnsInTable', undefined},
          {27, required, i32, 'maxConnections', undefined},
          {28, required, i32, 'maxIndexLength', undefined},
          {29, required, i32, 'maxRowSize', undefined},
          {30, required, i32, 'maxStatementLength', undefined},
          {31, required, i32, 'maxOpenStatements', undefined},
          {32, required, i32, 'maxTableNamesInSelect', undefined},
          {33, required, i32, 'maxColumnNameLength', undefined},
          {34, required, i32, 'maxCursorNameLength', undefined},
          {35, required, i32, 'maxSchemaNameLength', undefined},
          {36, required, i32, 'maxProcedureNameLength', undefined},
          {37, required, i32, 'maxCatalogNameLength', undefined},
          {38, required, i32, 'maxTableNameLength', undefined},
          {39, required, i32, 'maxUserNameLength', undefined},
          {40, required, i32, 'defaultTransactionIsolation', undefined},
          {41, required, byte, 'defaultResultSetType', undefined},
          {42, required, bool, 'defaultResultSetHoldabilityHoldCursorsOverCommit', undefined},
          {43, required, bool, 'sqlStateIsXOpen', undefined},
          {44, required, bool, 'catalogAtStart', undefined},
          {45, required, {map, i32, bool}, 'transactionDefaults', dict:new()},
          {46, required, i32, 'rowIdLifeTime', undefined},
          {47, required, {set, i32}, 'supportedFeatures', sets:new()},
          {48, required, {map, i32, {list, i32}}, 'featuresWithParams', dict:new()}]}
;

struct_info_ext('ServiceMetaDataArgs') ->
  {struct, [{1, required, i32, 'connId', undefined},
          {2, required, byte, 'driverType', undefined},
          {3, optional, string, 'token', undefined},
          {4, optional, string, 'schema', undefined},
          {5, optional, string, 'table', undefined},
          {6, optional, {list, string}, 'tableTypes', []},
          {7, optional, string, 'columnName', undefined},
          {8, optional, string, 'foreignSchema', undefined},
          {9, optional, string, 'foreignTable', undefined},
          {10, optional, string, 'procedureName', undefined},
          {11, optional, string, 'functionName', undefined},
          {12, optional, string, 'attributeName', undefined},
          {13, optional, string, 'typeName', undefined},
          {14, optional, i32, 'typeId', undefined}]}
;

struct_info_ext('OpenConnectionArgs') ->
  {struct, [{1, required, string, 'clientHostName', undefined},
          {2, required, string, 'clientID', undefined},
          {3, required, i32, 'security', undefined},
          {4, optional, string, 'userName', undefined},
          {5, optional, string, 'password', undefined},
          {6, optional, i32, 'tokenSize', undefined},
          {7, optional, bool, 'useStringForDecimal', undefined},
          {8, optional, {map, string, string}, 'properties', dict:new()}]}
;

struct_info_ext('ConnectionProperties') ->
  {struct, [{1, required, i32, 'connId', undefined},
          {2, required, string, 'clientHostName', undefined},
          {3, required, string, 'clientID', undefined},
          {4, optional, string, 'userName', undefined},
          {5, optional, string, 'token', undefined}]}
;

struct_info_ext('HostAddress') ->
  {struct, [{1, required, string, 'hostName', undefined},
          {2, required, i32, 'port', undefined},
          {3, optional, string, 'ipAddress', undefined},
          {4, optional, i32, 'serverType', undefined}]}
;

struct_info_ext('GFXDExceptionData') ->
  {struct, [{1, required, string, 'reason', undefined},
          {2, required, string, 'sqlState', undefined},
          {3, required, i32, 'severity', undefined}]}
;

struct_info_ext('GFXDException') ->
  {struct, [{1, required, {struct, {'gfxd_types', 'GFXDExceptionData'}}, 'exceptionData', #'GFXDExceptionData'{}},
          {2, required, string, 'serverInfo', undefined},
          {3, optional, {list, {struct, {'gfxd_types', 'GFXDExceptionData'}}}, 'nextExceptions', []}]}
;

struct_info_ext('StatementAttrs') ->
  {struct, [{1, optional, byte, 'resultSetType', undefined},
          {2, optional, bool, 'updatable', undefined},
          {3, optional, bool, 'holdCursorsOverCommit', undefined},
          {4, optional, bool, 'requireAutoIncCols', undefined},
          {5, optional, {list, i32}, 'autoIncColumns', []},
          {6, optional, {list, string}, 'autoIncColumnNames', []},
          {7, optional, i32, 'batchSize', 1024},
          {8, optional, bool, 'fetchReverse', undefined},
          {9, optional, i32, 'lobChunkSize', undefined},
          {10, optional, i32, 'maxRows', undefined},
          {11, optional, i32, 'maxFieldSize', undefined},
          {12, optional, i32, 'timeout', undefined},
          {13, optional, string, 'cursorName', undefined},
          {14, optional, bool, 'possibleDuplicate', undefined},
          {15, optional, bool, 'poolable', undefined},
          {16, optional, bool, 'doEscapeProcessing', undefined},
          {17, optional, {map, i32, bool}, 'pendingTransactionAttrs', dict:new()}]}
;

struct_info_ext('DateTime') ->
  {struct, [{1, required, i64, 'secsSinceEpoch', undefined}]}
;

struct_info_ext('ColumnValue') ->
  {struct, [{1, optional, bool, 'bool_val', undefined},
          {2, optional, byte, 'byte_val', undefined},
          {3, optional, i16, 'i16_val', undefined},
          {4, optional, i32, 'i32_val', undefined},
          {5, optional, i64, 'i64_val', undefined},
          {6, optional, i32, 'float_val', undefined},
          {7, optional, double, 'double_val', undefined},
          {8, optional, string, 'string_val', undefined},
          {9, optional, {struct, {'gfxd_types', 'Decimal'}}, 'decimal_val', #'Decimal'{}},
          {10, optional, {struct, {'gfxd_types', 'DateTime'}}, 'date_val', #'DateTime'{}},
          {11, optional, {struct, {'gfxd_types', 'DateTime'}}, 'time_val', #'DateTime'{}},
          {12, optional, {struct, {'gfxd_types', 'Timestamp'}}, 'timestamp_val', #'Timestamp'{}},
          {13, optional, string, 'binary_val', undefined},
          {14, optional, {struct, {'gfxd_types', 'BlobChunk'}}, 'blob_val', #'BlobChunk'{}},
          {15, optional, {struct, {'gfxd_types', 'ClobChunk'}}, 'clob_val', #'ClobChunk'{}},
          {16, optional, bool, 'null_val', undefined},
          {17, optional, {struct, {'gfxd_types', 'PDXObject'}}, 'pdx_val', #'PDXObject'{}},
          {18, optional, {struct, {'gfxd_types', 'JSONObject'}}, 'json_val', #'JSONObject'{}},
          {19, optional, string, 'java_val', undefined}]}
;

struct_info_ext('ColumnDescriptor') ->
  {struct, [{1, required, i32, 'type', undefined},
          {2, required, i16, 'descFlags', undefined},
          {3, required, i16, 'precision', undefined},
          {4, optional, i16, 'scale', undefined},
          {5, optional, string, 'name', undefined},
          {6, optional, string, 'fullTableName', undefined},
          {7, optional, string, 'udtTypeAndClassName', undefined}]}
;

struct_info_ext('Row') ->
  {struct, [{1, required, {list, {struct, {'gfxd_types', 'ColumnValue'}}}, 'values', []}]}
;

struct_info_ext('OutputParameter') ->
  {struct, [{1, required, i32, 'type', undefined},
          {2, optional, i32, 'scale', undefined},
          {3, optional, string, 'typeName', undefined}]}
;

struct_info_ext('RowSet') ->
  {struct, [{1, required, {list, {struct, {'gfxd_types', 'Row'}}}, 'rows', []},
          {2, required, byte, 'flags', undefined},
          {3, required, i32, 'cursorId', undefined},
          {4, required, i32, 'statementId', undefined},
          {5, required, i32, 'connId', undefined},
          {6, optional, string, 'token', undefined},
          {7, optional, {struct, {'gfxd_types', 'HostAddress'}}, 'source', #'HostAddress'{}},
          {8, optional, i32, 'offset', undefined},
          {9, optional, {list, {struct, {'gfxd_types', 'ColumnDescriptor'}}}, 'metadata', []},
          {10, optional, string, 'cursorName', undefined},
          {11, optional, {struct, {'gfxd_types', 'GFXDExceptionData'}}, 'warnings', #'GFXDExceptionData'{}},
          {12, optional, {list, i64}, 'rowIdsForUpdateOrDelete', []}]}
;

struct_info_ext('PrepareResult') ->
  {struct, [{1, required, i32, 'statementId', undefined},
          {2, required, {list, {struct, {'gfxd_types', 'ColumnDescriptor'}}}, 'parameterMetaData', []},
          {3, optional, {list, {struct, {'gfxd_types', 'ColumnDescriptor'}}}, 'resultSetMetaData', []},
          {4, optional, {struct, {'gfxd_types', 'GFXDExceptionData'}}, 'warnings', #'GFXDExceptionData'{}}]}
;

struct_info_ext('UpdateResult') ->
  {struct, [{1, optional, i32, 'updateCount', undefined},
          {2, optional, {list, i32}, 'batchUpdateCounts', []},
          {3, optional, {struct, {'gfxd_types', 'RowSet'}}, 'generatedKeys', #'RowSet'{}},
          {4, optional, {struct, {'gfxd_types', 'GFXDExceptionData'}}, 'warnings', #'GFXDExceptionData'{}}]}
;

struct_info_ext('StatementResult') ->
  {struct, [{1, optional, {struct, {'gfxd_types', 'RowSet'}}, 'resultSet', #'RowSet'{}},
          {2, optional, i32, 'updateCount', undefined},
          {3, optional, {list, i32}, 'batchUpdateCounts', []},
          {4, optional, {struct, {'gfxd_types', 'Row'}}, 'procedureOutParams', #'Row'{}},
          {5, optional, {struct, {'gfxd_types', 'RowSet'}}, 'generatedKeys', #'RowSet'{}},
          {6, optional, {struct, {'gfxd_types', 'GFXDExceptionData'}}, 'warnings', #'GFXDExceptionData'{}},
          {7, optional, {struct, {'gfxd_types', 'PrepareResult'}}, 'preparedResult', #'PrepareResult'{}}]}
;

struct_info_ext('EntityId') ->
  {struct, [{1, required, i32, 'id', undefined},
          {2, required, byte, 'type', undefined},
          {3, required, i32, 'connId', undefined},
          {4, optional, string, 'token', undefined}]}
;

struct_info_ext(_) -> erlang:error(function_clause).

