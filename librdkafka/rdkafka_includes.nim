proc rdKafkaVersion*(): cint {.cdecl, importc: "rd_kafka_version", dynlib: rdkafkadll.}
proc rdKafkaVersionStr*(): cstring {.cdecl, importc: "rd_kafka_version_str",
                                  dynlib: rdkafkadll.}
type
  RdKafkaTypeT* {.size: sizeof(cint).} = enum
    RD_KAFKA_PRODUCER, RD_KAFKA_CONSUMER
  RdKafkaTimestampTypeT* {.size: sizeof(cint).} = enum
    RD_KAFKA_TIMESTAMP_NOT_AVAILABLE, RD_KAFKA_TIMESTAMP_CREATE_TIME,
    RD_KAFKA_TIMESTAMP_LOG_APPEND_TIME



proc rdKafkaGetDebugContexts*(): cstring {.cdecl,
                                        importc: "rd_kafka_get_debug_contexts",
                                        dynlib: rdkafkadll.}
type
  RdKafkaT* = rdKafkaS
  RdKafkaTopicT* = rdKafkaTopicS
  RdKafkaConfT* = rdKafkaConfS
  RdKafkaTopicConfT* = rdKafkaTopicConfS
  RdKafkaQueueT* = rdKafkaQueueS
  RdKafkaEventT* = rdKafkaOpS
  RdKafkaTopicResultT* = rdKafkaTopicResultS
  RdKafkaConsumerGroupMetadataT* = rdKafkaConsumerGroupMetadataS
  RdKafkaErrorT* = rdKafkaErrorS
  RdKafkaHeadersT* = rdKafkaHeadersS
  RdKafkaGroupResultT* = rdKafkaGroupResultS
  RdKafkaRespErrT* {.size: sizeof(cint).} = enum
    RD_KAFKA_RESP_ERR__BEGIN = -200, RD_KAFKA_RESP_ERR__BAD_MSG = -199,
    RD_KAFKA_RESP_ERR__BAD_COMPRESSION = -198, RD_KAFKA_RESP_ERR__DESTROY = -197,
    RD_KAFKA_RESP_ERR__FAIL = -196, RD_KAFKA_RESP_ERR__TRANSPORT = -195,
    RD_KAFKA_RESP_ERR__CRIT_SYS_RESOURCE = -194,
    RD_KAFKA_RESP_ERR__RESOLVE = -193, RD_KAFKA_RESP_ERR__MSG_TIMED_OUT = -192,
    RD_KAFKA_RESP_ERR__PARTITION_EOF = -191,
    RD_KAFKA_RESP_ERR__UNKNOWN_PARTITION = -190, RD_KAFKA_RESP_ERR__FS = -189,
    RD_KAFKA_RESP_ERR__UNKNOWN_TOPIC = -188,
    RD_KAFKA_RESP_ERR__ALL_BROKERS_DOWN = -187,
    RD_KAFKA_RESP_ERR__INVALID_ARG = -186, RD_KAFKA_RESP_ERR__TIMED_OUT = -185,
    RD_KAFKA_RESP_ERR__QUEUE_FULL = -184, RD_KAFKA_RESP_ERR__ISR_INSUFF = -183,
    RD_KAFKA_RESP_ERR__NODE_UPDATE = -182, RD_KAFKA_RESP_ERR__SSL = -181,
    RD_KAFKA_RESP_ERR__WAIT_COORD = -180, RD_KAFKA_RESP_ERR__UNKNOWN_GROUP = -179,
    RD_KAFKA_RESP_ERR__IN_PROGRESS = -178,
    RD_KAFKA_RESP_ERR__PREV_IN_PROGRESS = -177,
    RD_KAFKA_RESP_ERR__EXISTING_SUBSCRIPTION = -176,
    RD_KAFKA_RESP_ERR__ASSIGN_PARTITIONS = -175,
    RD_KAFKA_RESP_ERR__REVOKE_PARTITIONS = -174,
    RD_KAFKA_RESP_ERR__CONFLICT = -173, RD_KAFKA_RESP_ERR__STATE = -172,
    RD_KAFKA_RESP_ERR__UNKNOWN_PROTOCOL = -171,
    RD_KAFKA_RESP_ERR__NOT_IMPLEMENTED = -170,
    RD_KAFKA_RESP_ERR__AUTHENTICATION = -169, RD_KAFKA_RESP_ERR__NO_OFFSET = -168,
    RD_KAFKA_RESP_ERR__OUTDATED = -167, RD_KAFKA_RESP_ERR__TIMED_OUT_QUEUE = -166,
    RD_KAFKA_RESP_ERR__UNSUPPORTED_FEATURE = -165,
    RD_KAFKA_RESP_ERR__WAIT_CACHE = -164, RD_KAFKA_RESP_ERR__INTR = -163,
    RD_KAFKA_RESP_ERR__KEY_SERIALIZATION = -162,
    RD_KAFKA_RESP_ERR__VALUE_SERIALIZATION = -161,
    RD_KAFKA_RESP_ERR__KEY_DESERIALIZATION = -160,
    RD_KAFKA_RESP_ERR__VALUE_DESERIALIZATION = -159,
    RD_KAFKA_RESP_ERR__PARTIAL = -158, RD_KAFKA_RESP_ERR__READ_ONLY = -157,
    RD_KAFKA_RESP_ERR__NOENT = -156, RD_KAFKA_RESP_ERR__UNDERFLOW = -155,
    RD_KAFKA_RESP_ERR__INVALID_TYPE = -154, RD_KAFKA_RESP_ERR__RETRY = -153,
    RD_KAFKA_RESP_ERR__PURGE_QUEUE = -152,
    RD_KAFKA_RESP_ERR__PURGE_INFLIGHT = -151, RD_KAFKA_RESP_ERR__FATAL = -150,
    RD_KAFKA_RESP_ERR__INCONSISTENT = -149,
    RD_KAFKA_RESP_ERR__GAPLESS_GUARANTEE = -148,
    RD_KAFKA_RESP_ERR__MAX_POLL_EXCEEDED = -147,
    RD_KAFKA_RESP_ERR__UNKNOWN_BROKER = -146,
    RD_KAFKA_RESP_ERR__NOT_CONFIGURED = -145, RD_KAFKA_RESP_ERR__FENCED = -144,
    RD_KAFKA_RESP_ERR__APPLICATION = -143,
    RD_KAFKA_RESP_ERR__ASSIGNMENT_LOST = -142, RD_KAFKA_RESP_ERR__NOOP = -141,
    RD_KAFKA_RESP_ERR__AUTO_OFFSET_RESET = -140, RD_KAFKA_RESP_ERR__END = -100,
    RD_KAFKA_RESP_ERR_UNKNOWN = -1, RD_KAFKA_RESP_ERR_NO_ERROR = 0,
    RD_KAFKA_RESP_ERR_OFFSET_OUT_OF_RANGE = 1, RD_KAFKA_RESP_ERR_INVALID_MSG = 2,
    RD_KAFKA_RESP_ERR_UNKNOWN_TOPIC_OR_PART = 3,
    RD_KAFKA_RESP_ERR_INVALID_MSG_SIZE = 4,
    RD_KAFKA_RESP_ERR_LEADER_NOT_AVAILABLE = 5,
    RD_KAFKA_RESP_ERR_NOT_LEADER_FOR_PARTITION = 6,
    RD_KAFKA_RESP_ERR_REQUEST_TIMED_OUT = 7,
    RD_KAFKA_RESP_ERR_BROKER_NOT_AVAILABLE = 8,
    RD_KAFKA_RESP_ERR_REPLICA_NOT_AVAILABLE = 9,
    RD_KAFKA_RESP_ERR_MSG_SIZE_TOO_LARGE = 10,
    RD_KAFKA_RESP_ERR_STALE_CTRL_EPOCH = 11,
    RD_KAFKA_RESP_ERR_OFFSET_METADATA_TOO_LARGE = 12,
    RD_KAFKA_RESP_ERR_NETWORK_EXCEPTION = 13,
    RD_KAFKA_RESP_ERR_COORDINATOR_LOAD_IN_PROGRESS = 14,
    RD_KAFKA_RESP_ERR_COORDINATOR_NOT_AVAILABLE = 15,
    RD_KAFKA_RESP_ERR_NOT_COORDINATOR = 16, RD_KAFKA_RESP_ERR_TOPIC_EXCEPTION = 17,
    RD_KAFKA_RESP_ERR_RECORD_LIST_TOO_LARGE = 18,
    RD_KAFKA_RESP_ERR_NOT_ENOUGH_REPLICAS = 19,
    RD_KAFKA_RESP_ERR_NOT_ENOUGH_REPLICAS_AFTER_APPEND = 20,
    RD_KAFKA_RESP_ERR_INVALID_REQUIRED_ACKS = 21,
    RD_KAFKA_RESP_ERR_ILLEGAL_GENERATION = 22,
    RD_KAFKA_RESP_ERR_INCONSISTENT_GROUP_PROTOCOL = 23,
    RD_KAFKA_RESP_ERR_INVALID_GROUP_ID = 24,
    RD_KAFKA_RESP_ERR_UNKNOWN_MEMBER_ID = 25,
    RD_KAFKA_RESP_ERR_INVALID_SESSION_TIMEOUT = 26,
    RD_KAFKA_RESP_ERR_REBALANCE_IN_PROGRESS = 27,
    RD_KAFKA_RESP_ERR_INVALID_COMMIT_OFFSET_SIZE = 28,
    RD_KAFKA_RESP_ERR_TOPIC_AUTHORIZATION_FAILED = 29,
    RD_KAFKA_RESP_ERR_GROUP_AUTHORIZATION_FAILED = 30,
    RD_KAFKA_RESP_ERR_CLUSTER_AUTHORIZATION_FAILED = 31,
    RD_KAFKA_RESP_ERR_INVALID_TIMESTAMP = 32,
    RD_KAFKA_RESP_ERR_UNSUPPORTED_SASL_MECHANISM = 33,
    RD_KAFKA_RESP_ERR_ILLEGAL_SASL_STATE = 34,
    RD_KAFKA_RESP_ERR_UNSUPPORTED_VERSION = 35,
    RD_KAFKA_RESP_ERR_TOPIC_ALREADY_EXISTS = 36,
    RD_KAFKA_RESP_ERR_INVALID_PARTITIONS = 37,
    RD_KAFKA_RESP_ERR_INVALID_REPLICATION_FACTOR = 38,
    RD_KAFKA_RESP_ERR_INVALID_REPLICA_ASSIGNMENT = 39,
    RD_KAFKA_RESP_ERR_INVALID_CONFIG = 40, RD_KAFKA_RESP_ERR_NOT_CONTROLLER = 41,
    RD_KAFKA_RESP_ERR_INVALID_REQUEST = 42,
    RD_KAFKA_RESP_ERR_UNSUPPORTED_FOR_MESSAGE_FORMAT = 43,
    RD_KAFKA_RESP_ERR_POLICY_VIOLATION = 44,
    RD_KAFKA_RESP_ERR_OUT_OF_ORDER_SEQUENCE_NUMBER = 45,
    RD_KAFKA_RESP_ERR_DUPLICATE_SEQUENCE_NUMBER = 46,
    RD_KAFKA_RESP_ERR_INVALID_PRODUCER_EPOCH = 47,
    RD_KAFKA_RESP_ERR_INVALID_TXN_STATE = 48,
    RD_KAFKA_RESP_ERR_INVALID_PRODUCER_ID_MAPPING = 49,
    RD_KAFKA_RESP_ERR_INVALID_TRANSACTION_TIMEOUT = 50,
    RD_KAFKA_RESP_ERR_CONCURRENT_TRANSACTIONS = 51,
    RD_KAFKA_RESP_ERR_TRANSACTION_COORDINATOR_FENCED = 52,
    RD_KAFKA_RESP_ERR_TRANSACTIONAL_ID_AUTHORIZATION_FAILED = 53,
    RD_KAFKA_RESP_ERR_SECURITY_DISABLED = 54,
    RD_KAFKA_RESP_ERR_OPERATION_NOT_ATTEMPTED = 55,
    RD_KAFKA_RESP_ERR_KAFKA_STORAGE_ERROR = 56,
    RD_KAFKA_RESP_ERR_LOG_DIR_NOT_FOUND = 57,
    RD_KAFKA_RESP_ERR_SASL_AUTHENTICATION_FAILED = 58,
    RD_KAFKA_RESP_ERR_UNKNOWN_PRODUCER_ID = 59,
    RD_KAFKA_RESP_ERR_REASSIGNMENT_IN_PROGRESS = 60,
    RD_KAFKA_RESP_ERR_DELEGATION_TOKEN_AUTH_DISABLED = 61,
    RD_KAFKA_RESP_ERR_DELEGATION_TOKEN_NOT_FOUND = 62,
    RD_KAFKA_RESP_ERR_DELEGATION_TOKEN_OWNER_MISMATCH = 63,
    RD_KAFKA_RESP_ERR_DELEGATION_TOKEN_REQUEST_NOT_ALLOWED = 64,
    RD_KAFKA_RESP_ERR_DELEGATION_TOKEN_AUTHORIZATION_FAILED = 65,
    RD_KAFKA_RESP_ERR_DELEGATION_TOKEN_EXPIRED = 66,
    RD_KAFKA_RESP_ERR_INVALID_PRINCIPAL_TYPE = 67,
    RD_KAFKA_RESP_ERR_NON_EMPTY_GROUP = 68,
    RD_KAFKA_RESP_ERR_GROUP_ID_NOT_FOUND = 69,
    RD_KAFKA_RESP_ERR_FETCH_SESSION_ID_NOT_FOUND = 70,
    RD_KAFKA_RESP_ERR_INVALID_FETCH_SESSION_EPOCH = 71,
    RD_KAFKA_RESP_ERR_LISTENER_NOT_FOUND = 72,
    RD_KAFKA_RESP_ERR_TOPIC_DELETION_DISABLED = 73,
    RD_KAFKA_RESP_ERR_FENCED_LEADER_EPOCH = 74,
    RD_KAFKA_RESP_ERR_UNKNOWN_LEADER_EPOCH = 75,
    RD_KAFKA_RESP_ERR_UNSUPPORTED_COMPRESSION_TYPE = 76,
    RD_KAFKA_RESP_ERR_STALE_BROKER_EPOCH = 77,
    RD_KAFKA_RESP_ERR_OFFSET_NOT_AVAILABLE = 78,
    RD_KAFKA_RESP_ERR_MEMBER_ID_REQUIRED = 79,
    RD_KAFKA_RESP_ERR_PREFERRED_LEADER_NOT_AVAILABLE = 80,
    RD_KAFKA_RESP_ERR_GROUP_MAX_SIZE_REACHED = 81,
    RD_KAFKA_RESP_ERR_FENCED_INSTANCE_ID = 82,
    RD_KAFKA_RESP_ERR_ELIGIBLE_LEADERS_NOT_AVAILABLE = 83,
    RD_KAFKA_RESP_ERR_ELECTION_NOT_NEEDED = 84,
    RD_KAFKA_RESP_ERR_NO_REASSIGNMENT_IN_PROGRESS = 85,
    RD_KAFKA_RESP_ERR_GROUP_SUBSCRIBED_TO_TOPIC = 86,
    RD_KAFKA_RESP_ERR_INVALID_RECORD = 87,
    RD_KAFKA_RESP_ERR_UNSTABLE_OFFSET_COMMIT = 88,
    RD_KAFKA_RESP_ERR_THROTTLING_QUOTA_EXCEEDED = 89,
    RD_KAFKA_RESP_ERR_PRODUCER_FENCED = 90,
    RD_KAFKA_RESP_ERR_RESOURCE_NOT_FOUND = 91,
    RD_KAFKA_RESP_ERR_DUPLICATE_RESOURCE = 92,
    RD_KAFKA_RESP_ERR_UNACCEPTABLE_CREDENTIAL = 93,
    RD_KAFKA_RESP_ERR_INCONSISTENT_VOTER_SET = 94,
    RD_KAFKA_RESP_ERR_INVALID_UPDATE_VERSION = 95,
    RD_KAFKA_RESP_ERR_FEATURE_UPDATE_FAILED = 96,
    RD_KAFKA_RESP_ERR_PRINCIPAL_DESERIALIZATION_FAILURE = 97,
    RD_KAFKA_RESP_ERR_END_ALL


