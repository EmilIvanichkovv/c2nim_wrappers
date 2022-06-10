const
  avrodll* =  "libavro.so"
type
  AvroAllocatorT* = proc (userData: pointer; `ptr`: pointer; osize: csize_t;
                       nsize: csize_t): pointer {.cdecl.}

proc avroSetAllocator*(alloc: AvroAllocatorT; userData: pointer) {.cdecl,
    importc: "avro_set_allocator", dynlib: avrodll.}
type
  AvroAllocatorState* {.bycopy.} = object
    alloc*: AvroAllocatorT
    userData*: pointer


var AVRO_CURRENT_ALLOCATOR* {.dynlib: avrodll.}: AvroAllocatorState

proc avroCalloc*(count: csize_t; size: csize_t): pointer {.cdecl,
    importc: "avro_calloc", dynlib: avrodll.}
proc avroStrAlloc*(strSize: csize_t): cstring {.cdecl, importc: "avro_str_alloc",
    dynlib: avrodll.}
proc avroStrdup*(str: cstring): cstring {.cdecl, importc: "avro_strdup",
                                      dynlib: avrodll.}
proc avroStrndup*(str: cstring; size: csize_t): cstring {.cdecl,
    importc: "avro_strndup", dynlib: avrodll.}
proc avroStrFree*(str: cstring) {.cdecl, importc: "avro_str_free", dynlib: avrodll.}
type
  AvroTypeT* {.size: sizeof(cint).} = enum
    AVRO_STRING, AVRO_BYTES, AVRO_INT32, AVRO_INT64, AVRO_FLOAT, AVRO_DOUBLE,
    AVRO_BOOLEAN, AVRO_NULL, AVRO_RECORD, AVRO_ENUM, AVRO_FIXED, AVRO_MAP, AVRO_ARRAY,
    AVRO_UNION, AVRO_LINK




type
  AvroClassT* {.size: sizeof(cint).} = enum
    AVRO_SCHEMA, AVRO_DATUM




type
  AvroObjT* {.bycopy.} = object
    `type`*: AvroTypeT
    classType*: AvroClassT
    refcount*: cint

  AvroRawArrayT* {.bycopy.} = object
    elementSize*: csize_t
    elementCount*: csize_t
    allocatedSize*: csize_t
    data*: pointer


proc avroRawArrayInit*(array: ptr AvroRawArrayT; elementSize: csize_t) {.cdecl,
    importc: "avro_raw_array_init", dynlib: avrodll.}
proc avroRawArrayDone*(array: ptr AvroRawArrayT) {.cdecl,
    importc: "avro_raw_array_done", dynlib: avrodll.}
proc avroRawArrayClear*(array: ptr AvroRawArrayT) {.cdecl,
    importc: "avro_raw_array_clear", dynlib: avrodll.}
proc avroRawArrayEnsureSize*(array: ptr AvroRawArrayT; desiredCount: csize_t): cint {.
    cdecl, importc: "avro_raw_array_ensure_size", dynlib: avrodll.}
proc avroRawArrayEnsureSize0*(array: ptr AvroRawArrayT; desiredCount: csize_t): cint {.
    cdecl, importc: "avro_raw_array_ensure_size0", dynlib: avrodll.}
proc avroRawArrayAppend*(array: ptr AvroRawArrayT): pointer {.cdecl,
    importc: "avro_raw_array_append", dynlib: avrodll.}
type
  AvroRawMapEntryT* {.bycopy.} = object
    key*: cstring

  AvroRawMapT* {.bycopy.} = object
    elements*: AvroRawArrayT
    indicesByKey*: pointer


proc avroRawMapInit*(map: ptr AvroRawMapT; elementSize: csize_t) {.cdecl,
    importc: "avro_raw_map_init", dynlib: avrodll.}
proc avroRawMapDone*(map: ptr AvroRawMapT) {.cdecl, importc: "avro_raw_map_done",
    dynlib: avrodll.}
proc avroRawMapClear*(map: ptr AvroRawMapT) {.cdecl, importc: "avro_raw_map_clear",
    dynlib: avrodll.}
proc avroRawMapEnsureSize*(map: ptr AvroRawMapT; desiredCount: csize_t): cint {.cdecl,
    importc: "avro_raw_map_ensure_size", dynlib: avrodll.}
proc avroRawMapGet*(map: ptr AvroRawMapT; key: cstring; index: ptr csize_t): pointer {.
    cdecl, importc: "avro_raw_map_get", dynlib: avrodll.}
proc avroRawMapGetOrCreate*(map: ptr AvroRawMapT; key: cstring; element: ptr pointer;
                           index: ptr csize_t): cint {.cdecl,
    importc: "avro_raw_map_get_or_create", dynlib: avrodll.}
type
  AvroWrappedBufferT* = object
  AvroWrappedBuffer* {.bycopy.} = object
    buf*: pointer
    size*: csize_t
    userData*: pointer
    free*: proc (self: ptr AvroWrappedBufferT) {.cdecl.}
    copy*: proc (dest: ptr AvroWrappedBufferT; src: ptr AvroWrappedBufferT;
               offset: csize_t; length: csize_t): cint {.cdecl.}
    slice*: proc (self: ptr AvroWrappedBufferT; offset: csize_t; length: csize_t): cint {.
        cdecl.}


proc avroWrappedBufferMove*(dest: ptr AvroWrappedBufferT;
                           src: ptr AvroWrappedBufferT) {.cdecl,
    importc: "avro_wrapped_buffer_move", dynlib: avrodll.}
proc avroWrappedBufferCopy*(dest: ptr AvroWrappedBufferT;
                           src: ptr AvroWrappedBufferT; offset: csize_t;
                           length: csize_t): cint {.cdecl,
    importc: "avro_wrapped_buffer_copy", dynlib: avrodll.}
proc avroWrappedBufferSlice*(self: ptr AvroWrappedBufferT; offset: csize_t;
                            length: csize_t): cint {.cdecl,
    importc: "avro_wrapped_buffer_slice", dynlib: avrodll.}
proc avroWrappedBufferNew*(dest: ptr AvroWrappedBufferT; buf: pointer; length: csize_t): cint {.
    cdecl, importc: "avro_wrapped_buffer_new", dynlib: avrodll.}
proc avroWrappedBufferNewCopy*(dest: ptr AvroWrappedBufferT; buf: pointer;
                              length: csize_t): cint {.cdecl,
    importc: "avro_wrapped_buffer_new_copy", dynlib: avrodll.}
type
  AvroRawStringT* {.bycopy.} = object
    wrapped*: AvroWrappedBufferT


proc avroRawStringInit*(str: ptr AvroRawStringT) {.cdecl,
    importc: "avro_raw_string_init", dynlib: avrodll.}
proc avroRawStringDone*(str: ptr AvroRawStringT) {.cdecl,
    importc: "avro_raw_string_done", dynlib: avrodll.}
