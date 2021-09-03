@[Link("pcre")]
lib LibPCRE
  MAJOR = 8
  MINOR = 39
  CASELESS = 1
  MULTILINE = 2
  DOTALL = 4
  EXTENDED = 8
  ANCHORED = 16
  DOLLAR_ENDONLY = 32
  EXTRA = 64
  NOTBOL = 128
  NOTEOL = 256
  UNGREEDY = 512
  NOTEMPTY = 1024
  UTF8 = 2048
  UTF16 = 2048
  UTF32 = 2048
  NO_AUTO_CAPTURE = 4096
  NO_UTF8_CHECK = 8192
  NO_UTF16_CHECK = 8192
  NO_UTF32_CHECK = 8192
  AUTO_CALLOUT = 16384
  PARTIAL_SOFT = 32768
  PARTIAL = 32768
  NEVER_UTF = 65536
  DFA_SHORTEST = 65536
  NO_AUTO_POSSESS = 131072
  DFA_RESTART = 131072
  FIRSTLINE = 262144
  DUPNAMES = 524288
  NEWLINE_CR = 1048576
  NEWLINE_LF = 2097152
  NEWLINE_CRLF = 3145728
  NEWLINE_ANY = 4194304
  NEWLINE_ANYCRLF = 5242880
  BSR_ANYCRLF = 8388608
  BSR_UNICODE = 16777216
  JAVASCRIPT_COMPAT = 33554432
  NO_START_OPTIMIZE = 67108864
  NO_START_OPTIMISE = 67108864
  PARTIAL_HARD = 134217728
  NOTEMPTY_ATSTART = 268435456
  UCP = 536870912
  UTF8_ERR0 = 0
  UTF8_ERR1 = 1
  UTF8_ERR2 = 2
  UTF8_ERR3 = 3
  UTF8_ERR4 = 4
  UTF8_ERR5 = 5
  UTF8_ERR6 = 6
  UTF8_ERR7 = 7
  UTF8_ERR8 = 8
  UTF8_ERR9 = 9
  UTF8_ERR10 = 10
  UTF8_ERR11 = 11
  UTF8_ERR12 = 12
  UTF8_ERR13 = 13
  UTF8_ERR14 = 14
  UTF8_ERR15 = 15
  UTF8_ERR16 = 16
  UTF8_ERR17 = 17
  UTF8_ERR18 = 18
  UTF8_ERR19 = 19
  UTF8_ERR20 = 20
  UTF8_ERR21 = 21
  UTF8_ERR22 = 22
  UTF16_ERR0 = 0
  UTF16_ERR1 = 1
  UTF16_ERR2 = 2
  UTF16_ERR3 = 3
  UTF16_ERR4 = 4
  UTF32_ERR0 = 0
  UTF32_ERR1 = 1
  UTF32_ERR2 = 2
  UTF32_ERR3 = 3
  INFO_OPTIONS = 0
  INFO_SIZE = 1
  INFO_CAPTURECOUNT = 2
  INFO_BACKREFMAX = 3
  INFO_FIRSTBYTE = 4
  INFO_FIRSTCHAR = 4
  INFO_FIRSTTABLE = 5
  INFO_LASTLITERAL = 6
  INFO_NAMEENTRYSIZE = 7
  INFO_NAMECOUNT = 8
  INFO_NAMETABLE = 9
  INFO_STUDYSIZE = 10
  INFO_DEFAULT_TABLES = 11
  INFO_OKPARTIAL = 12
  INFO_JCHANGED = 13
  INFO_HASCRORLF = 14
  INFO_MINLENGTH = 15
  INFO_JIT = 16
  INFO_JITSIZE = 17
  INFO_MAXLOOKBEHIND = 18
  INFO_FIRSTCHARACTER = 19
  INFO_FIRSTCHARACTERFLAGS = 20
  INFO_REQUIREDCHAR = 21
  INFO_REQUIREDCHARFLAGS = 22
  INFO_MATCHLIMIT = 23
  INFO_RECURSIONLIMIT = 24
  INFO_MATCH_EMPTY = 25
  CONFIG_UTF8 = 0
  CONFIG_NEWLINE = 1
  CONFIG_LINK_SIZE = 2
  CONFIG_POSIX_MALLOC_THRESHOLD = 3
  CONFIG_MATCH_LIMIT = 4
  CONFIG_STACKRECURSE = 5
  CONFIG_UNICODE_PROPERTIES = 6
  CONFIG_MATCH_LIMIT_RECURSION = 7
  CONFIG_BSR = 8
  CONFIG_JIT = 9
  CONFIG_UTF16 = 10
  CONFIG_JITTARGET = 11
  CONFIG_UTF32 = 12
  CONFIG_PARENS_LIMIT = 13
  STUDY_JIT_COMPILE = 1
  STUDY_JIT_PARTIAL_SOFT_COMPILE = 2
  STUDY_JIT_PARTIAL_HARD_COMPILE = 4
  STUDY_EXTRA_NEEDED = 8
  EXTRA_STUDY_DATA = 1
  EXTRA_MATCH_LIMIT = 2
  EXTRA_CALLOUT_DATA = 4
  EXTRA_TABLES = 8
  EXTRA_MATCH_LIMIT_RECURSION = 16
  EXTRA_MARK = 32
  EXTRA_EXECUTABLE_JIT = 64
  struct Extra
    flags : LibC::ULong
    study_data : Void*
    match_limit : LibC::ULong
    callout_data : Void*
    tables : UInt8*
    match_limit_recursion : LibC::ULong
    mark : UInt8**
    executable_jit : Void*
  end
  struct CalloutBlock
    version : LibC::Int
    callout_number : LibC::Int
    offset_vector : LibC::Int*
    subject : LibC::Char*
    subject_length : LibC::Int
    start_match : LibC::Int
    current_position : LibC::Int
    capture_top : LibC::Int
    capture_last : LibC::Int
    callout_data : Void*
    pattern_position : LibC::Int
    next_item_length : LibC::Int
    mark : UInt8*
  end
  fun compile = pcre_compile(x0 : LibC::Char*, x1 : LibC::Int, x2 : LibC::Char**, x3 : LibC::Int*, x4 : UInt8*) : Pcre
  type Pcre = Void*
  fun compile2 = pcre_compile2(x0 : LibC::Char*, x1 : LibC::Int, x2 : LibC::Int*, x3 : LibC::Char**, x4 : LibC::Int*, x5 : UInt8*) : Pcre
  fun config = pcre_config(x0 : LibC::Int, x1 : Void*) : LibC::Int
  fun copy_named_substring = pcre_copy_named_substring(x0 : Pcre, x1 : LibC::Char*, x2 : LibC::Int*, x3 : LibC::Int, x4 : LibC::Char*, x5 : LibC::Char*, x6 : LibC::Int) : LibC::Int
  fun copy_substring = pcre_copy_substring(x0 : LibC::Char*, x1 : LibC::Int*, x2 : LibC::Int, x3 : LibC::Int, x4 : LibC::Char*, x5 : LibC::Int) : LibC::Int
  fun dfa_exec = pcre_dfa_exec(x0 : Pcre, x1 : Extra*, x2 : LibC::Char*, x3 : LibC::Int, x4 : LibC::Int, x5 : LibC::Int, x6 : LibC::Int*, x7 : LibC::Int, x8 : LibC::Int*, x9 : LibC::Int) : LibC::Int
  fun exec = pcre_exec(x0 : Pcre, x1 : Extra*, x2 : LibC::Char*, x3 : LibC::Int, x4 : LibC::Int, x5 : LibC::Int, x6 : LibC::Int*, x7 : LibC::Int) : LibC::Int
  fun jit_exec = pcre_jit_exec(x0 : Pcre, x1 : Extra*, x2 : LibC::Char*, x3 : LibC::Int, x4 : LibC::Int, x5 : LibC::Int, x6 : LibC::Int*, x7 : LibC::Int, x8 : JitStack) : LibC::Int
  type JitStack = Void*
  fun free_substring = pcre_free_substring(x0 : LibC::Char*)
  fun free_substring_list = pcre_free_substring_list(x0 : LibC::Char**)
  fun fullinfo = pcre_fullinfo(x0 : Pcre, x1 : Extra*, x2 : LibC::Int, x3 : Void*) : LibC::Int
  fun get_named_substring = pcre_get_named_substring(x0 : Pcre, x1 : LibC::Char*, x2 : LibC::Int*, x3 : LibC::Int, x4 : LibC::Char*, x5 : LibC::Char**) : LibC::Int
  fun get_stringnumber = pcre_get_stringnumber(x0 : Pcre, x1 : LibC::Char*) : LibC::Int
  fun get_stringtable_entries = pcre_get_stringtable_entries(x0 : Pcre, x1 : LibC::Char*, x2 : LibC::Char**, x3 : LibC::Char**) : LibC::Int
  fun get_substring = pcre_get_substring(x0 : LibC::Char*, x1 : LibC::Int*, x2 : LibC::Int, x3 : LibC::Int, x4 : LibC::Char**) : LibC::Int
  fun get_substring_list = pcre_get_substring_list(x0 : LibC::Char*, x1 : LibC::Int*, x2 : LibC::Int, x3 : LibC::Char***) : LibC::Int
  fun maketables = pcre_maketables : UInt8*
  fun refcount = pcre_refcount(x0 : Pcre, x1 : LibC::Int) : LibC::Int
  fun study = pcre_study(x0 : Pcre, x1 : LibC::Int, x2 : LibC::Char**) : Extra*
  fun free_study = pcre_free_study(x0 : Extra*)
  fun version = pcre_version : LibC::Char*
  fun pattern_to_host_byte_order = pcre_pattern_to_host_byte_order(x0 : Pcre, x1 : Extra*, x2 : UInt8*) : LibC::Int
  fun jit_stack_alloc = pcre_jit_stack_alloc(x0 : LibC::Int, x1 : LibC::Int) : JitStack
  fun jit_stack_free = pcre_jit_stack_free(x0 : JitStack)
  fun assign_jit_stack = pcre_assign_jit_stack(x0 : Extra*, x1 : JitCallback, x2 : Void*)
  alias JitCallback = (Void* -> JitStack)
  fun jit_free_unused_memory = pcre_jit_free_unused_memory
  $malloc : (LibC::SizeT -> Void*)
  $free : (Void* -> Void)
  $stack_malloc : (LibC::SizeT -> Void*)
  $stack_free : (Void* -> Void)
  $callout : (CalloutBlock* -> LibC::Int)
  $stack_guard : ( -> LibC::Int)
end