type
  RdKafkaErrDesc* {.bycopy.} = object
    code*: RdKafkaRespErrT
    name*: cstring
    desc*: cstring


proc rdKafkaGetErrDescs*(errdescs: ptr ptr RdKafkaErrDesc; cntp: ptr csize_t) {.cdecl,
    importc: "rd_kafka_get_err_descs", dynlib: rdkafkadll.}
proc rdKafkaErr2str*(err: RdKafkaRespErrT): cstring {.cdecl,
    importc: "rd_kafka_err2str", dynlib: rdkafkadll.}
proc rdKafkaErr2name*(err: RdKafkaRespErrT): cstring {.cdecl,
    importc: "rd_kafka_err2name", dynlib: rdkafkadll.}
proc rdKafkaLastError*(): RdKafkaRespErrT {.cdecl, importc: "rd_kafka_last_error",
    dynlib: rdkafkadll.}
attribute((deprecated))
proc rdKafkaErrno2err*(errnox: cint): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_errno2err", dynlib: rdkafkadll.}
attribute((deprecated))
proc rdKafkaErrno*(): cint {.cdecl, importc: "rd_kafka_errno", dynlib: rdkafkadll.}
proc rdKafkaFatalError*(rk: ptr RdKafkaT; errstr: cstring; errstrSize: csize_t): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_fatal_error", dynlib: rdkafkadll.}
proc rdKafkaTestFatalError*(rk: ptr RdKafkaT; err: RdKafkaRespErrT; reason: cstring): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_test_fatal_error", dynlib: rdkafkadll.}
proc rdKafkaErrorCode*(error: ptr RdKafkaErrorT): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_error_code", dynlib: rdkafkadll.}
proc rdKafkaErrorName*(error: ptr RdKafkaErrorT): cstring {.cdecl,
    importc: "rd_kafka_error_name", dynlib: rdkafkadll.}
proc rdKafkaErrorString*(error: ptr RdKafkaErrorT): cstring {.cdecl,
    importc: "rd_kafka_error_string", dynlib: rdkafkadll.}
proc rdKafkaErrorIsFatal*(error: ptr RdKafkaErrorT): cint {.cdecl,
    importc: "rd_kafka_error_is_fatal", dynlib: rdkafkadll.}
proc rdKafkaErrorIsRetriable*(error: ptr RdKafkaErrorT): cint {.cdecl,
    importc: "rd_kafka_error_is_retriable", dynlib: rdkafkadll.}
proc rdKafkaErrorTxnRequiresAbort*(error: ptr RdKafkaErrorT): cint {.cdecl,
    importc: "rd_kafka_error_txn_requires_abort", dynlib: rdkafkadll.}
proc rdKafkaErrorDestroy*(error: ptr RdKafkaErrorT) {.cdecl,
    importc: "rd_kafka_error_destroy", dynlib: rdkafkadll.}
proc rdKafkaErrorNew*(code: RdKafkaRespErrT; fmt: cstring): ptr RdKafkaErrorT {.
    varargs, cdecl, importc: "rd_kafka_error_new", dynlib: rdkafkadll.}
attribute((format(printf, 2, 3)))
type
  RdKafkaTopicPartitionT* {.bycopy.} = object
    topic*: cstring
    partition*: int32T
    offset*: int64T
    metadata*: pointer
    metadataSize*: csize_t
    opaque*: pointer
    err*: RdKafkaRespErrT
    private*: pointer


proc rdKafkaTopicPartitionDestroy*(rktpar: ptr RdKafkaTopicPartitionT) {.cdecl,
    importc: "rd_kafka_topic_partition_destroy", dynlib: rdkafkadll.}
type
  RdKafkaTopicPartitionListT* {.bycopy.} = object
    cnt*: cint
    size*: cint
    elems*: ptr RdKafkaTopicPartitionT


proc rdKafkaTopicPartitionListNew*(size: cint): ptr RdKafkaTopicPartitionListT {.
    cdecl, importc: "rd_kafka_topic_partition_list_new", dynlib: rdkafkadll.}
proc rdKafkaTopicPartitionListDestroy*(rkparlist: ptr RdKafkaTopicPartitionListT) {.
    cdecl, importc: "rd_kafka_topic_partition_list_destroy", dynlib: rdkafkadll.}
proc rdKafkaTopicPartitionListAdd*(rktparlist: ptr RdKafkaTopicPartitionListT;
                                  topic: cstring; partition: int32T): ptr RdKafkaTopicPartitionT {.
    cdecl, importc: "rd_kafka_topic_partition_list_add", dynlib: rdkafkadll.}
proc rdKafkaTopicPartitionListAddRange*(rktparlist: ptr RdKafkaTopicPartitionListT;
                                       topic: cstring; start: int32T; stop: int32T) {.
    cdecl, importc: "rd_kafka_topic_partition_list_add_range", dynlib: rdkafkadll.}
proc rdKafkaTopicPartitionListDel*(rktparlist: ptr RdKafkaTopicPartitionListT;
                                  topic: cstring; partition: int32T): cint {.cdecl,
    importc: "rd_kafka_topic_partition_list_del", dynlib: rdkafkadll.}
proc rdKafkaTopicPartitionListDelByIdx*(rktparlist: ptr RdKafkaTopicPartitionListT;
                                       idx: cint): cint {.cdecl,
    importc: "rd_kafka_topic_partition_list_del_by_idx", dynlib: rdkafkadll.}
proc rdKafkaTopicPartitionListCopy*(src: ptr RdKafkaTopicPartitionListT): ptr RdKafkaTopicPartitionListT {.
    cdecl, importc: "rd_kafka_topic_partition_list_copy", dynlib: rdkafkadll.}
proc rdKafkaTopicPartitionListSetOffset*(rktparlist: ptr RdKafkaTopicPartitionListT;
                                        topic: cstring; partition: int32T;
                                        offset: int64T): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_topic_partition_list_set_offset", dynlib: rdkafkadll.}
proc rdKafkaTopicPartitionListFind*(rktparlist: ptr RdKafkaTopicPartitionListT;
                                   topic: cstring; partition: int32T): ptr RdKafkaTopicPartitionT {.
    cdecl, importc: "rd_kafka_topic_partition_list_find", dynlib: rdkafkadll.}
proc rdKafkaTopicPartitionListSort*(rktparlist: ptr RdKafkaTopicPartitionListT; cmp: proc (
    a: pointer; b: pointer; cmpOpaque: pointer): cint {.cdecl.}; cmpOpaque: pointer) {.
    cdecl, importc: "rd_kafka_topic_partition_list_sort", dynlib: rdkafkadll.}
type
  RdKafkaVtypeT* {.size: sizeof(cint).} = enum
    RD_KAFKA_VTYPE_END, RD_KAFKA_VTYPE_TOPIC, RD_KAFKA_VTYPE_RKT,
    RD_KAFKA_VTYPE_PARTITION, RD_KAFKA_VTYPE_VALUE, RD_KAFKA_VTYPE_KEY,
    RD_KAFKA_VTYPE_OPAQUE, RD_KAFKA_VTYPE_MSGFLAGS, RD_KAFKA_VTYPE_TIMESTAMP,
    RD_KAFKA_VTYPE_HEADER, RD_KAFKA_VTYPE_HEADERS


type
  INNER_C_STRUCT_rdkafka_includes_618* {.bycopy.} = object
    `ptr`*: pointer
    size*: csize_t

  INNER_C_STRUCT_rdkafka_includes_622* {.bycopy.} = object
    name*: cstring
    val*: pointer
    size*: SsizeT

  INNER_C_UNION_rdkafka_includes_612* {.bycopy.} = object {.union.}
    cstr*: cstring
    rkt*: ptr RdKafkaTopicT
    i*: cint
    i32*: int32T
    i64*: int64T
    mem*: INNER_C_STRUCT_rdkafka_includes_618
    header*: INNER_C_STRUCT_rdkafka_includes_622
    headers*: ptr RdKafkaHeadersT
    `ptr`*: pointer
    pad*: array[64, char]

  RdKafkaVuT* {.bycopy.} = object
    vtype*: RdKafkaVtypeT
    u*: INNER_C_UNION_rdkafka_includes_612


proc rdKafkaHeadersNew*(initialCount: csize_t): ptr RdKafkaHeadersT {.cdecl,
    importc: "rd_kafka_headers_new", dynlib: rdkafkadll.}
proc rdKafkaHeadersDestroy*(hdrs: ptr RdKafkaHeadersT) {.cdecl,
    importc: "rd_kafka_headers_destroy", dynlib: rdkafkadll.}
proc rdKafkaHeadersCopy*(src: ptr RdKafkaHeadersT): ptr RdKafkaHeadersT {.cdecl,
    importc: "rd_kafka_headers_copy", dynlib: rdkafkadll.}
proc rdKafkaHeaderAdd*(hdrs: ptr RdKafkaHeadersT; name: cstring; nameSize: SsizeT;
                      value: pointer; valueSize: SsizeT): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_header_add", dynlib: rdkafkadll.}
proc rdKafkaHeaderRemove*(hdrs: ptr RdKafkaHeadersT; name: cstring): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_header_remove", dynlib: rdkafkadll.}
proc rdKafkaHeaderGetLast*(hdrs: ptr RdKafkaHeadersT; name: cstring;
                          valuep: ptr pointer; sizep: ptr csize_t): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_header_get_last", dynlib: rdkafkadll.}
proc rdKafkaHeaderGet*(hdrs: ptr RdKafkaHeadersT; idx: csize_t; name: cstring;
                      valuep: ptr pointer; sizep: ptr csize_t): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_header_get", dynlib: rdkafkadll.}
proc rdKafkaHeaderGetAll*(hdrs: ptr RdKafkaHeadersT; idx: csize_t;
                         namep: cstringArray; valuep: ptr pointer; sizep: ptr csize_t): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_header_get_all", dynlib: rdkafkadll.}