proc avroRawStringSetLength*(str: ptr AvroRawStringT; src: pointer; length: csize_t) {.
    cdecl, importc: "avro_raw_string_set_length", dynlib: avrodll.}
proc avroRawStringSet*(str: ptr AvroRawStringT; src: cstring) {.cdecl,
    importc: "avro_raw_string_set", dynlib: avrodll.}
proc avroRawStringAppend*(str: ptr AvroRawStringT; src: cstring) {.cdecl,
    importc: "avro_raw_string_append", dynlib: avrodll.}
proc avroRawStringAppendLength*(str: ptr AvroRawStringT; src: pointer; length: csize_t) {.
    cdecl, importc: "avro_raw_string_append_length", dynlib: avrodll.}
proc avroRawStringGive*(str: ptr AvroRawStringT; src: ptr AvroWrappedBufferT) {.cdecl,
    importc: "avro_raw_string_give", dynlib: avrodll.}
proc avroRawStringGrab*(str: ptr AvroRawStringT; dest: ptr AvroWrappedBufferT): cint {.
    cdecl, importc: "avro_raw_string_grab", dynlib: avrodll.}
proc avroRawStringClear*(str: ptr AvroRawStringT) {.cdecl,
    importc: "avro_raw_string_clear", dynlib: avrodll.}
proc avroRawStringEquals*(str1: ptr AvroRawStringT; str2: ptr AvroRawStringT): cint {.
    cdecl, importc: "avro_raw_string_equals", dynlib: avrodll.}
type
  AvroMemoizeT* {.bycopy.} = object
    cache*: pointer


proc avroMemoizeInit*(mem: ptr AvroMemoizeT) {.cdecl, importc: "avro_memoize_init",
    dynlib: avrodll.}
proc avroMemoizeDone*(mem: ptr AvroMemoizeT) {.cdecl, importc: "avro_memoize_done",
    dynlib: avrodll.}
proc avroMemoizeGet*(mem: ptr AvroMemoizeT; key1: pointer; key2: pointer;
                    result: ptr pointer): cint {.cdecl, importc: "avro_memoize_get",
    dynlib: avrodll.}
proc avroMemoizeSet*(mem: ptr AvroMemoizeT; key1: pointer; key2: pointer;
                    result: pointer) {.cdecl, importc: "avro_memoize_set",
                                     dynlib: avrodll.}
proc avroMemoizeDelete*(mem: ptr AvroMemoizeT; key1: pointer; key2: pointer) {.cdecl,
    importc: "avro_memoize_delete", dynlib: avrodll.}
type
  AvroSchemaT* = ptr avroObjT

proc avroSchemaString*(): AvroSchemaT {.cdecl, importc: "avro_schema_string",
                                     dynlib: avrodll.}
proc avroSchemaBytes*(): AvroSchemaT {.cdecl, importc: "avro_schema_bytes",
                                    dynlib: avrodll.}
proc avroSchemaInt*(): AvroSchemaT {.cdecl, importc: "avro_schema_int",
                                  dynlib: avrodll.}
proc avroSchemaLong*(): AvroSchemaT {.cdecl, importc: "avro_schema_long",
                                   dynlib: avrodll.}
proc avroSchemaFloat*(): AvroSchemaT {.cdecl, importc: "avro_schema_float",
                                    dynlib: avrodll.}
proc avroSchemaDouble*(): AvroSchemaT {.cdecl, importc: "avro_schema_double",
                                     dynlib: avrodll.}
proc avroSchemaBoolean*(): AvroSchemaT {.cdecl, importc: "avro_schema_boolean",
                                      dynlib: avrodll.}
proc avroSchemaNull*(): AvroSchemaT {.cdecl, importc: "avro_schema_null",
                                   dynlib: avrodll.}
proc avroSchemaRecord*(name: cstring; space: cstring): AvroSchemaT {.cdecl,
    importc: "avro_schema_record", dynlib: avrodll.}
proc avroSchemaRecordFieldGet*(record: AvroSchemaT; fieldName: cstring): AvroSchemaT {.
    cdecl, importc: "avro_schema_record_field_get", dynlib: avrodll.}
proc avroSchemaRecordFieldName*(schema: AvroSchemaT; index: cint): cstring {.cdecl,
    importc: "avro_schema_record_field_name", dynlib: avrodll.}
proc avroSchemaRecordFieldGetIndex*(schema: AvroSchemaT; fieldName: cstring): cint {.
    cdecl, importc: "avro_schema_record_field_get_index", dynlib: avrodll.}
proc avroSchemaRecordFieldGetByIndex*(record: AvroSchemaT; index: cint): AvroSchemaT {.
    cdecl, importc: "avro_schema_record_field_get_by_index", dynlib: avrodll.}
proc avroSchemaRecordFieldAppend*(record: AvroSchemaT; fieldName: cstring;
                                 `type`: AvroSchemaT): cint {.cdecl,
    importc: "avro_schema_record_field_append", dynlib: avrodll.}
proc avroSchemaRecordSize*(record: AvroSchemaT): csize_t {.cdecl,
    importc: "avro_schema_record_size", dynlib: avrodll.}
proc avroSchemaEnum*(name: cstring): AvroSchemaT {.cdecl,
    importc: "avro_schema_enum", dynlib: avrodll.}
proc avroSchemaEnumNs*(name: cstring; space: cstring): AvroSchemaT {.cdecl,
    importc: "avro_schema_enum_ns", dynlib: avrodll.}
proc avroSchemaEnumGet*(enump: AvroSchemaT; index: cint): cstring {.cdecl,
    importc: "avro_schema_enum_get", dynlib: avrodll.}
proc avroSchemaEnumGetByName*(enump: AvroSchemaT; symbolName: cstring): cint {.cdecl,
    importc: "avro_schema_enum_get_by_name", dynlib: avrodll.}
proc avroSchemaEnumSymbolAppend*(enump: AvroSchemaT; symbol: cstring): cint {.cdecl,
    importc: "avro_schema_enum_symbol_append", dynlib: avrodll.}
proc avroSchemaEnumNumberOfSymbols*(enump: AvroSchemaT): cint {.cdecl,
    importc: "avro_schema_enum_number_of_symbols", dynlib: avrodll.}
proc avroSchemaFixed*(name: cstring; len: int64T): AvroSchemaT {.cdecl,
    importc: "avro_schema_fixed", dynlib: avrodll.}
proc avroSchemaFixedNs*(name: cstring; space: cstring; len: int64T): AvroSchemaT {.
    cdecl, importc: "avro_schema_fixed_ns", dynlib: avrodll.}
proc avroSchemaFixedSize*(fixed: AvroSchemaT): int64T {.cdecl,
    importc: "avro_schema_fixed_size", dynlib: avrodll.}
proc avroSchemaMap*(values: AvroSchemaT): AvroSchemaT {.cdecl,
    importc: "avro_schema_map", dynlib: avrodll.}
