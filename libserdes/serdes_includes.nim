type
  SerdesErrT* {.size: sizeof(cint).} = enum
    SERDES_ERR_OK = 0, SERDES_ERR_CONF_UNKNOWN, SERDES_ERR_CONF_INVALID,
    SERDES_ERR_FRAMING_INVALID, SERDES_ERR_SCHEMA_LOAD,
    SERDES_ERR_PAYLOAD_INVALID, SERDES_ERR_SCHEMA_MISMATCH,
    SERDES_ERR_SCHEMA_REQUIRED, SERDES_ERR_SERIALIZER, SERDES_ERR_BUFFER_SIZE


type
  SerdesT* = serdesS
  SerdesSchemaT* = serdesSchemaS
  SerdesConfT* = serdesConfS

proc serdesErr2str*(err: SerdesErrT): cstring {.cdecl, importc: "serdes_err2str",
    dynlib: serdesdll.}
proc serdesConfDestroy*(sconf: ptr SerdesConfT) {.cdecl,
    importc: "serdes_conf_destroy", dynlib: serdesdll.}
proc serdesConfCopy*(src: ptr SerdesConfT): ptr SerdesConfT {.cdecl,
    importc: "serdes_conf_copy", dynlib: serdesdll.}
proc serdesConfSet*(sconf: ptr SerdesConfT; name: cstring; val: cstring;
                   errstr: cstring; errstrSize: cint): SerdesErrT {.cdecl,
    importc: "serdes_conf_set", dynlib: serdesdll.}
proc serdesConfSetSchemaLoadCb*(sconf: ptr SerdesConfT; loadCb: proc (
    schema: ptr SerdesSchemaT; definition: cstring; definitionLen: csize_t;
    errstr: cstring; errstrSize: csize_t; opaque: pointer): pointer {.cdecl.}; unloadCb: proc (
    schema: ptr SerdesSchemaT; schemaObj: pointer; opaque: pointer) {.cdecl.}) {.cdecl,
    importc: "serdes_conf_set_schema_load_cb", dynlib: serdesdll.}
proc serdesConfSetLogCb*(sconf: ptr SerdesConfT; logCb: proc (sd: ptr SerdesT;
    level: cint; fac: cstring; buf: cstring; opaque: pointer) {.cdecl.}) {.cdecl,
    importc: "serdes_conf_set_log_cb", dynlib: serdesdll.}
proc serdesConfSetOpaque*(sconf: ptr SerdesConfT; opaque: pointer) {.cdecl,
    importc: "serdes_conf_set_opaque", dynlib: serdesdll.}
proc serdesConfNew*(errstr: cstring; errstrSize: cint): ptr SerdesConfT {.varargs,
    cdecl, importc: "serdes_conf_new", dynlib: serdesdll.}
proc serdesSchemaDestroy*(ss: ptr SerdesSchemaT) {.cdecl,
    importc: "serdes_schema_destroy", dynlib: serdesdll.}
proc serdesSchemaGet*(sd: ptr SerdesT; name: cstring; id: cint; errstr: cstring;
                     errstrSize: cint): ptr SerdesSchemaT {.cdecl,
    importc: "serdes_schema_get", dynlib: serdesdll.}
proc serdesSchemaAdd*(sd: ptr SerdesT; name: cstring; id: cint; definition: pointer;
                     definitionLen: cint; errstr: cstring; errstrSize: cint): ptr SerdesSchemaT {.
    cdecl, importc: "serdes_schema_add", dynlib: serdesdll.}
proc serdesSchemaId*(schema: ptr SerdesSchemaT): cint {.cdecl,
    importc: "serdes_schema_id", dynlib: serdesdll.}
proc serdesSchemaName*(schema: ptr SerdesSchemaT): cstring {.cdecl,
    importc: "serdes_schema_name", dynlib: serdesdll.}
proc serdesSchemaDefinition*(schema: ptr SerdesSchemaT): cstring {.cdecl,
    importc: "serdes_schema_definition", dynlib: serdesdll.}
proc serdesSchemaObject*(schema: ptr SerdesSchemaT): pointer {.cdecl,
    importc: "serdes_schema_object", dynlib: serdesdll.}
proc serdesSchemaHandle*(schema: ptr SerdesSchemaT): ptr SerdesT {.cdecl,
    importc: "serdes_schema_handle", dynlib: serdesdll.}
proc serdesSchemaSetOpaque*(schema: ptr SerdesSchemaT; opaque: pointer) {.cdecl,
    importc: "serdes_schema_set_opaque", dynlib: serdesdll.}
proc serdesSchemaOpaque*(schema: ptr SerdesSchemaT): pointer {.cdecl,
    importc: "serdes_schema_opaque", dynlib: serdesdll.}
proc serdesSchemasPurge*(serdes: ptr SerdesT; maxAge: cint): cint {.cdecl,
    importc: "serdes_schemas_purge", dynlib: serdesdll.}
proc serdesNew*(conf: ptr SerdesConfT; errstr: cstring; errstrSize: csize_t): ptr SerdesT {.
    cdecl, importc: "serdes_new", dynlib: serdesdll.}
proc serdesDestroy*(serdes: ptr SerdesT) {.cdecl, importc: "serdes_destroy",
                                       dynlib: serdesdll.}
proc serdesSerializerFramingSize*(schema: ptr SerdesT): csize_t {.cdecl,
    importc: "serdes_serializer_framing_size", dynlib: serdesdll.}
proc serdesDeserializerFramingSize*(serdes: ptr SerdesT): csize_t {.cdecl,
    importc: "serdes_deserializer_framing_size", dynlib: serdesdll.}
proc serdesFramingWrite*(schema: ptr SerdesSchemaT; payload: cstring; size: csize_t): csize_t {.
    cdecl, importc: "serdes_framing_write", dynlib: serdesdll.}
proc serdesFramingRead*(sd: ptr SerdesT; payloadp: ptr pointer; sizep: ptr csize_t;
                       schemap: ptr ptr SerdesSchemaT; errstr: cstring;
                       errstrSize: cint): SsizeT {.cdecl,
    importc: "serdes_framing_read", dynlib: serdesdll.}