type
  RdKafkaMessageT* {.bycopy.} = object
    err*: RdKafkaRespErrT
    rkt*: ptr RdKafkaTopicT
    partition*: int32T
    payload*: pointer
    len*: csize_t
    key*: pointer
    keyLen*: csize_t
    offset*: int64T
    private*: pointer


proc rdKafkaMessageDestroy*(rkmessage: ptr RdKafkaMessageT) {.cdecl,
    importc: "rd_kafka_message_destroy", dynlib: rdkafkadll.}
proc rdKafkaMessageErrstr*(rkmessage: ptr RdKafkaMessageT): cstring {.cdecl,
    importc: "rd_kafka_message_errstr", dynlib: rdkafkadll.}
proc rdKafkaMessageTimestamp*(rkmessage: ptr RdKafkaMessageT;
                             tstype: ptr RdKafkaTimestampTypeT): int64T {.cdecl,
    importc: "rd_kafka_message_timestamp", dynlib: rdkafkadll.}
proc rdKafkaMessageLatency*(rkmessage: ptr RdKafkaMessageT): int64T {.cdecl,
    importc: "rd_kafka_message_latency", dynlib: rdkafkadll.}
proc rdKafkaMessageBrokerId*(rkmessage: ptr RdKafkaMessageT): int32T {.cdecl,
    importc: "rd_kafka_message_broker_id", dynlib: rdkafkadll.}
proc rdKafkaMessageHeaders*(rkmessage: ptr RdKafkaMessageT;
                           hdrsp: ptr ptr RdKafkaHeadersT): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_message_headers", dynlib: rdkafkadll.}
proc rdKafkaMessageDetachHeaders*(rkmessage: ptr RdKafkaMessageT;
                                 hdrsp: ptr ptr RdKafkaHeadersT): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_message_detach_headers", dynlib: rdkafkadll.}
proc rdKafkaMessageSetHeaders*(rkmessage: ptr RdKafkaMessageT;
                              hdrs: ptr RdKafkaHeadersT) {.cdecl,
    importc: "rd_kafka_message_set_headers", dynlib: rdkafkadll.}
proc rdKafkaHeaderCnt*(hdrs: ptr RdKafkaHeadersT): csize_t {.cdecl,
    importc: "rd_kafka_header_cnt", dynlib: rdkafkadll.}
type
  RdKafkaMsgStatusT* {.size: sizeof(cint).} = enum
    RD_KAFKA_MSG_STATUS_NOT_PERSISTED = 0,
    RD_KAFKA_MSG_STATUS_POSSIBLY_PERSISTED = 1, RD_KAFKA_MSG_STATUS_PERSISTED = 2


proc rdKafkaMessageStatus*(rkmessage: ptr RdKafkaMessageT): RdKafkaMsgStatusT {.
    cdecl, importc: "rd_kafka_message_status", dynlib: rdkafkadll.}
type
  RdKafkaConfResT* {.size: sizeof(cint).} = enum
    RD_KAFKA_CONF_UNKNOWN = -2, RD_KAFKA_CONF_INVALID = -1, RD_KAFKA_CONF_OK = 0


proc rdKafkaConfNew*(): ptr RdKafkaConfT {.cdecl, importc: "rd_kafka_conf_new",
                                       dynlib: rdkafkadll.}
proc rdKafkaConfDestroy*(conf: ptr RdKafkaConfT) {.cdecl,
    importc: "rd_kafka_conf_destroy", dynlib: rdkafkadll.}
proc rdKafkaConfDup*(conf: ptr RdKafkaConfT): ptr RdKafkaConfT {.cdecl,
    importc: "rd_kafka_conf_dup", dynlib: rdkafkadll.}
proc rdKafkaConfDupFilter*(conf: ptr RdKafkaConfT; filterCnt: csize_t;
                          filter: cstringArray): ptr RdKafkaConfT {.cdecl,
    importc: "rd_kafka_conf_dup_filter", dynlib: rdkafkadll.}
proc rdKafkaConf*(rk: ptr RdKafkaT): ptr RdKafkaConfT {.cdecl,
    importc: "rd_kafka_conf", dynlib: rdkafkadll.}
proc rdKafkaConfSet*(conf: ptr RdKafkaConfT; name: cstring; value: cstring;
                    errstr: cstring; errstrSize: csize_t): RdKafkaConfResT {.cdecl,
    importc: "rd_kafka_conf_set", dynlib: rdkafkadll.}
proc rdKafkaConfSetEvents*(conf: ptr RdKafkaConfT; events: cint) {.cdecl,
    importc: "rd_kafka_conf_set_events", dynlib: rdkafkadll.}
proc rdKafkaConfSetBackgroundEventCb*(conf: ptr RdKafkaConfT; eventCb: proc (
    rk: ptr RdKafkaT; rkev: ptr RdKafkaEventT; opaque: pointer) {.cdecl.}) {.cdecl,
    importc: "rd_kafka_conf_set_background_event_cb", dynlib: rdkafkadll.}
proc rdKafkaConfSetDrCb*(conf: ptr RdKafkaConfT; drCb: proc (rk: ptr RdKafkaT;
    payload: pointer; len: csize_t; err: RdKafkaRespErrT; opaque: pointer;
    msgOpaque: pointer) {.cdecl.}) {.cdecl, importc: "rd_kafka_conf_set_dr_cb",
                                  dynlib: rdkafkadll.}
proc rdKafkaConfSetDrMsgCb*(conf: ptr RdKafkaConfT; drMsgCb: proc (rk: ptr RdKafkaT;
    rkmessage: ptr RdKafkaMessageT; opaque: pointer) {.cdecl.}) {.cdecl,
    importc: "rd_kafka_conf_set_dr_msg_cb", dynlib: rdkafkadll.}
proc rdKafkaConfSetConsumeCb*(conf: ptr RdKafkaConfT; consumeCb: proc (
    rkmessage: ptr RdKafkaMessageT; opaque: pointer) {.cdecl.}) {.cdecl,
    importc: "rd_kafka_conf_set_consume_cb", dynlib: rdkafkadll.}
proc rdKafkaConfSetRebalanceCb*(conf: ptr RdKafkaConfT; rebalanceCb: proc (
    rk: ptr RdKafkaT; err: RdKafkaRespErrT;
    partitions: ptr RdKafkaTopicPartitionListT; opaque: pointer) {.cdecl.}) {.cdecl,
    importc: "rd_kafka_conf_set_rebalance_cb", dynlib: rdkafkadll.}
proc rdKafkaConfSetOffsetCommitCb*(conf: ptr RdKafkaConfT; offsetCommitCb: proc (
    rk: ptr RdKafkaT; err: RdKafkaRespErrT; offsets: ptr RdKafkaTopicPartitionListT;
    opaque: pointer) {.cdecl.}) {.cdecl,
                               importc: "rd_kafka_conf_set_offset_commit_cb",
                               dynlib: rdkafkadll.}
proc rdKafkaConfSetErrorCb*(conf: ptr RdKafkaConfT; errorCb: proc (rk: ptr RdKafkaT;
    err: cint; reason: cstring; opaque: pointer) {.cdecl.}) {.cdecl,
    importc: "rd_kafka_conf_set_error_cb", dynlib: rdkafkadll.}
proc rdKafkaConfSetThrottleCb*(conf: ptr RdKafkaConfT; throttleCb: proc (
    rk: ptr RdKafkaT; brokerName: cstring; brokerId: int32T; throttleTimeMs: cint;
    opaque: pointer) {.cdecl.}) {.cdecl, importc: "rd_kafka_conf_set_throttle_cb",
                               dynlib: rdkafkadll.}
proc rdKafkaConfSetLogCb*(conf: ptr RdKafkaConfT; logCb: proc (rk: ptr RdKafkaT;
    level: cint; fac: cstring; buf: cstring) {.cdecl.}) {.cdecl,
    importc: "rd_kafka_conf_set_log_cb", dynlib: rdkafkadll.}
proc rdKafkaConfSetStatsCb*(conf: ptr RdKafkaConfT; statsCb: proc (rk: ptr RdKafkaT;
    json: cstring; jsonLen: csize_t; opaque: pointer): cint {.cdecl.}) {.cdecl,
    importc: "rd_kafka_conf_set_stats_cb", dynlib: rdkafkadll.}
proc rdKafkaConfSetOauthbearerTokenRefreshCb*(conf: ptr RdKafkaConfT;
    oauthbearerTokenRefreshCb: proc (rk: ptr RdKafkaT; oauthbearerConfig: cstring;
                                   opaque: pointer) {.cdecl.}) {.cdecl,
    importc: "rd_kafka_conf_set_oauthbearer_token_refresh_cb", dynlib: rdkafkadll.}
proc rdKafkaConfSetSocketCb*(conf: ptr RdKafkaConfT; socketCb: proc (domain: cint;
    `type`: cint; protocol: cint; opaque: pointer): cint {.cdecl.}) {.cdecl,
    importc: "rd_kafka_conf_set_socket_cb", dynlib: rdkafkadll.}
proc rdKafkaConfSetConnectCb*(conf: ptr RdKafkaConfT; connectCb: proc (sockfd: cint;
    `addr`: ptr Sockaddr; addrlen: cint; id: cstring; opaque: pointer): cint {.cdecl.}) {.
    cdecl, importc: "rd_kafka_conf_set_connect_cb", dynlib: rdkafkadll.}
proc rdKafkaConfSetClosesocketCb*(conf: ptr RdKafkaConfT; closesocketCb: proc (
    sockfd: cint; opaque: pointer): cint {.cdecl.}) {.cdecl,
    importc: "rd_kafka_conf_set_closesocket_cb", dynlib: rdkafkadll.}
proc rdKafkaConfSetOpenCb*(conf: ptr RdKafkaConfT; openCb: proc (pathname: cstring;
    flags: cint; mode: ModeT; opaque: pointer): cint {.cdecl.}) {.cdecl,
    importc: "rd_kafka_conf_set_open_cb", dynlib: rdkafkadll.}
proc rdKafkaConfSetSslCertVerifyCb*(conf: ptr RdKafkaConfT; sslCertVerifyCb: proc (
    rk: ptr RdKafkaT; brokerName: cstring; brokerId: int32T; x509Error: ptr cint;
    depth: cint; buf: cstring; size: csize_t; errstr: cstring; errstrSize: csize_t;
    opaque: pointer): cint {.cdecl.}): RdKafkaConfResT {.cdecl,
    importc: "rd_kafka_conf_set_ssl_cert_verify_cb", dynlib: rdkafkadll.}
type
  RdKafkaCertTypeT* {.size: sizeof(cint).} = enum
    RD_KAFKA_CERT_PUBLIC_KEY, RD_KAFKA_CERT_PRIVATE_KEY, RD_KAFKA_CERT_CA,
    RD_KAFKA_CERT__CNT


type
  RdKafkaCertEncT* {.size: sizeof(cint).} = enum
    RD_KAFKA_CERT_ENC_PKCS12, RD_KAFKA_CERT_ENC_DER, RD_KAFKA_CERT_ENC_PEM,
    RD_KAFKA_CERT_ENC__CNT


proc rdKafkaConfSetSslCert*(conf: ptr RdKafkaConfT; certType: RdKafkaCertTypeT;
                           certEnc: RdKafkaCertEncT; buffer: pointer; size: csize_t;
                           errstr: cstring; errstrSize: csize_t): RdKafkaConfResT {.
    cdecl, importc: "rd_kafka_conf_set_ssl_cert", dynlib: rdkafkadll.}
proc rdKafkaConfSetEngineCallbackData*(conf: ptr RdKafkaConfT; callbackData: pointer) {.
    cdecl, importc: "rd_kafka_conf_set_engine_callback_data", dynlib: rdkafkadll.}
proc rdKafkaConfSetOpaque*(conf: ptr RdKafkaConfT; opaque: pointer) {.cdecl,
    importc: "rd_kafka_conf_set_opaque", dynlib: rdkafkadll.}
proc rdKafkaOpaque*(rk: ptr RdKafkaT): pointer {.cdecl, importc: "rd_kafka_opaque",
    dynlib: rdkafkadll.}
proc rdKafkaConfSetDefaultTopicConf*(conf: ptr RdKafkaConfT;
                                    tconf: ptr RdKafkaTopicConfT) {.cdecl,
    importc: "rd_kafka_conf_set_default_topic_conf", dynlib: rdkafkadll.}
proc rdKafkaConfGetDefaultTopicConf*(conf: ptr RdKafkaConfT): ptr RdKafkaTopicConfT {.
    cdecl, importc: "rd_kafka_conf_get_default_topic_conf", dynlib: rdkafkadll.}
proc rdKafkaConfGet*(conf: ptr RdKafkaConfT; name: cstring; dest: cstring;
                    destSize: ptr csize_t): RdKafkaConfResT {.cdecl,
    importc: "rd_kafka_conf_get", dynlib: rdkafkadll.}
proc rdKafkaTopicConfGet*(conf: ptr RdKafkaTopicConfT; name: cstring; dest: cstring;
                         destSize: ptr csize_t): RdKafkaConfResT {.cdecl,
    importc: "rd_kafka_topic_conf_get", dynlib: rdkafkadll.}