proc avroSchemaMapValues*(map: AvroSchemaT): AvroSchemaT {.cdecl,
    importc: "avro_schema_map_values", dynlib: avrodll.}
proc avroSchemaArray*(items: AvroSchemaT): AvroSchemaT {.cdecl,
    importc: "avro_schema_array", dynlib: avrodll.}
proc avroSchemaArrayItems*(array: AvroSchemaT): AvroSchemaT {.cdecl,
    importc: "avro_schema_array_items", dynlib: avrodll.}
proc avroSchemaUnion*(): AvroSchemaT {.cdecl, importc: "avro_schema_union",
                                    dynlib: avrodll.}
proc avroSchemaUnionSize*(unionSchema: AvroSchemaT): csize_t {.cdecl,
    importc: "avro_schema_union_size", dynlib: avrodll.}
proc avroSchemaUnionAppend*(unionSchema: AvroSchemaT; schema: AvroSchemaT): cint {.
    cdecl, importc: "avro_schema_union_append", dynlib: avrodll.}
proc avroSchemaUnionBranch*(unionSchema: AvroSchemaT; branchIndex: cint): AvroSchemaT {.
    cdecl, importc: "avro_schema_union_branch", dynlib: avrodll.}
proc avroSchemaUnionBranchByName*(unionSchema: AvroSchemaT; branchIndex: ptr cint;
                                 name: cstring): AvroSchemaT {.cdecl,
    importc: "avro_schema_union_branch_by_name", dynlib: avrodll.}
proc avroSchemaLink*(schema: AvroSchemaT): AvroSchemaT {.cdecl,
    importc: "avro_schema_link", dynlib: avrodll.}
proc avroSchemaLinkTarget*(schema: AvroSchemaT): AvroSchemaT {.cdecl,
    importc: "avro_schema_link_target", dynlib: avrodll.}
type
  AvroSchemaErrorT* = ptr avroSchemaErrorT

proc avroSchemaFromJson*(jsontext: cstring; unused1: int32T; schema: ptr AvroSchemaT;
                        unused2: ptr AvroSchemaErrorT): cint {.cdecl,
    importc: "avro_schema_from_json", dynlib: avrodll.}
proc avroSchemaFromJsonLength*(jsontext: cstring; length: csize_t;
                              schema: ptr AvroSchemaT): cint {.cdecl,
    importc: "avro_schema_from_json_length", dynlib: avrodll.}
proc avroSchemaToSpecific*(schema: AvroSchemaT; prefix: cstring): cint {.cdecl,
    importc: "avro_schema_to_specific", dynlib: avrodll.}
proc avroSchemaGetSubschema*(schema: AvroSchemaT; name: cstring): AvroSchemaT {.cdecl,
    importc: "avro_schema_get_subschema", dynlib: avrodll.}
proc avroSchemaName*(schema: AvroSchemaT): cstring {.cdecl,
    importc: "avro_schema_name", dynlib: avrodll.}
proc avroSchemaNamespace*(schema: AvroSchemaT): cstring {.cdecl,
    importc: "avro_schema_namespace", dynlib: avrodll.}
proc avroSchemaTypeName*(schema: AvroSchemaT): cstring {.cdecl,
    importc: "avro_schema_type_name", dynlib: avrodll.}
proc avroSchemaCopy*(schema: AvroSchemaT): AvroSchemaT {.cdecl,
    importc: "avro_schema_copy", dynlib: avrodll.}
proc avroSchemaEqual*(a: AvroSchemaT; b: AvroSchemaT): cint {.cdecl,
    importc: "avro_schema_equal", dynlib: avrodll.}
proc avroSchemaIncref*(schema: AvroSchemaT): AvroSchemaT {.cdecl,
    importc: "avro_schema_incref", dynlib: avrodll.}
proc avroSchemaDecref*(schema: AvroSchemaT): cint {.cdecl,
    importc: "avro_schema_decref", dynlib: avrodll.}
proc avroSchemaMatch*(writersSchema: AvroSchemaT; readersSchema: AvroSchemaT): cint {.
    cdecl, importc: "avro_schema_match", dynlib: avrodll.}