proc rdKafkaConfDump*(conf: ptr RdKafkaConfT; cntp: ptr csize_t): cstringArray {.cdecl,
    importc: "rd_kafka_conf_dump", dynlib: rdkafkadll.}
proc rdKafkaTopicConfDump*(conf: ptr RdKafkaTopicConfT; cntp: ptr csize_t): cstringArray {.
    cdecl, importc: "rd_kafka_topic_conf_dump", dynlib: rdkafkadll.}
proc rdKafkaConfDumpFree*(arr: cstringArray; cnt: csize_t) {.cdecl,
    importc: "rd_kafka_conf_dump_free", dynlib: rdkafkadll.}
proc rdKafkaConfPropertiesShow*(fp: ptr File) {.cdecl,
    importc: "rd_kafka_conf_properties_show", dynlib: rdkafkadll.}
proc rdKafkaTopicConfNew*(): ptr RdKafkaTopicConfT {.cdecl,
    importc: "rd_kafka_topic_conf_new", dynlib: rdkafkadll.}
proc rdKafkaTopicConfDup*(conf: ptr RdKafkaTopicConfT): ptr RdKafkaTopicConfT {.cdecl,
    importc: "rd_kafka_topic_conf_dup", dynlib: rdkafkadll.}
proc rdKafkaDefaultTopicConfDup*(rk: ptr RdKafkaT): ptr RdKafkaTopicConfT {.cdecl,
    importc: "rd_kafka_default_topic_conf_dup", dynlib: rdkafkadll.}
proc rdKafkaTopicConfDestroy*(topicConf: ptr RdKafkaTopicConfT) {.cdecl,
    importc: "rd_kafka_topic_conf_destroy", dynlib: rdkafkadll.}
proc rdKafkaTopicConfSet*(conf: ptr RdKafkaTopicConfT; name: cstring; value: cstring;
                         errstr: cstring; errstrSize: csize_t): RdKafkaConfResT {.
    cdecl, importc: "rd_kafka_topic_conf_set", dynlib: rdkafkadll.}
proc rdKafkaTopicConfSetOpaque*(conf: ptr RdKafkaTopicConfT; rktOpaque: pointer) {.
    cdecl, importc: "rd_kafka_topic_conf_set_opaque", dynlib: rdkafkadll.}
proc rdKafkaTopicConfSetPartitionerCb*(topicConf: ptr RdKafkaTopicConfT; partitioner: proc (
    rkt: ptr RdKafkaTopicT; keydata: pointer; keylen: csize_t; partitionCnt: int32T;
    rktOpaque: pointer; msgOpaque: pointer): int32T {.cdecl.}) {.cdecl,
    importc: "rd_kafka_topic_conf_set_partitioner_cb", dynlib: rdkafkadll.}
proc rdKafkaTopicConfSetMsgOrderCmp*(topicConf: ptr RdKafkaTopicConfT; msgOrderCmp: proc (
    a: ptr RdKafkaMessageT; b: ptr RdKafkaMessageT): cint {.cdecl.}) {.cdecl,
    importc: "rd_kafka_topic_conf_set_msg_order_cmp", dynlib: rdkafkadll.}
proc rdKafkaTopicPartitionAvailable*(rkt: ptr RdKafkaTopicT; partition: int32T): cint {.
    cdecl, importc: "rd_kafka_topic_partition_available", dynlib: rdkafkadll.}
proc rdKafkaMsgPartitionerRandom*(rkt: ptr RdKafkaTopicT; key: pointer;
                                 keylen: csize_t; partitionCnt: int32T;
                                 rktOpaque: pointer; msgOpaque: pointer): int32T {.
    cdecl, importc: "rd_kafka_msg_partitioner_random", dynlib: rdkafkadll.}
proc rdKafkaMsgPartitionerConsistent*(rkt: ptr RdKafkaTopicT; key: pointer;
                                     keylen: csize_t; partitionCnt: int32T;
                                     rktOpaque: pointer; msgOpaque: pointer): int32T {.
    cdecl, importc: "rd_kafka_msg_partitioner_consistent", dynlib: rdkafkadll.}
proc rdKafkaMsgPartitionerConsistentRandom*(rkt: ptr RdKafkaTopicT; key: pointer;
    keylen: csize_t; partitionCnt: int32T; rktOpaque: pointer; msgOpaque: pointer): int32T {.
    cdecl, importc: "rd_kafka_msg_partitioner_consistent_random",
    dynlib: rdkafkadll.}
proc rdKafkaMsgPartitionerMurmur2*(rkt: ptr RdKafkaTopicT; key: pointer;
                                  keylen: csize_t; partitionCnt: int32T;
                                  rktOpaque: pointer; msgOpaque: pointer): int32T {.
    cdecl, importc: "rd_kafka_msg_partitioner_murmur2", dynlib: rdkafkadll.}
proc rdKafkaMsgPartitionerMurmur2Random*(rkt: ptr RdKafkaTopicT; key: pointer;
                                        keylen: csize_t; partitionCnt: int32T;
                                        rktOpaque: pointer; msgOpaque: pointer): int32T {.
    cdecl, importc: "rd_kafka_msg_partitioner_murmur2_random", dynlib: rdkafkadll.}
proc rdKafkaMsgPartitionerFnv1a*(rkt: ptr RdKafkaTopicT; key: pointer;
                                keylen: csize_t; partitionCnt: int32T;
                                rktOpaque: pointer; msgOpaque: pointer): int32T {.
    cdecl, importc: "rd_kafka_msg_partitioner_fnv1a", dynlib: rdkafkadll.}
proc rdKafkaMsgPartitionerFnv1aRandom*(rkt: ptr RdKafkaTopicT; key: pointer;
                                      keylen: csize_t; partitionCnt: int32T;
                                      rktOpaque: pointer; msgOpaque: pointer): int32T {.
    cdecl, importc: "rd_kafka_msg_partitioner_fnv1a_random", dynlib: rdkafkadll.}
proc rdKafkaNew*(`type`: RdKafkaTypeT; conf: ptr RdKafkaConfT; errstr: cstring;
                errstrSize: csize_t): ptr RdKafkaT {.cdecl, importc: "rd_kafka_new",
    dynlib: rdkafkadll.}
proc rdKafkaDestroy*(rk: ptr RdKafkaT) {.cdecl, importc: "rd_kafka_destroy",
                                     dynlib: rdkafkadll.}
proc rdKafkaDestroyFlags*(rk: ptr RdKafkaT; flags: cint) {.cdecl,
    importc: "rd_kafka_destroy_flags", dynlib: rdkafkadll.}
proc rdKafkaName*(rk: ptr RdKafkaT): cstring {.cdecl, importc: "rd_kafka_name",
    dynlib: rdkafkadll.}
proc rdKafkaType*(rk: ptr RdKafkaT): RdKafkaTypeT {.cdecl, importc: "rd_kafka_type",
    dynlib: rdkafkadll.}
proc rdKafkaMemberid*(rk: ptr RdKafkaT): cstring {.cdecl,
    importc: "rd_kafka_memberid", dynlib: rdkafkadll.}
proc rdKafkaClusterid*(rk: ptr RdKafkaT; timeoutMs: cint): cstring {.cdecl,
    importc: "rd_kafka_clusterid", dynlib: rdkafkadll.}
proc rdKafkaControllerid*(rk: ptr RdKafkaT; timeoutMs: cint): int32T {.cdecl,
    importc: "rd_kafka_controllerid", dynlib: rdkafkadll.}
proc rdKafkaTopicNew*(rk: ptr RdKafkaT; topic: cstring; conf: ptr RdKafkaTopicConfT): ptr RdKafkaTopicT {.
    cdecl, importc: "rd_kafka_topic_new", dynlib: rdkafkadll.}
proc rdKafkaTopicDestroy*(rkt: ptr RdKafkaTopicT) {.cdecl,
    importc: "rd_kafka_topic_destroy", dynlib: rdkafkadll.}
proc rdKafkaTopicName*(rkt: ptr RdKafkaTopicT): cstring {.cdecl,
    importc: "rd_kafka_topic_name", dynlib: rdkafkadll.}
proc rdKafkaTopicOpaque*(rkt: ptr RdKafkaTopicT): pointer {.cdecl,
    importc: "rd_kafka_topic_opaque", dynlib: rdkafkadll.}
proc rdKafkaPoll*(rk: ptr RdKafkaT; timeoutMs: cint): cint {.cdecl,
    importc: "rd_kafka_poll", dynlib: rdkafkadll.}
proc rdKafkaYield*(rk: ptr RdKafkaT) {.cdecl, importc: "rd_kafka_yield",
                                   dynlib: rdkafkadll.}
proc rdKafkaPausePartitions*(rk: ptr RdKafkaT;
                            partitions: ptr RdKafkaTopicPartitionListT): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_pause_partitions", dynlib: rdkafkadll.}
proc rdKafkaResumePartitions*(rk: ptr RdKafkaT;
                             partitions: ptr RdKafkaTopicPartitionListT): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_resume_partitions", dynlib: rdkafkadll.}
proc rdKafkaQueryWatermarkOffsets*(rk: ptr RdKafkaT; topic: cstring;
                                  partition: int32T; low: ptr int64T;
                                  high: ptr int64T; timeoutMs: cint): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_query_watermark_offsets", dynlib: rdkafkadll.}
proc rdKafkaGetWatermarkOffsets*(rk: ptr RdKafkaT; topic: cstring; partition: int32T;
                                low: ptr int64T; high: ptr int64T): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_get_watermark_offsets", dynlib: rdkafkadll.}
proc rdKafkaOffsetsForTimes*(rk: ptr RdKafkaT;
                            offsets: ptr RdKafkaTopicPartitionListT;
                            timeoutMs: cint): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_offsets_for_times", dynlib: rdkafkadll.}
proc rdKafkaMemCalloc*(rk: ptr RdKafkaT; num: csize_t; size: csize_t): pointer {.cdecl,
    importc: "rd_kafka_mem_calloc", dynlib: rdkafkadll.}
proc rdKafkaMemMalloc*(rk: ptr RdKafkaT; size: csize_t): pointer {.cdecl,
    importc: "rd_kafka_mem_malloc", dynlib: rdkafkadll.}
proc rdKafkaMemFree*(rk: ptr RdKafkaT; `ptr`: pointer) {.cdecl,
    importc: "rd_kafka_mem_free", dynlib: rdkafkadll.}
proc rdKafkaQueueNew*(rk: ptr RdKafkaT): ptr RdKafkaQueueT {.cdecl,
    importc: "rd_kafka_queue_new", dynlib: rdkafkadll.}
proc rdKafkaQueueDestroy*(rkqu: ptr RdKafkaQueueT) {.cdecl,
    importc: "rd_kafka_queue_destroy", dynlib: rdkafkadll.}
proc rdKafkaQueueGetMain*(rk: ptr RdKafkaT): ptr RdKafkaQueueT {.cdecl,
    importc: "rd_kafka_queue_get_main", dynlib: rdkafkadll.}
proc rdKafkaQueueGetConsumer*(rk: ptr RdKafkaT): ptr RdKafkaQueueT {.cdecl,
    importc: "rd_kafka_queue_get_consumer", dynlib: rdkafkadll.}
proc rdKafkaQueueGetPartition*(rk: ptr RdKafkaT; topic: cstring; partition: int32T): ptr RdKafkaQueueT {.
    cdecl, importc: "rd_kafka_queue_get_partition", dynlib: rdkafkadll.}
proc rdKafkaQueueGetBackground*(rk: ptr RdKafkaT): ptr RdKafkaQueueT {.cdecl,
    importc: "rd_kafka_queue_get_background", dynlib: rdkafkadll.}
proc rdKafkaQueueForward*(src: ptr RdKafkaQueueT; dst: ptr RdKafkaQueueT) {.cdecl,
    importc: "rd_kafka_queue_forward", dynlib: rdkafkadll.}
proc rdKafkaSetLogQueue*(rk: ptr RdKafkaT; rkqu: ptr RdKafkaQueueT): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_set_log_queue", dynlib: rdkafkadll.}
proc rdKafkaQueueLength*(rkqu: ptr RdKafkaQueueT): csize_t {.cdecl,
    importc: "rd_kafka_queue_length", dynlib: rdkafkadll.}
proc rdKafkaQueueIoEventEnable*(rkqu: ptr RdKafkaQueueT; fd: cint; payload: pointer;
                               size: csize_t) {.cdecl,
    importc: "rd_kafka_queue_io_event_enable", dynlib: rdkafkadll.}
proc rdKafkaQueueCbEventEnable*(rkqu: ptr RdKafkaQueueT; eventCb: proc (
    rk: ptr RdKafkaT; qevOpaque: pointer) {.cdecl.}; qevOpaque: pointer) {.cdecl,
    importc: "rd_kafka_queue_cb_event_enable", dynlib: rdkafkadll.}
proc rdKafkaQueueYield*(rkqu: ptr RdKafkaQueueT) {.cdecl,
    importc: "rd_kafka_queue_yield", dynlib: rdkafkadll.}
proc rdKafkaConsumeStart*(rkt: ptr RdKafkaTopicT; partition: int32T; offset: int64T): cint {.
    cdecl, importc: "rd_kafka_consume_start", dynlib: rdkafkadll.}
proc rdKafkaConsumeStartQueue*(rkt: ptr RdKafkaTopicT; partition: int32T;
                              offset: int64T; rkqu: ptr RdKafkaQueueT): cint {.cdecl,
    importc: "rd_kafka_consume_start_queue", dynlib: rdkafkadll.}
proc rdKafkaConsumeStop*(rkt: ptr RdKafkaTopicT; partition: int32T): cint {.cdecl,
    importc: "rd_kafka_consume_stop", dynlib: rdkafkadll.}
proc rdKafkaSeek*(rkt: ptr RdKafkaTopicT; partition: int32T; offset: int64T;
                 timeoutMs: cint): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_seek", dynlib: rdkafkadll.}
proc rdKafkaSeekPartitions*(rk: ptr RdKafkaT;
                           partitions: ptr RdKafkaTopicPartitionListT;
                           timeoutMs: cint): ptr RdKafkaErrorT {.cdecl,
    importc: "rd_kafka_seek_partitions", dynlib: rdkafkadll.}
proc rdKafkaConsume*(rkt: ptr RdKafkaTopicT; partition: int32T; timeoutMs: cint): ptr RdKafkaMessageT {.
    cdecl, importc: "rd_kafka_consume", dynlib: rdkafkadll.}
proc rdKafkaConsumeBatch*(rkt: ptr RdKafkaTopicT; partition: int32T; timeoutMs: cint;
                         rkmessages: ptr ptr RdKafkaMessageT;
                         rkmessagesSize: csize_t): SsizeT {.cdecl,
    importc: "rd_kafka_consume_batch", dynlib: rdkafkadll.}
proc rdKafkaConsumeCallback*(rkt: ptr RdKafkaTopicT; partition: int32T;
                            timeoutMs: cint; consumeCb: proc (
    rkmessage: ptr RdKafkaMessageT; commitOpaque: pointer) {.cdecl.};
                            commitOpaque: pointer): cint {.cdecl,
    importc: "rd_kafka_consume_callback", dynlib: rdkafkadll.}
proc rdKafkaConsumeQueue*(rkqu: ptr RdKafkaQueueT; timeoutMs: cint): ptr RdKafkaMessageT {.
    cdecl, importc: "rd_kafka_consume_queue", dynlib: rdkafkadll.}
proc rdKafkaConsumeBatchQueue*(rkqu: ptr RdKafkaQueueT; timeoutMs: cint;
                              rkmessages: ptr ptr RdKafkaMessageT;
                              rkmessagesSize: csize_t): SsizeT {.cdecl,
    importc: "rd_kafka_consume_batch_queue", dynlib: rdkafkadll.}
proc rdKafkaConsumeCallbackQueue*(rkqu: ptr RdKafkaQueueT; timeoutMs: cint; consumeCb: proc (
    rkmessage: ptr RdKafkaMessageT; commitOpaque: pointer) {.cdecl.};
                                 commitOpaque: pointer): cint {.cdecl,
    importc: "rd_kafka_consume_callback_queue", dynlib: rdkafkadll.}
proc rdKafkaOffsetStore*(rkt: ptr RdKafkaTopicT; partition: int32T; offset: int64T): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_offset_store", dynlib: rdkafkadll.}
proc rdKafkaOffsetsStore*(rk: ptr RdKafkaT; offsets: ptr RdKafkaTopicPartitionListT): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_offsets_store", dynlib: rdkafkadll.}
proc rdKafkaSubscribe*(rk: ptr RdKafkaT; topics: ptr RdKafkaTopicPartitionListT): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_subscribe", dynlib: rdkafkadll.}
proc rdKafkaUnsubscribe*(rk: ptr RdKafkaT): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_unsubscribe", dynlib: rdkafkadll.}
proc rdKafkaSubscription*(rk: ptr RdKafkaT;
                         topics: ptr ptr RdKafkaTopicPartitionListT): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_subscription", dynlib: rdkafkadll.}
proc rdKafkaConsumerPoll*(rk: ptr RdKafkaT; timeoutMs: cint): ptr RdKafkaMessageT {.
    cdecl, importc: "rd_kafka_consumer_poll", dynlib: rdkafkadll.}
proc rdKafkaConsumerClose*(rk: ptr RdKafkaT): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_consumer_close", dynlib: rdkafkadll.}
proc rdKafkaIncrementalAssign*(rk: ptr RdKafkaT;
                              partitions: ptr RdKafkaTopicPartitionListT): ptr RdKafkaErrorT {.
    cdecl, importc: "rd_kafka_incremental_assign", dynlib: rdkafkadll.}
proc rdKafkaIncrementalUnassign*(rk: ptr RdKafkaT;
                                partitions: ptr RdKafkaTopicPartitionListT): ptr RdKafkaErrorT {.
    cdecl, importc: "rd_kafka_incremental_unassign", dynlib: rdkafkadll.}
proc rdKafkaRebalanceProtocol*(rk: ptr RdKafkaT): cstring {.cdecl,
    importc: "rd_kafka_rebalance_protocol", dynlib: rdkafkadll.}
proc rdKafkaAssign*(rk: ptr RdKafkaT; partitions: ptr RdKafkaTopicPartitionListT): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_assign", dynlib: rdkafkadll.}
proc rdKafkaAssignment*(rk: ptr RdKafkaT;
                       partitions: ptr ptr RdKafkaTopicPartitionListT): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_assignment", dynlib: rdkafkadll.}
proc rdKafkaAssignmentLost*(rk: ptr RdKafkaT): cint {.cdecl,
    importc: "rd_kafka_assignment_lost", dynlib: rdkafkadll.}
proc rdKafkaCommit*(rk: ptr RdKafkaT; offsets: ptr RdKafkaTopicPartitionListT;
                   async: cint): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_commit", dynlib: rdkafkadll.}
proc rdKafkaCommitMessage*(rk: ptr RdKafkaT; rkmessage: ptr RdKafkaMessageT;
                          async: cint): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_commit_message", dynlib: rdkafkadll.}
proc rdKafkaCommitQueue*(rk: ptr RdKafkaT; offsets: ptr RdKafkaTopicPartitionListT;
                        rkqu: ptr RdKafkaQueueT; cb: proc (rk: ptr RdKafkaT;
    err: RdKafkaRespErrT; offsets: ptr RdKafkaTopicPartitionListT;
    commitOpaque: pointer) {.cdecl.}; commitOpaque: pointer): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_commit_queue", dynlib: rdkafkadll.}
proc rdKafkaCommitted*(rk: ptr RdKafkaT; partitions: ptr RdKafkaTopicPartitionListT;
                      timeoutMs: cint): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_committed", dynlib: rdkafkadll.}
proc rdKafkaPosition*(rk: ptr RdKafkaT; partitions: ptr RdKafkaTopicPartitionListT): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_position", dynlib: rdkafkadll.}
proc rdKafkaConsumerGroupMetadata*(rk: ptr RdKafkaT): ptr RdKafkaConsumerGroupMetadataT {.
    cdecl, importc: "rd_kafka_consumer_group_metadata", dynlib: rdkafkadll.}
proc rdKafkaConsumerGroupMetadataNew*(groupId: cstring): ptr RdKafkaConsumerGroupMetadataT {.
    cdecl, importc: "rd_kafka_consumer_group_metadata_new", dynlib: rdkafkadll.}
proc rdKafkaConsumerGroupMetadataNewWithGenid*(groupId: cstring;
    generationId: int32T; memberId: cstring; groupInstanceId: cstring): ptr RdKafkaConsumerGroupMetadataT {.
    cdecl, importc: "rd_kafka_consumer_group_metadata_new_with_genid",
    dynlib: rdkafkadll.}
proc rdKafkaConsumerGroupMetadataDestroy*(a1: ptr RdKafkaConsumerGroupMetadataT) {.
    cdecl, importc: "rd_kafka_consumer_group_metadata_destroy", dynlib: rdkafkadll.}
proc rdKafkaConsumerGroupMetadataWrite*(cgmd: ptr RdKafkaConsumerGroupMetadataT;
                                       bufferp: ptr pointer; sizep: ptr csize_t): ptr RdKafkaErrorT {.
    cdecl, importc: "rd_kafka_consumer_group_metadata_write", dynlib: rdkafkadll.}
proc rdKafkaConsumerGroupMetadataRead*(cgmdp: ptr ptr RdKafkaConsumerGroupMetadataT;
                                      buffer: pointer; size: csize_t): ptr RdKafkaErrorT {.
    cdecl, importc: "rd_kafka_consumer_group_metadata_read", dynlib: rdkafkadll.}
proc rdKafkaProduce*(rkt: ptr RdKafkaTopicT; partition: int32T; msgflags: cint;
                    payload: pointer; len: csize_t; key: pointer; keylen: csize_t;
                    msgOpaque: pointer): cint {.cdecl, importc: "rd_kafka_produce",
    dynlib: rdkafkadll.}
proc rdKafkaProducev*(rk: ptr RdKafkaT): RdKafkaRespErrT {.varargs, cdecl,
    importc: "rd_kafka_producev", dynlib: rdkafkadll.}
proc rdKafkaProduceva*(rk: ptr RdKafkaT; vus: ptr RdKafkaVuT; cnt: csize_t): ptr RdKafkaErrorT {.
    cdecl, importc: "rd_kafka_produceva", dynlib: rdkafkadll.}
proc rdKafkaProduceBatch*(rkt: ptr RdKafkaTopicT; partition: int32T; msgflags: cint;
                         rkmessages: ptr RdKafkaMessageT; messageCnt: cint): cint {.
    cdecl, importc: "rd_kafka_produce_batch", dynlib: rdkafkadll.}
proc rdKafkaFlush*(rk: ptr RdKafkaT; timeoutMs: cint): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_flush", dynlib: rdkafkadll.}
proc rdKafkaPurge*(rk: ptr RdKafkaT; purgeFlags: cint): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_purge", dynlib: rdkafkadll.}
type
  RdKafkaMetadataBrokerT* {.bycopy.} = object
    id*: int32T
    host*: cstring
    port*: cint

  RdKafkaMetadataPartitionT* {.bycopy.} = object
    id*: int32T
    err*: RdKafkaRespErrT
    leader*: int32T
    replicaCnt*: cint
    replicas*: ptr int32T
    isrCnt*: cint
    isrs*: ptr int32T

  RdKafkaMetadataTopicT* {.bycopy.} = object
    topic*: cstring
    partitionCnt*: cint
    partitions*: ptr RdKafkaMetadataPartition
    err*: RdKafkaRespErrT

  RdKafkaMetadataT* {.bycopy.} = object
    brokerCnt*: cint
    brokers*: ptr RdKafkaMetadataBroker
    topicCnt*: cint
    topics*: ptr RdKafkaMetadataTopic
    origBrokerId*: int32T
    origBrokerName*: cstring


proc rdKafkaMetadata*(rk: ptr RdKafkaT; allTopics: cint; onlyRkt: ptr RdKafkaTopicT;
                     metadatap: ptr ptr RdKafkaMetadata; timeoutMs: cint): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_metadata", dynlib: rdkafkadll.}
proc rdKafkaMetadataDestroy*(metadata: ptr RdKafkaMetadata) {.cdecl,
    importc: "rd_kafka_metadata_destroy", dynlib: rdkafkadll.}
type
  RdKafkaGroupMemberInfo* {.bycopy.} = object
    memberId*: cstring
    clientId*: cstring
    clientHost*: cstring
    memberMetadata*: pointer
    memberMetadataSize*: cint
    memberAssignment*: pointer
    memberAssignmentSize*: cint

  RdKafkaGroupInfo* {.bycopy.} = object
    broker*: RdKafkaMetadataBroker
    group*: cstring
    err*: RdKafkaRespErrT
    state*: cstring
    protocolType*: cstring
    protocol*: cstring
    members*: ptr RdKafkaGroupMemberInfo
    memberCnt*: cint

  RdKafkaGroupList* {.bycopy.} = object
    groups*: ptr RdKafkaGroupInfo
    groupCnt*: cint


proc rdKafkaListGroups*(rk: ptr RdKafkaT; group: cstring;
                       grplistp: ptr ptr RdKafkaGroupList; timeoutMs: cint): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_list_groups", dynlib: rdkafkadll.}
proc rdKafkaGroupListDestroy*(grplist: ptr RdKafkaGroupList) {.cdecl,
    importc: "rd_kafka_group_list_destroy", dynlib: rdkafkadll.}
proc rdKafkaBrokersAdd*(rk: ptr RdKafkaT; brokerlist: cstring): cint {.cdecl,
    importc: "rd_kafka_brokers_add", dynlib: rdkafkadll.}
attribute((deprecated))
proc rdKafkaSetLogger*(rk: ptr RdKafkaT; `func`: proc (rk: ptr RdKafkaT; level: cint;
    fac: cstring; buf: cstring) {.cdecl.}) {.cdecl, importc: "rd_kafka_set_logger",
                                        dynlib: rdkafkadll.}
proc rdKafkaSetLogLevel*(rk: ptr RdKafkaT; level: cint) {.cdecl,
    importc: "rd_kafka_set_log_level", dynlib: rdkafkadll.}