type
  AvroValueIfaceT* = avroValueIface
  AvroValueT* {.bycopy.} = object
    iface*: ptr AvroValueIfaceT
    self*: pointer

  AvroValueIface* {.bycopy.} = object
    increfIface*: proc (iface: ptr AvroValueIfaceT): ptr AvroValueIfaceT {.cdecl.}
    decrefIface*: proc (iface: ptr AvroValueIfaceT) {.cdecl.}
    incref*: proc (value: ptr AvroValueT) {.cdecl.}
    decref*: proc (value: ptr AvroValueT) {.cdecl.}
    reset*: proc (iface: ptr AvroValueIfaceT; self: pointer): cint {.cdecl.}
    getType*: proc (iface: ptr AvroValueIfaceT; self: pointer): AvroTypeT {.cdecl.}
    getSchema*: proc (iface: ptr AvroValueIfaceT; self: pointer): AvroSchemaT {.cdecl.}
    getBoolean*: proc (iface: ptr AvroValueIfaceT; self: pointer; `out`: ptr cint): cint {.
        cdecl.}
    getBytes*: proc (iface: ptr AvroValueIfaceT; self: pointer; buf: ptr pointer;
                   size: ptr csize_t): cint {.cdecl.}
    grabBytes*: proc (iface: ptr AvroValueIfaceT; self: pointer;
                    dest: ptr AvroWrappedBufferT): cint {.cdecl.}
    getDouble*: proc (iface: ptr AvroValueIfaceT; self: pointer; `out`: ptr cdouble): cint {.
        cdecl.}
    getFloat*: proc (iface: ptr AvroValueIfaceT; self: pointer; `out`: ptr cfloat): cint {.
        cdecl.}
    getInt*: proc (iface: ptr AvroValueIfaceT; self: pointer; `out`: ptr int32T): cint {.
        cdecl.}
    getLong*: proc (iface: ptr AvroValueIfaceT; self: pointer; `out`: ptr int64T): cint {.
        cdecl.}
    getNull*: proc (iface: ptr AvroValueIfaceT; self: pointer): cint {.cdecl.}
    getString*: proc (iface: ptr AvroValueIfaceT; self: pointer; str: cstringArray;
                    size: ptr csize_t): cint {.cdecl.}
    grabString*: proc (iface: ptr AvroValueIfaceT; self: pointer;
                     dest: ptr AvroWrappedBufferT): cint {.cdecl.}
    getEnum*: proc (iface: ptr AvroValueIfaceT; self: pointer; `out`: ptr cint): cint {.
        cdecl.}
    getFixed*: proc (iface: ptr AvroValueIfaceT; self: pointer; buf: ptr pointer;
                   size: ptr csize_t): cint {.cdecl.}
    grabFixed*: proc (iface: ptr AvroValueIfaceT; self: pointer;
                    dest: ptr AvroWrappedBufferT): cint {.cdecl.}
    setBoolean*: proc (iface: ptr AvroValueIfaceT; self: pointer; val: cint): cint {.cdecl.}
    setBytes*: proc (iface: ptr AvroValueIfaceT; self: pointer; buf: pointer;
                   size: csize_t): cint {.cdecl.}
    giveBytes*: proc (iface: ptr AvroValueIfaceT; self: pointer;
                    buf: ptr AvroWrappedBufferT): cint {.cdecl.}
    setDouble*: proc (iface: ptr AvroValueIfaceT; self: pointer; val: cdouble): cint {.
        cdecl.}
    setFloat*: proc (iface: ptr AvroValueIfaceT; self: pointer; val: cfloat): cint {.cdecl.}
    setInt*: proc (iface: ptr AvroValueIfaceT; self: pointer; val: int32T): cint {.cdecl.}
    setLong*: proc (iface: ptr AvroValueIfaceT; self: pointer; val: int64T): cint {.cdecl.}
    setNull*: proc (iface: ptr AvroValueIfaceT; self: pointer): cint {.cdecl.}
    setString*: proc (iface: ptr AvroValueIfaceT; self: pointer; str: cstring): cint {.
        cdecl.}
    setStringLen*: proc (iface: ptr AvroValueIfaceT; self: pointer; str: cstring;
                       size: csize_t): cint {.cdecl.}
    giveStringLen*: proc (iface: ptr AvroValueIfaceT; self: pointer;
                        buf: ptr AvroWrappedBufferT): cint {.cdecl.}
    setEnum*: proc (iface: ptr AvroValueIfaceT; self: pointer; val: cint): cint {.cdecl.}
    setFixed*: proc (iface: ptr AvroValueIfaceT; self: pointer; buf: pointer;
                   size: csize_t): cint {.cdecl.}
    giveFixed*: proc (iface: ptr AvroValueIfaceT; self: pointer;
                    buf: ptr AvroWrappedBufferT): cint {.cdecl.}
    getSize*: proc (iface: ptr AvroValueIfaceT; self: pointer; size: ptr csize_t): cint {.
        cdecl.}
    getByIndex*: proc (iface: ptr AvroValueIfaceT; self: pointer; index: csize_t;
                     child: ptr AvroValueT; name: cstringArray): cint {.cdecl.}
    getByName*: proc (iface: ptr AvroValueIfaceT; self: pointer; name: cstring;
                    child: ptr AvroValueT; index: ptr csize_t): cint {.cdecl.}
    getDiscriminant*: proc (iface: ptr AvroValueIfaceT; self: pointer; `out`: ptr cint): cint {.
        cdecl.}
    getCurrentBranch*: proc (iface: ptr AvroValueIfaceT; self: pointer;
                           branch: ptr AvroValueT): cint {.cdecl.}
    append*: proc (iface: ptr AvroValueIfaceT; self: pointer; childOut: ptr AvroValueT;
                 newIndex: ptr csize_t): cint {.cdecl.}
    add*: proc (iface: ptr AvroValueIfaceT; self: pointer; key: cstring;
              child: ptr AvroValueT; index: ptr csize_t; isNew: ptr cint): cint {.cdecl.}
    setBranch*: proc (iface: ptr AvroValueIfaceT; self: pointer; discriminant: cint;
                    branch: ptr AvroValueT): cint {.cdecl.}


proc avroValueIncref*(value: ptr AvroValueT) {.cdecl, importc: "avro_value_incref",
    dynlib: avrodll.}
proc avroValueDecref*(value: ptr AvroValueT) {.cdecl, importc: "avro_value_decref",
    dynlib: avrodll.}
proc avroValueCopyRef*(dest: ptr AvroValueT; src: ptr AvroValueT) {.cdecl,
    importc: "avro_value_copy_ref", dynlib: avrodll.}
proc avroValueMoveRef*(dest: ptr AvroValueT; src: ptr AvroValueT) {.cdecl,
    importc: "avro_value_move_ref", dynlib: avrodll.}
proc avroValueEqual*(val1: ptr AvroValueT; val2: ptr AvroValueT): cint {.cdecl,
    importc: "avro_value_equal", dynlib: avrodll.}
proc avroValueEqualFast*(val1: ptr AvroValueT; val2: ptr AvroValueT): cint {.cdecl,
    importc: "avro_value_equal_fast", dynlib: avrodll.}
proc avroValueCmp*(val1: ptr AvroValueT; val2: ptr AvroValueT): cint {.cdecl,
    importc: "avro_value_cmp", dynlib: avrodll.}
proc avroValueCmpFast*(val1: ptr AvroValueT; val2: ptr AvroValueT): cint {.cdecl,
    importc: "avro_value_cmp_fast", dynlib: avrodll.}
proc avroValueCopy*(dest: ptr AvroValueT; src: ptr AvroValueT): cint {.cdecl,
    importc: "avro_value_copy", dynlib: avrodll.}
proc avroValueCopyFast*(dest: ptr AvroValueT; src: ptr AvroValueT): cint {.cdecl,
    importc: "avro_value_copy_fast", dynlib: avrodll.}
proc avroValueHash*(value: ptr AvroValueT): uint32T {.cdecl,
    importc: "avro_value_hash", dynlib: avrodll.}
proc avroValueToJson*(value: ptr AvroValueT; oneLine: cint; jsonStr: cstringArray): cint {.
    cdecl, importc: "avro_value_to_json", dynlib: avrodll.}
type
  AvroFreeFuncT* = proc (`ptr`: pointer; sz: csize_t) {.cdecl.}

proc avroAllocFreeFunc*(`ptr`: pointer; sz: csize_t) {.cdecl,
    importc: "avro_alloc_free_func", dynlib: avrodll.}
type
  AvroDatumT* = ptr avroObjT

proc avroString*(str: cstring): AvroDatumT {.cdecl, importc: "avro_string",
    dynlib: avrodll.}
proc avroGivestring*(str: cstring; free: AvroFreeFuncT): AvroDatumT {.cdecl,
    importc: "avro_givestring", dynlib: avrodll.}
proc avroBytes*(buf: cstring; len: int64T): AvroDatumT {.cdecl, importc: "avro_bytes",
    dynlib: avrodll.}
proc avroGivebytes*(buf: cstring; len: int64T; free: AvroFreeFuncT): AvroDatumT {.cdecl,
    importc: "avro_givebytes", dynlib: avrodll.}
proc avroInt32*(i: int32T): AvroDatumT {.cdecl, importc: "avro_int32", dynlib: avrodll.}
proc avroInt64*(l: int64T): AvroDatumT {.cdecl, importc: "avro_int64", dynlib: avrodll.}
proc avroFloat*(f: cfloat): AvroDatumT {.cdecl, importc: "avro_float", dynlib: avrodll.}
proc avroDouble*(d: cdouble): AvroDatumT {.cdecl, importc: "avro_double",
                                       dynlib: avrodll.}