proc rdKafkaLogPrint*(rk: ptr RdKafkaT; level: cint; fac: cstring; buf: cstring) {.cdecl,
    importc: "rd_kafka_log_print", dynlib: rdkafkadll.}
proc rdKafkaLogSyslog*(rk: ptr RdKafkaT; level: cint; fac: cstring; buf: cstring) {.cdecl,
    importc: "rd_kafka_log_syslog", dynlib: rdkafkadll.}
proc rdKafkaOutqLen*(rk: ptr RdKafkaT): cint {.cdecl, importc: "rd_kafka_outq_len",
    dynlib: rdkafkadll.}
proc rdKafkaDump*(fp: ptr File; rk: ptr RdKafkaT) {.cdecl, importc: "rd_kafka_dump",
    dynlib: rdkafkadll.}
proc rdKafkaThreadCnt*(): cint {.cdecl, importc: "rd_kafka_thread_cnt",
                              dynlib: rdkafkadll.}
type
  RdKafkaThreadTypeT* {.size: sizeof(cint).} = enum
    RD_KAFKA_THREAD_MAIN, RD_KAFKA_THREAD_BACKGROUND, RD_KAFKA_THREAD_BROKER


proc rdKafkaWaitDestroyed*(timeoutMs: cint): cint {.cdecl,
    importc: "rd_kafka_wait_destroyed", dynlib: rdkafkadll.}
proc rdKafkaUnittest*(): cint {.cdecl, importc: "rd_kafka_unittest",
                             dynlib: rdkafkadll.}
proc rdKafkaPollSetConsumer*(rk: ptr RdKafkaT): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_poll_set_consumer", dynlib: rdkafkadll.}
type
  RdKafkaEventTypeT* = cint

proc rdKafkaEventType*(rkev: ptr RdKafkaEventT): RdKafkaEventTypeT {.cdecl,
    importc: "rd_kafka_event_type", dynlib: rdkafkadll.}
proc rdKafkaEventName*(rkev: ptr RdKafkaEventT): cstring {.cdecl,
    importc: "rd_kafka_event_name", dynlib: rdkafkadll.}
proc rdKafkaEventDestroy*(rkev: ptr RdKafkaEventT) {.cdecl,
    importc: "rd_kafka_event_destroy", dynlib: rdkafkadll.}
proc rdKafkaEventMessageNext*(rkev: ptr RdKafkaEventT): ptr RdKafkaMessageT {.cdecl,
    importc: "rd_kafka_event_message_next", dynlib: rdkafkadll.}
proc rdKafkaEventMessageArray*(rkev: ptr RdKafkaEventT;
                              rkmessages: ptr ptr RdKafkaMessageT; size: csize_t): csize_t {.
    cdecl, importc: "rd_kafka_event_message_array", dynlib: rdkafkadll.}
proc rdKafkaEventMessageCount*(rkev: ptr RdKafkaEventT): csize_t {.cdecl,
    importc: "rd_kafka_event_message_count", dynlib: rdkafkadll.}
proc rdKafkaEventConfigString*(rkev: ptr RdKafkaEventT): cstring {.cdecl,
    importc: "rd_kafka_event_config_string", dynlib: rdkafkadll.}
proc rdKafkaEventError*(rkev: ptr RdKafkaEventT): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_event_error", dynlib: rdkafkadll.}
proc rdKafkaEventErrorString*(rkev: ptr RdKafkaEventT): cstring {.cdecl,
    importc: "rd_kafka_event_error_string", dynlib: rdkafkadll.}
proc rdKafkaEventErrorIsFatal*(rkev: ptr RdKafkaEventT): cint {.cdecl,
    importc: "rd_kafka_event_error_is_fatal", dynlib: rdkafkadll.}
proc rdKafkaEventOpaque*(rkev: ptr RdKafkaEventT): pointer {.cdecl,
    importc: "rd_kafka_event_opaque", dynlib: rdkafkadll.}
proc rdKafkaEventLog*(rkev: ptr RdKafkaEventT; fac: cstringArray; str: cstringArray;
                     level: ptr cint): cint {.cdecl, importc: "rd_kafka_event_log",
    dynlib: rdkafkadll.}
proc rdKafkaEventDebugContexts*(rkev: ptr RdKafkaEventT; dst: cstring;
                               dstsize: csize_t): cint {.cdecl,
    importc: "rd_kafka_event_debug_contexts", dynlib: rdkafkadll.}
proc rdKafkaEventStats*(rkev: ptr RdKafkaEventT): cstring {.cdecl,
    importc: "rd_kafka_event_stats", dynlib: rdkafkadll.}
proc rdKafkaEventTopicPartitionList*(rkev: ptr RdKafkaEventT): ptr RdKafkaTopicPartitionListT {.
    cdecl, importc: "rd_kafka_event_topic_partition_list", dynlib: rdkafkadll.}
proc rdKafkaEventTopicPartition*(rkev: ptr RdKafkaEventT): ptr RdKafkaTopicPartitionT {.
    cdecl, importc: "rd_kafka_event_topic_partition", dynlib: rdkafkadll.}
type
  RdKafkaCreateTopicsResultT* = RdKafkaEventT
  RdKafkaDeleteTopicsResultT* = RdKafkaEventT
  RdKafkaCreatePartitionsResultT* = RdKafkaEventT
  RdKafkaAlterConfigsResultT* = RdKafkaEventT
  RdKafkaDescribeConfigsResultT* = RdKafkaEventT
  RdKafkaDeleteRecordsResultT* = RdKafkaEventT
  RdKafkaDeleteGroupsResultT* = RdKafkaEventT
  RdKafkaDeleteConsumerGroupOffsetsResultT* = RdKafkaEventT

proc rdKafkaEventCreateTopicsResult*(rkev: ptr RdKafkaEventT): ptr RdKafkaCreateTopicsResultT {.
    cdecl, importc: "rd_kafka_event_CreateTopics_result", dynlib: rdkafkadll.}
proc rdKafkaEventDeleteTopicsResult*(rkev: ptr RdKafkaEventT): ptr RdKafkaDeleteTopicsResultT {.
    cdecl, importc: "rd_kafka_event_DeleteTopics_result", dynlib: rdkafkadll.}
proc rdKafkaEventCreatePartitionsResult*(rkev: ptr RdKafkaEventT): ptr RdKafkaCreatePartitionsResultT {.
    cdecl, importc: "rd_kafka_event_CreatePartitions_result", dynlib: rdkafkadll.}
proc rdKafkaEventAlterConfigsResult*(rkev: ptr RdKafkaEventT): ptr RdKafkaAlterConfigsResultT {.
    cdecl, importc: "rd_kafka_event_AlterConfigs_result", dynlib: rdkafkadll.}
proc rdKafkaEventDescribeConfigsResult*(rkev: ptr RdKafkaEventT): ptr RdKafkaDescribeConfigsResultT {.
    cdecl, importc: "rd_kafka_event_DescribeConfigs_result", dynlib: rdkafkadll.}
proc rdKafkaEventDeleteRecordsResult*(rkev: ptr RdKafkaEventT): ptr RdKafkaDeleteRecordsResultT {.
    cdecl, importc: "rd_kafka_event_DeleteRecords_result", dynlib: rdkafkadll.}
proc rdKafkaEventDeleteGroupsResult*(rkev: ptr RdKafkaEventT): ptr RdKafkaDeleteGroupsResultT {.
    cdecl, importc: "rd_kafka_event_DeleteGroups_result", dynlib: rdkafkadll.}
proc rdKafkaEventDeleteConsumerGroupOffsetsResult*(rkev: ptr RdKafkaEventT): ptr RdKafkaDeleteConsumerGroupOffsetsResultT {.
    cdecl, importc: "rd_kafka_event_DeleteConsumerGroupOffsets_result",
    dynlib: rdkafkadll.}
proc rdKafkaQueuePoll*(rkqu: ptr RdKafkaQueueT; timeoutMs: cint): ptr RdKafkaEventT {.
    cdecl, importc: "rd_kafka_queue_poll", dynlib: rdkafkadll.}
proc rdKafkaQueuePollCallback*(rkqu: ptr RdKafkaQueueT; timeoutMs: cint): cint {.cdecl,
    importc: "rd_kafka_queue_poll_callback", dynlib: rdkafkadll.}
type
  RdKafkaPluginFConfInitT* = proc (conf: ptr RdKafkaConfT; plugOpaquep: ptr pointer;
                                errstr: cstring; errstrSize: csize_t): RdKafkaRespErrT {.
      cdecl.}
  RdKafkaInterceptorFOnConfSetT* = proc (conf: ptr RdKafkaConfT; name: cstring;
                                      val: cstring; errstr: cstring;
                                      errstrSize: csize_t; icOpaque: pointer): RdKafkaConfResT {.
      cdecl.}
  RdKafkaInterceptorFOnConfDupT* = proc (newConf: ptr RdKafkaConfT;
                                      oldConf: ptr RdKafkaConfT;
                                      filterCnt: csize_t; filter: cstringArray;
                                      icOpaque: pointer): RdKafkaRespErrT {.cdecl.}
  RdKafkaInterceptorFOnConfDestroyT* = proc (icOpaque: pointer): RdKafkaRespErrT {.
      cdecl.}
  RdKafkaInterceptorFOnNewT* = proc (rk: ptr RdKafkaT; conf: ptr RdKafkaConfT;
                                  icOpaque: pointer; errstr: cstring;
                                  errstrSize: csize_t): RdKafkaRespErrT {.cdecl.}
  RdKafkaInterceptorFOnDestroyT* = proc (rk: ptr RdKafkaT; icOpaque: pointer): RdKafkaRespErrT {.
      cdecl.}
  RdKafkaInterceptorFOnSendT* = proc (rk: ptr RdKafkaT;
                                   rkmessage: ptr RdKafkaMessageT;
                                   icOpaque: pointer): RdKafkaRespErrT {.cdecl.}
  RdKafkaInterceptorFOnAcknowledgementT* = proc (rk: ptr RdKafkaT;
      rkmessage: ptr RdKafkaMessageT; icOpaque: pointer): RdKafkaRespErrT {.cdecl.}
  RdKafkaInterceptorFOnConsumeT* = proc (rk: ptr RdKafkaT;
                                      rkmessage: ptr RdKafkaMessageT;
                                      icOpaque: pointer): RdKafkaRespErrT {.cdecl.}
  RdKafkaInterceptorFOnCommitT* = proc (rk: ptr RdKafkaT;
                                     offsets: ptr RdKafkaTopicPartitionListT;
                                     err: RdKafkaRespErrT; icOpaque: pointer): RdKafkaRespErrT {.
      cdecl.}
  RdKafkaInterceptorFOnRequestSentT* = proc (rk: ptr RdKafkaT; sockfd: cint;
      brokername: cstring; brokerid: int32T; apiKey: int16T; apiVersion: int16T;
      corrId: int32T; size: csize_t; icOpaque: pointer): RdKafkaRespErrT {.cdecl.}
  RdKafkaInterceptorFOnResponseReceivedT* = proc (rk: ptr RdKafkaT; sockfd: cint;
      brokername: cstring; brokerid: int32T; apiKey: int16T; apiVersion: int16T;
      corrId: int32T; size: csize_t; rtt: int64T; err: RdKafkaRespErrT;
      icOpaque: pointer): RdKafkaRespErrT {.cdecl.}
  RdKafkaInterceptorFOnThreadStartT* = proc (rk: ptr RdKafkaT;
      threadType: RdKafkaThreadTypeT; threadName: cstring; icOpaque: pointer): RdKafkaRespErrT {.
      cdecl.}
  RdKafkaInterceptorFOnThreadExitT* = proc (rk: ptr RdKafkaT;
      threadType: RdKafkaThreadTypeT; threadName: cstring; icOpaque: pointer): RdKafkaRespErrT {.
      cdecl.}

proc rdKafkaConfInterceptorAddOnConfSet*(conf: ptr RdKafkaConfT; icName: cstring;
    onConfSet: ptr RdKafkaInterceptorFOnConfSetT; icOpaque: pointer): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_conf_interceptor_add_on_conf_set", dynlib: rdkafkadll.}
proc rdKafkaConfInterceptorAddOnConfDup*(conf: ptr RdKafkaConfT; icName: cstring;
    onConfDup: ptr RdKafkaInterceptorFOnConfDupT; icOpaque: pointer): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_conf_interceptor_add_on_conf_dup", dynlib: rdkafkadll.}
proc rdKafkaConfInterceptorAddOnConfDestroy*(conf: ptr RdKafkaConfT;
    icName: cstring; onConfDestroy: ptr RdKafkaInterceptorFOnConfDestroyT;
    icOpaque: pointer): RdKafkaRespErrT {.cdecl, importc: "rd_kafka_conf_interceptor_add_on_conf_destroy",
                                       dynlib: rdkafkadll.}
proc rdKafkaConfInterceptorAddOnNew*(conf: ptr RdKafkaConfT; icName: cstring;
                                    onNew: ptr RdKafkaInterceptorFOnNewT;
                                    icOpaque: pointer): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_conf_interceptor_add_on_new", dynlib: rdkafkadll.}
proc rdKafkaInterceptorAddOnDestroy*(rk: ptr RdKafkaT; icName: cstring; onDestroy: ptr RdKafkaInterceptorFOnDestroyT;
                                    icOpaque: pointer): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_interceptor_add_on_destroy", dynlib: rdkafkadll.}
proc rdKafkaInterceptorAddOnSend*(rk: ptr RdKafkaT; icName: cstring;
                                 onSend: ptr RdKafkaInterceptorFOnSendT;
                                 icOpaque: pointer): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_interceptor_add_on_send", dynlib: rdkafkadll.}
proc rdKafkaInterceptorAddOnAcknowledgement*(rk: ptr RdKafkaT; icName: cstring;
    onAcknowledgement: ptr RdKafkaInterceptorFOnAcknowledgementT; icOpaque: pointer): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_interceptor_add_on_acknowledgement",
    dynlib: rdkafkadll.}
proc rdKafkaInterceptorAddOnConsume*(rk: ptr RdKafkaT; icName: cstring; onConsume: ptr RdKafkaInterceptorFOnConsumeT;
                                    icOpaque: pointer): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_interceptor_add_on_consume", dynlib: rdkafkadll.}
proc rdKafkaInterceptorAddOnCommit*(rk: ptr RdKafkaT; icName: cstring;
                                   onCommit: ptr RdKafkaInterceptorFOnCommitT;
                                   icOpaque: pointer): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_interceptor_add_on_commit", dynlib: rdkafkadll.}
proc rdKafkaInterceptorAddOnRequestSent*(rk: ptr RdKafkaT; icName: cstring;
    onRequestSent: ptr RdKafkaInterceptorFOnRequestSentT; icOpaque: pointer): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_interceptor_add_on_request_sent", dynlib: rdkafkadll.}
proc rdKafkaInterceptorAddOnResponseReceived*(rk: ptr RdKafkaT; icName: cstring;
    onResponseReceived: ptr RdKafkaInterceptorFOnResponseReceivedT;
    icOpaque: pointer): RdKafkaRespErrT {.cdecl, importc: "rd_kafka_interceptor_add_on_response_received",
                                       dynlib: rdkafkadll.}
proc rdKafkaInterceptorAddOnThreadStart*(rk: ptr RdKafkaT; icName: cstring;
    onThreadStart: ptr RdKafkaInterceptorFOnThreadStartT; icOpaque: pointer): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_interceptor_add_on_thread_start", dynlib: rdkafkadll.}
proc rdKafkaInterceptorAddOnThreadExit*(rk: ptr RdKafkaT; icName: cstring;
    onThreadExit: ptr RdKafkaInterceptorFOnThreadExitT; icOpaque: pointer): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_interceptor_add_on_thread_exit", dynlib: rdkafkadll.}
proc rdKafkaTopicResultError*(topicres: ptr RdKafkaTopicResultT): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_topic_result_error", dynlib: rdkafkadll.}
proc rdKafkaTopicResultErrorString*(topicres: ptr RdKafkaTopicResultT): cstring {.
    cdecl, importc: "rd_kafka_topic_result_error_string", dynlib: rdkafkadll.}
proc rdKafkaTopicResultName*(topicres: ptr RdKafkaTopicResultT): cstring {.cdecl,
    importc: "rd_kafka_topic_result_name", dynlib: rdkafkadll.}
proc rdKafkaGroupResultError*(groupres: ptr RdKafkaGroupResultT): ptr RdKafkaErrorT {.
    cdecl, importc: "rd_kafka_group_result_error", dynlib: rdkafkadll.}
proc rdKafkaGroupResultName*(groupres: ptr RdKafkaGroupResultT): cstring {.cdecl,
    importc: "rd_kafka_group_result_name", dynlib: rdkafkadll.}
proc rdKafkaGroupResultPartitions*(groupres: ptr RdKafkaGroupResultT): ptr RdKafkaTopicPartitionListT {.
    cdecl, importc: "rd_kafka_group_result_partitions", dynlib: rdkafkadll.}
type
  RdKafkaAdminOpT* {.size: sizeof(cint).} = enum
    RD_KAFKA_ADMIN_OP_ANY = 0, RD_KAFKA_ADMIN_OP_CREATETOPICS,
    RD_KAFKA_ADMIN_OP_DELETETOPICS, RD_KAFKA_ADMIN_OP_CREATEPARTITIONS,
    RD_KAFKA_ADMIN_OP_ALTERCONFIGS, RD_KAFKA_ADMIN_OP_DESCRIBECONFIGS,
    RD_KAFKA_ADMIN_OP_DELETERECORDS, RD_KAFKA_ADMIN_OP_DELETEGROUPS,
    RD_KAFKA_ADMIN_OP_DELETECONSUMERGROUPOFFSETS, RD_KAFKA_ADMIN_OP__CNT


type
  RdKafkaAdminOptionsT* = rdKafkaAdminOptionsS

proc rdKafkaAdminOptionsNew*(rk: ptr RdKafkaT; forApi: RdKafkaAdminOpT): ptr RdKafkaAdminOptionsT {.
    cdecl, importc: "rd_kafka_AdminOptions_new", dynlib: rdkafkadll.}
proc rdKafkaAdminOptionsDestroy*(options: ptr RdKafkaAdminOptionsT) {.cdecl,
    importc: "rd_kafka_AdminOptions_destroy", dynlib: rdkafkadll.}
proc rdKafkaAdminOptionsSetRequestTimeout*(options: ptr RdKafkaAdminOptionsT;
    timeoutMs: cint; errstr: cstring; errstrSize: csize_t): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_AdminOptions_set_request_timeout", dynlib: rdkafkadll.}
proc rdKafkaAdminOptionsSetOperationTimeout*(options: ptr RdKafkaAdminOptionsT;
    timeoutMs: cint; errstr: cstring; errstrSize: csize_t): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_AdminOptions_set_operation_timeout", dynlib: rdkafkadll.}
proc rdKafkaAdminOptionsSetValidateOnly*(options: ptr RdKafkaAdminOptionsT;
                                        trueOrFalse: cint; errstr: cstring;
                                        errstrSize: csize_t): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_AdminOptions_set_validate_only", dynlib: rdkafkadll.}
proc rdKafkaAdminOptionsSetBroker*(options: ptr RdKafkaAdminOptionsT;
                                  brokerId: int32T; errstr: cstring;
                                  errstrSize: csize_t): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_AdminOptions_set_broker", dynlib: rdkafkadll.}
proc rdKafkaAdminOptionsSetOpaque*(options: ptr RdKafkaAdminOptionsT;
                                  evOpaque: pointer) {.cdecl,
    importc: "rd_kafka_AdminOptions_set_opaque", dynlib: rdkafkadll.}
type
  RdKafkaNewTopicT* = rdKafkaNewTopicS

proc rdKafkaNewTopicNew*(topic: cstring; numPartitions: cint;
                        replicationFactor: cint; errstr: cstring;
                        errstrSize: csize_t): ptr RdKafkaNewTopicT {.cdecl,
    importc: "rd_kafka_NewTopic_new", dynlib: rdkafkadll.}
proc rdKafkaNewTopicDestroy*(newTopic: ptr RdKafkaNewTopicT) {.cdecl,
    importc: "rd_kafka_NewTopic_destroy", dynlib: rdkafkadll.}
proc rdKafkaNewTopicDestroyArray*(newTopics: ptr ptr RdKafkaNewTopicT;
                                 newTopicCnt: csize_t) {.cdecl,
    importc: "rd_kafka_NewTopic_destroy_array", dynlib: rdkafkadll.}
proc rdKafkaNewTopicSetReplicaAssignment*(newTopic: ptr RdKafkaNewTopicT;
    partition: int32T; brokerIds: ptr int32T; brokerIdCnt: csize_t; errstr: cstring;
    errstrSize: csize_t): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_NewTopic_set_replica_assignment", dynlib: rdkafkadll.}
proc rdKafkaNewTopicSetConfig*(newTopic: ptr RdKafkaNewTopicT; name: cstring;
                              value: cstring): RdKafkaRespErrT {.cdecl,
    importc: "rd_kafka_NewTopic_set_config", dynlib: rdkafkadll.}
proc rdKafkaCreateTopics*(rk: ptr RdKafkaT; newTopics: ptr ptr RdKafkaNewTopicT;
                         newTopicCnt: csize_t; options: ptr RdKafkaAdminOptionsT;
                         rkqu: ptr RdKafkaQueueT) {.cdecl,
    importc: "rd_kafka_CreateTopics", dynlib: rdkafkadll.}
proc rdKafkaCreateTopicsResultTopics*(result: ptr RdKafkaCreateTopicsResultT;
                                     cntp: ptr csize_t): ptr ptr RdKafkaTopicResultT {.
    cdecl, importc: "rd_kafka_CreateTopics_result_topics", dynlib: rdkafkadll.}
type
  RdKafkaDeleteTopicT* = rdKafkaDeleteTopicS

proc rdKafkaDeleteTopicNew*(topic: cstring): ptr RdKafkaDeleteTopicT {.cdecl,
    importc: "rd_kafka_DeleteTopic_new", dynlib: rdkafkadll.}
proc rdKafkaDeleteTopicDestroy*(delTopic: ptr RdKafkaDeleteTopicT) {.cdecl,
    importc: "rd_kafka_DeleteTopic_destroy", dynlib: rdkafkadll.}
proc rdKafkaDeleteTopicDestroyArray*(delTopics: ptr ptr RdKafkaDeleteTopicT;
                                    delTopicCnt: csize_t) {.cdecl,
    importc: "rd_kafka_DeleteTopic_destroy_array", dynlib: rdkafkadll.}
proc rdKafkaDeleteTopics*(rk: ptr RdKafkaT; delTopics: ptr ptr RdKafkaDeleteTopicT;
                         delTopicCnt: csize_t; options: ptr RdKafkaAdminOptionsT;
                         rkqu: ptr RdKafkaQueueT) {.cdecl,
    importc: "rd_kafka_DeleteTopics", dynlib: rdkafkadll.}
proc rdKafkaDeleteTopicsResultTopics*(result: ptr RdKafkaDeleteTopicsResultT;
                                     cntp: ptr csize_t): ptr ptr RdKafkaTopicResultT {.
    cdecl, importc: "rd_kafka_DeleteTopics_result_topics", dynlib: rdkafkadll.}
type
  RdKafkaNewPartitionsT* = rdKafkaNewPartitionsS

proc rdKafkaNewPartitionsNew*(topic: cstring; newTotalCnt: csize_t; errstr: cstring;
                             errstrSize: csize_t): ptr RdKafkaNewPartitionsT {.
    cdecl, importc: "rd_kafka_NewPartitions_new", dynlib: rdkafkadll.}
proc rdKafkaNewPartitionsDestroy*(newParts: ptr RdKafkaNewPartitionsT) {.cdecl,
    importc: "rd_kafka_NewPartitions_destroy", dynlib: rdkafkadll.}
proc rdKafkaNewPartitionsDestroyArray*(newParts: ptr ptr RdKafkaNewPartitionsT;
                                      newPartsCnt: csize_t) {.cdecl,
    importc: "rd_kafka_NewPartitions_destroy_array", dynlib: rdkafkadll.}
proc rdKafkaNewPartitionsSetReplicaAssignment*(
    newParts: ptr RdKafkaNewPartitionsT; newPartitionIdx: int32T;
    brokerIds: ptr int32T; brokerIdCnt: csize_t; errstr: cstring; errstrSize: csize_t): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_NewPartitions_set_replica_assignment",
    dynlib: rdkafkadll.}
proc rdKafkaCreatePartitions*(rk: ptr RdKafkaT;
                             newParts: ptr ptr RdKafkaNewPartitionsT;
                             newPartsCnt: csize_t;
                             options: ptr RdKafkaAdminOptionsT;
                             rkqu: ptr RdKafkaQueueT) {.cdecl,
    importc: "rd_kafka_CreatePartitions", dynlib: rdkafkadll.}
proc rdKafkaCreatePartitionsResultTopics*(
    result: ptr RdKafkaCreatePartitionsResultT; cntp: ptr csize_t): ptr ptr RdKafkaTopicResultT {.
    cdecl, importc: "rd_kafka_CreatePartitions_result_topics", dynlib: rdkafkadll.}
type
  RdKafkaConfigSourceT* {.size: sizeof(cint).} = enum
    RD_KAFKA_CONFIG_SOURCE_UNKNOWN_CONFIG = 0,
    RD_KAFKA_CONFIG_SOURCE_DYNAMIC_TOPIC_CONFIG = 1,
    RD_KAFKA_CONFIG_SOURCE_DYNAMIC_BROKER_CONFIG = 2,
    RD_KAFKA_CONFIG_SOURCE_DYNAMIC_DEFAULT_BROKER_CONFIG = 3,
    RD_KAFKA_CONFIG_SOURCE_STATIC_BROKER_CONFIG = 4,
    RD_KAFKA_CONFIG_SOURCE_DEFAULT_CONFIG = 5, RD_KAFKA_CONFIG_SOURCE__CNT


proc rdKafkaConfigSourceName*(confsource: RdKafkaConfigSourceT): cstring {.cdecl,
    importc: "rd_kafka_ConfigSource_name", dynlib: rdkafkadll.}