proc avroBoolean*(i: int8T): AvroDatumT {.cdecl, importc: "avro_boolean",
                                      dynlib: avrodll.}
proc avroNull*(): AvroDatumT {.cdecl, importc: "avro_null", dynlib: avrodll.}
proc avroRecord*(schema: AvroSchemaT): AvroDatumT {.cdecl, importc: "avro_record",
    dynlib: avrodll.}
proc avroEnum*(schema: AvroSchemaT; i: cint): AvroDatumT {.cdecl, importc: "avro_enum",
    dynlib: avrodll.}
proc avroFixed*(schema: AvroSchemaT; bytes: cstring; size: int64T): AvroDatumT {.cdecl,
    importc: "avro_fixed", dynlib: avrodll.}
proc avroGivefixed*(schema: AvroSchemaT; bytes: cstring; size: int64T;
                   free: AvroFreeFuncT): AvroDatumT {.cdecl,
    importc: "avro_givefixed", dynlib: avrodll.}
proc avroMap*(schema: AvroSchemaT): AvroDatumT {.cdecl, importc: "avro_map",
    dynlib: avrodll.}
proc avroArray*(schema: AvroSchemaT): AvroDatumT {.cdecl, importc: "avro_array",
    dynlib: avrodll.}
proc avroUnion*(schema: AvroSchemaT; discriminant: int64T; datum: AvroDatumT): AvroDatumT {.
    cdecl, importc: "avro_union", dynlib: avrodll.}
proc avroDatumGetSchema*(datum: AvroDatumT): AvroSchemaT {.cdecl,
    importc: "avro_datum_get_schema", dynlib: avrodll.}
proc avroDatumFromSchema*(schema: AvroSchemaT): AvroDatumT {.cdecl,
    importc: "avro_datum_from_schema", dynlib: avrodll.}
proc avroStringGet*(datum: AvroDatumT; p: cstringArray): cint {.cdecl,
    importc: "avro_string_get", dynlib: avrodll.}
proc avroBytesGet*(datum: AvroDatumT; bytes: cstringArray; size: ptr int64T): cint {.
    cdecl, importc: "avro_bytes_get", dynlib: avrodll.}
proc avroInt32Get*(datum: AvroDatumT; i: ptr int32T): cint {.cdecl,
    importc: "avro_int32_get", dynlib: avrodll.}
proc avroInt64Get*(datum: AvroDatumT; l: ptr int64T): cint {.cdecl,
    importc: "avro_int64_get", dynlib: avrodll.}
proc avroFloatGet*(datum: AvroDatumT; f: ptr cfloat): cint {.cdecl,
    importc: "avro_float_get", dynlib: avrodll.}
proc avroDoubleGet*(datum: AvroDatumT; d: ptr cdouble): cint {.cdecl,
    importc: "avro_double_get", dynlib: avrodll.}
proc avroBooleanGet*(datum: AvroDatumT; i: ptr int8T): cint {.cdecl,
    importc: "avro_boolean_get", dynlib: avrodll.}
proc avroEnumGet*(datum: AvroDatumT): cint {.cdecl, importc: "avro_enum_get",
    dynlib: avrodll.}
proc avroEnumGetName*(datum: AvroDatumT): cstring {.cdecl,
    importc: "avro_enum_get_name", dynlib: avrodll.}
proc avroFixedGet*(datum: AvroDatumT; bytes: cstringArray; size: ptr int64T): cint {.
    cdecl, importc: "avro_fixed_get", dynlib: avrodll.}
proc avroRecordGet*(record: AvroDatumT; fieldName: cstring; value: ptr AvroDatumT): cint {.
    cdecl, importc: "avro_record_get", dynlib: avrodll.}
proc avroMapGet*(datum: AvroDatumT; key: cstring; value: ptr AvroDatumT): cint {.cdecl,
    importc: "avro_map_get", dynlib: avrodll.}
proc avroMapGetKey*(datum: AvroDatumT; index: cint; key: cstringArray): cint {.cdecl,
    importc: "avro_map_get_key", dynlib: avrodll.}
proc avroMapGetIndex*(datum: AvroDatumT; key: cstring; index: ptr cint): cint {.cdecl,
    importc: "avro_map_get_index", dynlib: avrodll.}
proc avroMapSize*(datum: AvroDatumT): csize_t {.cdecl, importc: "avro_map_size",
    dynlib: avrodll.}
proc avroArrayGet*(datum: AvroDatumT; index: int64T; value: ptr AvroDatumT): cint {.
    cdecl, importc: "avro_array_get", dynlib: avrodll.}
proc avroArraySize*(datum: AvroDatumT): csize_t {.cdecl, importc: "avro_array_size",
    dynlib: avrodll.}
proc avroUnionDiscriminant*(datum: AvroDatumT): int64T {.cdecl,
    importc: "avro_union_discriminant", dynlib: avrodll.}
proc avroUnionCurrentBranch*(datum: AvroDatumT): AvroDatumT {.cdecl,
    importc: "avro_union_current_branch", dynlib: avrodll.}
proc avroStringSet*(datum: AvroDatumT; p: cstring): cint {.cdecl,
    importc: "avro_string_set", dynlib: avrodll.}
proc avroGivestringSet*(datum: AvroDatumT; p: cstring; free: AvroFreeFuncT): cint {.
    cdecl, importc: "avro_givestring_set", dynlib: avrodll.}
proc avroBytesSet*(datum: AvroDatumT; bytes: cstring; size: int64T): cint {.cdecl,
    importc: "avro_bytes_set", dynlib: avrodll.}
proc avroGivebytesSet*(datum: AvroDatumT; bytes: cstring; size: int64T;
                      free: AvroFreeFuncT): cint {.cdecl,
    importc: "avro_givebytes_set", dynlib: avrodll.}
proc avroInt32Set*(datum: AvroDatumT; i: int32T): cint {.cdecl,
    importc: "avro_int32_set", dynlib: avrodll.}
proc avroInt64Set*(datum: AvroDatumT; l: int64T): cint {.cdecl,
    importc: "avro_int64_set", dynlib: avrodll.}
proc avroFloatSet*(datum: AvroDatumT; f: cfloat): cint {.cdecl,
    importc: "avro_float_set", dynlib: avrodll.}
proc avroDoubleSet*(datum: AvroDatumT; d: cdouble): cint {.cdecl,
    importc: "avro_double_set", dynlib: avrodll.}
proc avroBooleanSet*(datum: AvroDatumT; i: int8T): cint {.cdecl,
    importc: "avro_boolean_set", dynlib: avrodll.}
proc avroEnumSet*(datum: AvroDatumT; symbolValue: cint): cint {.cdecl,
    importc: "avro_enum_set", dynlib: avrodll.}