type
  RdKafkaConfigEntryT* = rdKafkaConfigEntryS

proc rdKafkaConfigEntryName*(entry: ptr RdKafkaConfigEntryT): cstring {.cdecl,
    importc: "rd_kafka_ConfigEntry_name", dynlib: rdkafkadll.}
proc rdKafkaConfigEntryValue*(entry: ptr RdKafkaConfigEntryT): cstring {.cdecl,
    importc: "rd_kafka_ConfigEntry_value", dynlib: rdkafkadll.}
proc rdKafkaConfigEntrySource*(entry: ptr RdKafkaConfigEntryT): RdKafkaConfigSourceT {.
    cdecl, importc: "rd_kafka_ConfigEntry_source", dynlib: rdkafkadll.}
proc rdKafkaConfigEntryIsReadOnly*(entry: ptr RdKafkaConfigEntryT): cint {.cdecl,
    importc: "rd_kafka_ConfigEntry_is_read_only", dynlib: rdkafkadll.}
proc rdKafkaConfigEntryIsDefault*(entry: ptr RdKafkaConfigEntryT): cint {.cdecl,
    importc: "rd_kafka_ConfigEntry_is_default", dynlib: rdkafkadll.}
proc rdKafkaConfigEntryIsSensitive*(entry: ptr RdKafkaConfigEntryT): cint {.cdecl,
    importc: "rd_kafka_ConfigEntry_is_sensitive", dynlib: rdkafkadll.}
proc rdKafkaConfigEntryIsSynonym*(entry: ptr RdKafkaConfigEntryT): cint {.cdecl,
    importc: "rd_kafka_ConfigEntry_is_synonym", dynlib: rdkafkadll.}
proc rdKafkaConfigEntrySynonyms*(entry: ptr RdKafkaConfigEntryT; cntp: ptr csize_t): ptr ptr RdKafkaConfigEntryT {.
    cdecl, importc: "rd_kafka_ConfigEntry_synonyms", dynlib: rdkafkadll.}
type
  RdKafkaResourceTypeT* {.size: sizeof(cint).} = enum
    RD_KAFKA_RESOURCE_UNKNOWN = 0, RD_KAFKA_RESOURCE_ANY = 1,
    RD_KAFKA_RESOURCE_TOPIC = 2, RD_KAFKA_RESOURCE_GROUP = 3,
    RD_KAFKA_RESOURCE_BROKER = 4, RD_KAFKA_RESOURCE__CNT


proc rdKafkaResourceTypeName*(restype: RdKafkaResourceTypeT): cstring {.cdecl,
    importc: "rd_kafka_ResourceType_name", dynlib: rdkafkadll.}
type
  RdKafkaConfigResourceT* = rdKafkaConfigResourceS

proc rdKafkaConfigResourceNew*(restype: RdKafkaResourceTypeT; resname: cstring): ptr RdKafkaConfigResourceT {.
    cdecl, importc: "rd_kafka_ConfigResource_new", dynlib: rdkafkadll.}
proc rdKafkaConfigResourceDestroy*(config: ptr RdKafkaConfigResourceT) {.cdecl,
    importc: "rd_kafka_ConfigResource_destroy", dynlib: rdkafkadll.}
proc rdKafkaConfigResourceDestroyArray*(config: ptr ptr RdKafkaConfigResourceT;
                                       configCnt: csize_t) {.cdecl,
    importc: "rd_kafka_ConfigResource_destroy_array", dynlib: rdkafkadll.}
proc rdKafkaConfigResourceSetConfig*(config: ptr RdKafkaConfigResourceT;
                                    name: cstring; value: cstring): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_ConfigResource_set_config", dynlib: rdkafkadll.}
proc rdKafkaConfigResourceConfigs*(config: ptr RdKafkaConfigResourceT;
                                  cntp: ptr csize_t): ptr ptr RdKafkaConfigEntryT {.
    cdecl, importc: "rd_kafka_ConfigResource_configs", dynlib: rdkafkadll.}
proc rdKafkaConfigResourceType*(config: ptr RdKafkaConfigResourceT): RdKafkaResourceTypeT {.
    cdecl, importc: "rd_kafka_ConfigResource_type", dynlib: rdkafkadll.}
proc rdKafkaConfigResourceName*(config: ptr RdKafkaConfigResourceT): cstring {.cdecl,
    importc: "rd_kafka_ConfigResource_name", dynlib: rdkafkadll.}
proc rdKafkaConfigResourceError*(config: ptr RdKafkaConfigResourceT): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_ConfigResource_error", dynlib: rdkafkadll.}
proc rdKafkaConfigResourceErrorString*(config: ptr RdKafkaConfigResourceT): cstring {.
    cdecl, importc: "rd_kafka_ConfigResource_error_string", dynlib: rdkafkadll.}
proc rdKafkaAlterConfigs*(rk: ptr RdKafkaT; configs: ptr ptr RdKafkaConfigResourceT;
                         configCnt: csize_t; options: ptr RdKafkaAdminOptionsT;
                         rkqu: ptr RdKafkaQueueT) {.cdecl,
    importc: "rd_kafka_AlterConfigs", dynlib: rdkafkadll.}
proc rdKafkaAlterConfigsResultResources*(result: ptr RdKafkaAlterConfigsResultT;
                                        cntp: ptr csize_t): ptr ptr RdKafkaConfigResourceT {.
    cdecl, importc: "rd_kafka_AlterConfigs_result_resources", dynlib: rdkafkadll.}
proc rdKafkaDescribeConfigs*(rk: ptr RdKafkaT;
                            configs: ptr ptr RdKafkaConfigResourceT;
                            configCnt: csize_t; options: ptr RdKafkaAdminOptionsT;
                            rkqu: ptr RdKafkaQueueT) {.cdecl,
    importc: "rd_kafka_DescribeConfigs", dynlib: rdkafkadll.}
proc rdKafkaDescribeConfigsResultResources*(
    result: ptr RdKafkaDescribeConfigsResultT; cntp: ptr csize_t): ptr ptr RdKafkaConfigResourceT {.
    cdecl, importc: "rd_kafka_DescribeConfigs_result_resources", dynlib: rdkafkadll.}
type
  RdKafkaDeleteRecordsT* = rdKafkaDeleteRecordsS

proc rdKafkaDeleteRecordsNew*(beforeOffsets: ptr RdKafkaTopicPartitionListT): ptr RdKafkaDeleteRecordsT {.
    cdecl, importc: "rd_kafka_DeleteRecords_new", dynlib: rdkafkadll.}
proc rdKafkaDeleteRecordsDestroy*(delRecords: ptr RdKafkaDeleteRecordsT) {.cdecl,
    importc: "rd_kafka_DeleteRecords_destroy", dynlib: rdkafkadll.}
proc rdKafkaDeleteRecordsDestroyArray*(delRecords: ptr ptr RdKafkaDeleteRecordsT;
                                      delRecordCnt: csize_t) {.cdecl,
    importc: "rd_kafka_DeleteRecords_destroy_array", dynlib: rdkafkadll.}
proc rdKafkaDeleteRecords*(rk: ptr RdKafkaT;
                          delRecords: ptr ptr RdKafkaDeleteRecordsT;
                          delRecordCnt: csize_t;
                          options: ptr RdKafkaAdminOptionsT;
                          rkqu: ptr RdKafkaQueueT) {.cdecl,
    importc: "rd_kafka_DeleteRecords", dynlib: rdkafkadll.}
proc rdKafkaDeleteRecordsResultOffsets*(result: ptr RdKafkaDeleteRecordsResultT): ptr RdKafkaTopicPartitionListT {.
    cdecl, importc: "rd_kafka_DeleteRecords_result_offsets", dynlib: rdkafkadll.}
type
  RdKafkaDeleteGroupT* = rdKafkaDeleteGroupS

proc rdKafkaDeleteGroupNew*(group: cstring): ptr RdKafkaDeleteGroupT {.cdecl,
    importc: "rd_kafka_DeleteGroup_new", dynlib: rdkafkadll.}
proc rdKafkaDeleteGroupDestroy*(delGroup: ptr RdKafkaDeleteGroupT) {.cdecl,
    importc: "rd_kafka_DeleteGroup_destroy", dynlib: rdkafkadll.}
proc rdKafkaDeleteGroupDestroyArray*(delGroups: ptr ptr RdKafkaDeleteGroupT;
                                    delGroupCnt: csize_t) {.cdecl,
    importc: "rd_kafka_DeleteGroup_destroy_array", dynlib: rdkafkadll.}
proc rdKafkaDeleteGroups*(rk: ptr RdKafkaT; delGroups: ptr ptr RdKafkaDeleteGroupT;
                         delGroupCnt: csize_t; options: ptr RdKafkaAdminOptionsT;
                         rkqu: ptr RdKafkaQueueT) {.cdecl,
    importc: "rd_kafka_DeleteGroups", dynlib: rdkafkadll.}
proc rdKafkaDeleteGroupsResultGroups*(result: ptr RdKafkaDeleteGroupsResultT;
                                     cntp: ptr csize_t): ptr ptr RdKafkaGroupResultT {.
    cdecl, importc: "rd_kafka_DeleteGroups_result_groups", dynlib: rdkafkadll.}
type
  RdKafkaDeleteConsumerGroupOffsetsT* = rdKafkaDeleteConsumerGroupOffsetsS

proc rdKafkaDeleteConsumerGroupOffsetsNew*(group: cstring;
    partitions: ptr RdKafkaTopicPartitionListT): ptr RdKafkaDeleteConsumerGroupOffsetsT {.
    cdecl, importc: "rd_kafka_DeleteConsumerGroupOffsets_new", dynlib: rdkafkadll.}
proc rdKafkaDeleteConsumerGroupOffsetsDestroy*(
    delGrpoffsets: ptr RdKafkaDeleteConsumerGroupOffsetsT) {.cdecl,
    importc: "rd_kafka_DeleteConsumerGroupOffsets_destroy", dynlib: rdkafkadll.}
proc rdKafkaDeleteConsumerGroupOffsetsDestroyArray*(
    delGrpoffsets: ptr ptr RdKafkaDeleteConsumerGroupOffsetsT;
    delGrpoffsetCnt: csize_t) {.cdecl, importc: "rd_kafka_DeleteConsumerGroupOffsets_destroy_array",
                              dynlib: rdkafkadll.}
proc rdKafkaDeleteConsumerGroupOffsets*(rk: ptr RdKafkaT; delGrpoffsets: ptr ptr RdKafkaDeleteConsumerGroupOffsetsT;
                                       delGrpoffsetsCnt: csize_t;
                                       options: ptr RdKafkaAdminOptionsT;
                                       rkqu: ptr RdKafkaQueueT) {.cdecl,
    importc: "rd_kafka_DeleteConsumerGroupOffsets", dynlib: rdkafkadll.}
proc rdKafkaDeleteConsumerGroupOffsetsResultGroups*(
    result: ptr RdKafkaDeleteConsumerGroupOffsetsResultT; cntp: ptr csize_t): ptr ptr RdKafkaGroupResultT {.
    cdecl, importc: "rd_kafka_DeleteConsumerGroupOffsets_result_groups",
    dynlib: rdkafkadll.}
proc rdKafkaOauthbearerSetToken*(rk: ptr RdKafkaT; tokenValue: cstring;
                                mdLifetimeMs: int64T; mdPrincipalName: cstring;
                                extensions: cstringArray; extensionSize: csize_t;
                                errstr: cstring; errstrSize: csize_t): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_oauthbearer_set_token", dynlib: rdkafkadll.}
proc rdKafkaOauthbearerSetTokenFailure*(rk: ptr RdKafkaT; errstr: cstring): RdKafkaRespErrT {.
    cdecl, importc: "rd_kafka_oauthbearer_set_token_failure", dynlib: rdkafkadll.}
proc rdKafkaInitTransactions*(rk: ptr RdKafkaT; timeoutMs: cint): ptr RdKafkaErrorT {.
    cdecl, importc: "rd_kafka_init_transactions", dynlib: rdkafkadll.}
proc rdKafkaBeginTransaction*(rk: ptr RdKafkaT): ptr RdKafkaErrorT {.cdecl,
    importc: "rd_kafka_begin_transaction", dynlib: rdkafkadll.}
proc rdKafkaSendOffsetsToTransaction*(rk: ptr RdKafkaT;
                                     offsets: ptr RdKafkaTopicPartitionListT;
    cgmetadata: ptr RdKafkaConsumerGroupMetadataT; timeoutMs: cint): ptr RdKafkaErrorT {.
    cdecl, importc: "rd_kafka_send_offsets_to_transaction", dynlib: rdkafkadll.}
proc rdKafkaCommitTransaction*(rk: ptr RdKafkaT; timeoutMs: cint): ptr RdKafkaErrorT {.
    cdecl, importc: "rd_kafka_commit_transaction", dynlib: rdkafkadll.}
proc rdKafkaAbortTransaction*(rk: ptr RdKafkaT; timeoutMs: cint): ptr RdKafkaErrorT {.
    cdecl, importc: "rd_kafka_abort_transaction", dynlib: rdkafkadll.}