proc avroEnumSetName*(datum: AvroDatumT; symbolName: cstring): cint {.cdecl,
    importc: "avro_enum_set_name", dynlib: avrodll.}
proc avroFixedSet*(datum: AvroDatumT; bytes: cstring; size: int64T): cint {.cdecl,
    importc: "avro_fixed_set", dynlib: avrodll.}
proc avroGivefixedSet*(datum: AvroDatumT; bytes: cstring; size: int64T;
                      free: AvroFreeFuncT): cint {.cdecl,
    importc: "avro_givefixed_set", dynlib: avrodll.}
proc avroRecordSet*(record: AvroDatumT; fieldName: cstring; value: AvroDatumT): cint {.
    cdecl, importc: "avro_record_set", dynlib: avrodll.}
proc avroMapSet*(map: AvroDatumT; key: cstring; value: AvroDatumT): cint {.cdecl,
    importc: "avro_map_set", dynlib: avrodll.}
proc avroArrayAppendDatum*(arrayDatum: AvroDatumT; datum: AvroDatumT): cint {.cdecl,
    importc: "avro_array_append_datum", dynlib: avrodll.}
proc avroUnionSetDiscriminant*(unionp: AvroDatumT; discriminant: cint;
                              branch: ptr AvroDatumT): cint {.cdecl,
    importc: "avro_union_set_discriminant", dynlib: avrodll.}
proc avroDatumReset*(value: AvroDatumT): cint {.cdecl, importc: "avro_datum_reset",
    dynlib: avrodll.}
proc avroDatumIncref*(value: AvroDatumT): AvroDatumT {.cdecl,
    importc: "avro_datum_incref", dynlib: avrodll.}
proc avroDatumDecref*(value: AvroDatumT) {.cdecl, importc: "avro_datum_decref",
                                        dynlib: avrodll.}
proc avroDatumPrint*(value: AvroDatumT; fp: ptr File) {.cdecl,
    importc: "avro_datum_print", dynlib: avrodll.}
proc avroDatumEqual*(a: AvroDatumT; b: AvroDatumT): cint {.cdecl,
    importc: "avro_datum_equal", dynlib: avrodll.}
proc avroDatumToJson*(datum: AvroDatumT; oneLine: cint; jsonStr: cstringArray): cint {.
    cdecl, importc: "avro_datum_to_json", dynlib: avrodll.}
proc avroSchemaDatumValidate*(expectedSchema: AvroSchemaT; datum: AvroDatumT): cint {.
    cdecl, importc: "avro_schema_datum_validate", dynlib: avrodll.}
proc avroDatumClass*(): ptr AvroValueIfaceT {.cdecl, importc: "avro_datum_class",
    dynlib: avrodll.}
proc avroDatumAsValue*(value: ptr AvroValueT; src: AvroDatumT): cint {.cdecl,
    importc: "avro_datum_as_value", dynlib: avrodll.}
type
  AvroReaderT* = ptr avroReaderT
  AvroWriterT* = ptr avroWriterT

proc avroReaderFile*(fp: ptr File): AvroReaderT {.cdecl, importc: "avro_reader_file",
    dynlib: avrodll.}
proc avroReaderFileFp*(fp: ptr File; shouldClose: cint): AvroReaderT {.cdecl,
    importc: "avro_reader_file_fp", dynlib: avrodll.}
proc avroWriterFile*(fp: ptr File): AvroWriterT {.cdecl, importc: "avro_writer_file",
    dynlib: avrodll.}
proc avroWriterFileFp*(fp: ptr File; shouldClose: cint): AvroWriterT {.cdecl,
    importc: "avro_writer_file_fp", dynlib: avrodll.}
proc avroReaderMemory*(buf: cstring; len: int64T): AvroReaderT {.cdecl,
    importc: "avro_reader_memory", dynlib: avrodll.}
proc avroWriterMemory*(buf: cstring; len: int64T): AvroWriterT {.cdecl,
    importc: "avro_writer_memory", dynlib: avrodll.}
proc avroReaderMemorySetSource*(reader: AvroReaderT; buf: cstring; len: int64T) {.
    cdecl, importc: "avro_reader_memory_set_source", dynlib: avrodll.}
proc avroWriterMemorySetDest*(writer: AvroWriterT; buf: cstring; len: int64T) {.cdecl,
    importc: "avro_writer_memory_set_dest", dynlib: avrodll.}
proc avroRead*(reader: AvroReaderT; buf: pointer; len: int64T): cint {.cdecl,
    importc: "avro_read", dynlib: avrodll.}
proc avroSkip*(reader: AvroReaderT; len: int64T): cint {.cdecl, importc: "avro_skip",
    dynlib: avrodll.}
proc avroWrite*(writer: AvroWriterT; buf: pointer; len: int64T): cint {.cdecl,
    importc: "avro_write", dynlib: avrodll.}
proc avroReaderReset*(reader: AvroReaderT) {.cdecl, importc: "avro_reader_reset",
    dynlib: avrodll.}
proc avroWriterReset*(writer: AvroWriterT) {.cdecl, importc: "avro_writer_reset",
    dynlib: avrodll.}
proc avroWriterTell*(writer: AvroWriterT): int64T {.cdecl,
    importc: "avro_writer_tell", dynlib: avrodll.}
proc avroWriterFlush*(writer: AvroWriterT) {.cdecl, importc: "avro_writer_flush",
    dynlib: avrodll.}
proc avroWriterDump*(writer: AvroWriterT; fp: ptr File) {.cdecl,
    importc: "avro_writer_dump", dynlib: avrodll.}
proc avroReaderDump*(reader: AvroReaderT; fp: ptr File) {.cdecl,
    importc: "avro_reader_dump", dynlib: avrodll.}
proc avroReaderIsEof*(reader: AvroReaderT): cint {.cdecl,
    importc: "avro_reader_is_eof", dynlib: avrodll.}
proc avroReaderFree*(reader: AvroReaderT) {.cdecl, importc: "avro_reader_free",
    dynlib: avrodll.}
proc avroWriterFree*(writer: AvroWriterT) {.cdecl, importc: "avro_writer_free",
    dynlib: avrodll.}
proc avroSchemaToJson*(schema: AvroSchemaT; `out`: AvroWriterT): cint {.cdecl,
    importc: "avro_schema_to_json", dynlib: avrodll.}
proc avroValueRead*(reader: AvroReaderT; dest: ptr AvroValueT): cint {.cdecl,
    importc: "avro_value_read", dynlib: avrodll.}
proc avroValueWrite*(writer: AvroWriterT; src: ptr AvroValueT): cint {.cdecl,
    importc: "avro_value_write", dynlib: avrodll.}
proc avroValueSizeof*(src: ptr AvroValueT; size: ptr csize_t): cint {.cdecl,
    importc: "avro_value_sizeof", dynlib: avrodll.}
type
  AvroFileReaderT* = ptr avroFileReaderT
  AvroFileWriterT* = ptr avroFileWriterT

proc avroFileWriterCreate*(path: cstring; schema: AvroSchemaT;
                          writer: ptr AvroFileWriterT): cint {.cdecl,
    importc: "avro_file_writer_create", dynlib: avrodll.}
proc avroFileWriterCreateFp*(fp: ptr File; path: cstring; shouldClose: cint;
                            schema: AvroSchemaT; writer: ptr AvroFileWriterT): cint {.
    cdecl, importc: "avro_file_writer_create_fp", dynlib: avrodll.}
proc avroFileWriterCreateWithCodec*(path: cstring; schema: AvroSchemaT;
                                   writer: ptr AvroFileWriterT; codec: cstring;
                                   blockSize: csize_t): cint {.cdecl,
    importc: "avro_file_writer_create_with_codec", dynlib: avrodll.}
proc avroFileWriterCreateWithCodecFp*(fp: ptr File; path: cstring; shouldClose: cint;
                                     schema: AvroSchemaT;
                                     writer: ptr AvroFileWriterT; codec: cstring;
                                     blockSize: csize_t): cint {.cdecl,
    importc: "avro_file_writer_create_with_codec_fp", dynlib: avrodll.}
proc avroFileWriterOpen*(path: cstring; writer: ptr AvroFileWriterT): cint {.cdecl,
    importc: "avro_file_writer_open", dynlib: avrodll.}
proc avroFileWriterOpenBs*(path: cstring; writer: ptr AvroFileWriterT;
                          blockSize: csize_t): cint {.cdecl,
    importc: "avro_file_writer_open_bs", dynlib: avrodll.}
proc avroFileReader*(path: cstring; reader: ptr AvroFileReaderT): cint {.cdecl,
    importc: "avro_file_reader", dynlib: avrodll.}
proc avroFileReaderFp*(fp: ptr File; path: cstring; shouldClose: cint;
                      reader: ptr AvroFileReaderT): cint {.cdecl,
    importc: "avro_file_reader_fp", dynlib: avrodll.}
proc avroFileReaderGetWriterSchema*(reader: AvroFileReaderT): AvroSchemaT {.cdecl,
    importc: "avro_file_reader_get_writer_schema", dynlib: avrodll.}
proc avroFileWriterSync*(writer: AvroFileWriterT): cint {.cdecl,
    importc: "avro_file_writer_sync", dynlib: avrodll.}
proc avroFileWriterFlush*(writer: AvroFileWriterT): cint {.cdecl,
    importc: "avro_file_writer_flush", dynlib: avrodll.}
proc avroFileWriterClose*(writer: AvroFileWriterT): cint {.cdecl,
    importc: "avro_file_writer_close", dynlib: avrodll.}
proc avroFileReaderClose*(reader: AvroFileReaderT): cint {.cdecl,
    importc: "avro_file_reader_close", dynlib: avrodll.}
proc avroFileReaderReadValue*(reader: AvroFileReaderT; dest: ptr AvroValueT): cint {.
    cdecl, importc: "avro_file_reader_read_value", dynlib: avrodll.}
proc avroFileWriterAppendValue*(writer: AvroFileWriterT; src: ptr AvroValueT): cint {.
    cdecl, importc: "avro_file_writer_append_value", dynlib: avrodll.}
proc avroFileWriterAppendEncoded*(writer: AvroFileWriterT; buf: pointer; len: int64T): cint {.
    cdecl, importc: "avro_file_writer_append_encoded", dynlib: avrodll.}
proc avroReadData*(reader: AvroReaderT; writerSchema: AvroSchemaT;
                  readerSchema: AvroSchemaT; datum: ptr AvroDatumT): cint {.cdecl,
    importc: "avro_read_data", dynlib: avrodll.}
proc avroSkipData*(reader: AvroReaderT; writerSchema: AvroSchemaT): cint {.cdecl,
    importc: "avro_skip_data", dynlib: avrodll.}
proc avroWriteData*(writer: AvroWriterT; writerSchema: AvroSchemaT; datum: AvroDatumT): cint {.
    cdecl, importc: "avro_write_data", dynlib: avrodll.}
proc avroSizeData*(writer: AvroWriterT; writerSchema: AvroSchemaT; datum: AvroDatumT): int64T {.
    cdecl, importc: "avro_size_data", dynlib: avrodll.}
proc avroFileWriterAppend*(writer: AvroFileWriterT; datum: AvroDatumT): cint {.cdecl,
    importc: "avro_file_writer_append", dynlib: avrodll.}
proc avroFileReaderRead*(reader: AvroFileReaderT; readersSchema: AvroSchemaT;
                        datum: ptr AvroDatumT): cint {.cdecl,
    importc: "avro_file_reader_read", dynlib: avrodll.}
type
  AvroConsumerT* = avroConsumerT
  AvroConsumerT* {.bycopy.} = object
    schema*: AvroSchemaT
    free*: proc (consumer: ptr AvroConsumerT) {.cdecl.}
    booleanValue*: proc (consumer: ptr AvroConsumerT; value: cint; userData: pointer): cint {.
        cdecl.}
    bytesValue*: proc (consumer: ptr AvroConsumerT; value: pointer; valueLen: csize_t;
                     userData: pointer): cint {.cdecl.}
    doubleValue*: proc (consumer: ptr AvroConsumerT; value: cdouble; userData: pointer): cint {.
        cdecl.}
    floatValue*: proc (consumer: ptr AvroConsumerT; value: cfloat; userData: pointer): cint {.
        cdecl.}
    intValue*: proc (consumer: ptr AvroConsumerT; value: int32T; userData: pointer): cint {.
        cdecl.}
    longValue*: proc (consumer: ptr AvroConsumerT; value: int64T; userData: pointer): cint {.
        cdecl.}
    nullValue*: proc (consumer: ptr AvroConsumerT; userData: pointer): cint {.cdecl.}
    stringValue*: proc (consumer: ptr AvroConsumerT; value: pointer; valueLen: csize_t;
                      userData: pointer): cint {.cdecl.}
    arrayStartBlock*: proc (consumer: ptr AvroConsumerT; isFirstBlock: cint;
                          blockCount: cuint; userData: pointer): cint {.cdecl.}
    arrayElement*: proc (consumer: ptr AvroConsumerT; index: cuint;
                       elementConsumer: ptr ptr AvroConsumerT;
                       elementUserData: ptr pointer; userData: pointer): cint {.cdecl.}
    enumValue*: proc (consumer: ptr AvroConsumerT; value: cint; userData: pointer): cint {.
        cdecl.}
    fixedValue*: proc (consumer: ptr AvroConsumerT; value: pointer; valueLen: csize_t;
                     userData: pointer): cint {.cdecl.}
    mapStartBlock*: proc (consumer: ptr AvroConsumerT; isFirstBlock: cint;
                        blockCount: cuint; userData: pointer): cint {.cdecl.}
    mapElement*: proc (consumer: ptr AvroConsumerT; index: cuint; key: cstring;
                     valueConsumer: ptr ptr AvroConsumerT;
                     valueUserData: ptr pointer; userData: pointer): cint {.cdecl.}
    recordStart*: proc (consumer: ptr AvroConsumerT; userData: pointer): cint {.cdecl.}
    recordField*: proc (consumer: ptr AvroConsumerT; index: cuint;
                      fieldConsumer: ptr ptr AvroConsumerT;
                      fieldUserData: ptr pointer; userData: pointer): cint {.cdecl.}
    unionBranch*: proc (consumer: ptr AvroConsumerT; discriminant: cuint;
                      branchConsumer: ptr ptr AvroConsumerT;
                      branchUserData: ptr pointer; userData: pointer): cint {.cdecl.}


proc avroConsumerFree*(consumer: ptr AvroConsumerT) {.cdecl,
    importc: "avro_consumer_free", dynlib: avrodll.}
proc avroResolverNew*(writerSchema: AvroSchemaT; readerSchema: AvroSchemaT): ptr AvroConsumerT {.
    cdecl, importc: "avro_resolver_new", dynlib: avrodll.}
proc avroConsumeBinary*(reader: AvroReaderT; consumer: ptr AvroConsumerT; ud: pointer): cint {.
    cdecl, importc: "avro_consume_binary", dynlib: avrodll.}
proc avroStrerror*(): cstring {.cdecl, importc: "avro_strerror", dynlib: avrodll.}
proc avroSetError*(fmt: cstring) {.varargs, cdecl, importc: "avro_set_error",
                                dynlib: avrodll.}
proc avroPrefixError*(fmt: cstring) {.varargs, cdecl, importc: "avro_prefix_error",
                                   dynlib: avrodll.}
proc avroGenericClassFromSchema*(schema: AvroSchemaT): ptr AvroValueIfaceT {.cdecl,
    importc: "avro_generic_class_from_schema", dynlib: avrodll.}
proc avroGenericValueNew*(iface: ptr AvroValueIfaceT; dest: ptr AvroValueT): cint {.
    cdecl, importc: "avro_generic_value_new", dynlib: avrodll.}
proc avroGenericBooleanClass*(): ptr AvroValueIfaceT {.cdecl,
    importc: "avro_generic_boolean_class", dynlib: avrodll.}
proc avroGenericBytesClass*(): ptr AvroValueIfaceT {.cdecl,
    importc: "avro_generic_bytes_class", dynlib: avrodll.}
proc avroGenericDoubleClass*(): ptr AvroValueIfaceT {.cdecl,
    importc: "avro_generic_double_class", dynlib: avrodll.}
proc avroGenericFloatClass*(): ptr AvroValueIfaceT {.cdecl,
    importc: "avro_generic_float_class", dynlib: avrodll.}
proc avroGenericIntClass*(): ptr AvroValueIfaceT {.cdecl,
    importc: "avro_generic_int_class", dynlib: avrodll.}
proc avroGenericLongClass*(): ptr AvroValueIfaceT {.cdecl,
    importc: "avro_generic_long_class", dynlib: avrodll.}
proc avroGenericNullClass*(): ptr AvroValueIfaceT {.cdecl,
    importc: "avro_generic_null_class", dynlib: avrodll.}
proc avroGenericStringClass*(): ptr AvroValueIfaceT {.cdecl,
    importc: "avro_generic_string_class", dynlib: avrodll.}
proc avroGenericBooleanNew*(value: ptr AvroValueT; val: cint): cint {.cdecl,
    importc: "avro_generic_boolean_new", dynlib: avrodll.}
proc avroGenericBytesNew*(value: ptr AvroValueT; buf: pointer; size: csize_t): cint {.
    cdecl, importc: "avro_generic_bytes_new", dynlib: avrodll.}
proc avroGenericDoubleNew*(value: ptr AvroValueT; val: cdouble): cint {.cdecl,
    importc: "avro_generic_double_new", dynlib: avrodll.}
proc avroGenericFloatNew*(value: ptr AvroValueT; val: cfloat): cint {.cdecl,
    importc: "avro_generic_float_new", dynlib: avrodll.}
proc avroGenericIntNew*(value: ptr AvroValueT; val: int32T): cint {.cdecl,
    importc: "avro_generic_int_new", dynlib: avrodll.}
proc avroGenericLongNew*(value: ptr AvroValueT; val: int64T): cint {.cdecl,
    importc: "avro_generic_long_new", dynlib: avrodll.}
proc avroGenericNullNew*(value: ptr AvroValueT): cint {.cdecl,
    importc: "avro_generic_null_new", dynlib: avrodll.}
proc avroGenericStringNew*(value: ptr AvroValueT; val: cstring): cint {.cdecl,
    importc: "avro_generic_string_new", dynlib: avrodll.}
proc avroGenericStringNewLength*(value: ptr AvroValueT; val: cstring; size: csize_t): cint {.
    cdecl, importc: "avro_generic_string_new_length", dynlib: avrodll.}
proc avroResolvedWriterNew*(writerSchema: AvroSchemaT; readerSchema: AvroSchemaT): ptr AvroValueIfaceT {.
    cdecl, importc: "avro_resolved_writer_new", dynlib: avrodll.}
proc avroResolvedWriterNewValue*(iface: ptr AvroValueIfaceT; value: ptr AvroValueT): cint {.
    cdecl, importc: "avro_resolved_writer_new_value", dynlib: avrodll.}
proc avroResolvedWriterSetDest*(resolved: ptr AvroValueT; dest: ptr AvroValueT) {.
    cdecl, importc: "avro_resolved_writer_set_dest", dynlib: avrodll.}
proc avroResolvedWriterClearDest*(resolved: ptr AvroValueT) {.cdecl,
    importc: "avro_resolved_writer_clear_dest", dynlib: avrodll.}
proc avroResolvedReaderNew*(writerSchema: AvroSchemaT; readerSchema: AvroSchemaT): ptr AvroValueIfaceT {.
    cdecl, importc: "avro_resolved_reader_new", dynlib: avrodll.}
proc avroResolvedReaderNewValue*(iface: ptr AvroValueIfaceT; value: ptr AvroValueT): cint {.
    cdecl, importc: "avro_resolved_reader_new_value", dynlib: avrodll.}
proc avroResolvedReaderSetSource*(resolved: ptr AvroValueT; dest: ptr AvroValueT) {.
    cdecl, importc: "avro_resolved_reader_set_source", dynlib: avrodll.}
proc avroResolvedReaderClearSource*(resolved: ptr AvroValueT) {.cdecl,
    importc: "avro_resolved_reader_clear_source", dynlib: avrodll.}