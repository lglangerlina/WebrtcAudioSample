# Generated by CMake

if("${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}" LESS 2.5)
   message(FATAL_ERROR "CMake >= 2.6.0 required")
endif()
cmake_policy(PUSH)
cmake_policy(VERSION 2.6...3.17)
#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Protect against multiple inclusion, which would fail when already imported targets are added once more.
set(_targetsDefined)
set(_targetsNotDefined)
set(_expectedTargets)
foreach(_expectedTarget absl::spinlock_wait absl::config absl::dynamic_annotations absl::core_headers absl::malloc_internal absl::base_internal absl::base absl::throw_delegate absl::pretty_function absl::endian absl::bits absl::scoped_set_env absl::algorithm absl::algorithm_container absl::container absl::compressed_tuple absl::fixed_array absl::inlined_vector_internal absl::inlined_vector absl::counting_allocator absl::flat_hash_map absl::flat_hash_set absl::node_hash_map absl::node_hash_set absl::container_memory absl::hash_function_defaults absl::hash_policy_traits absl::hashtablez_sampler absl::hashtable_debug absl::hashtable_debug_hooks absl::have_sse absl::node_hash_policy absl::raw_hash_map absl::container_common absl::raw_hash_set absl::layout absl::stacktrace absl::symbolize absl::examine_stack absl::failure_signal_handler absl::debugging_internal absl::demangle_internal absl::leak_check absl::leak_check_disable absl::debugging absl::flags_internal absl::flags_config absl::flags_marshalling absl::flags_handle absl::flags_registry absl::flags absl::flags_usage absl::flags_parse absl::hash absl::city absl::memory absl::type_traits absl::meta absl::int128 absl::numeric absl::strings absl::strings_internal absl::str_format absl::str_format_internal absl::graphcycles_internal absl::synchronization absl::time absl::civil_time absl::time_zone absl::any absl::bad_any_cast absl::bad_any_cast_impl absl::span absl::optional absl::bad_optional_access absl::bad_variant_access absl::variant absl::compare absl::utility)
  list(APPEND _expectedTargets ${_expectedTarget})
  if(NOT TARGET ${_expectedTarget})
    list(APPEND _targetsNotDefined ${_expectedTarget})
  endif()
  if(TARGET ${_expectedTarget})
    list(APPEND _targetsDefined ${_expectedTarget})
  endif()
endforeach()
if("${_targetsDefined}" STREQUAL "${_expectedTargets}")
  unset(_targetsDefined)
  unset(_targetsNotDefined)
  unset(_expectedTargets)
  set(CMAKE_IMPORT_FILE_VERSION)
  cmake_policy(POP)
  return()
endif()
if(NOT "${_targetsDefined}" STREQUAL "")
  message(FATAL_ERROR "Some (but not all) targets in this export set were already defined.\nTargets Defined: ${_targetsDefined}\nTargets not yet defined: ${_targetsNotDefined}\n")
endif()
unset(_targetsDefined)
unset(_targetsNotDefined)
unset(_expectedTargets)


# Compute the installation prefix relative to this file.
get_filename_component(_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_FILE}" PATH)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
if(_IMPORT_PREFIX STREQUAL "/")
  set(_IMPORT_PREFIX "")
endif()

# Create imported target absl::spinlock_wait
add_library(absl::spinlock_wait STATIC IMPORTED)

set_target_properties(absl::spinlock_wait PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::core_headers;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::config
add_library(absl::config INTERFACE IMPORTED)

set_target_properties(absl::config PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "-ignore:4221"
)

# Create imported target absl::dynamic_annotations
add_library(absl::dynamic_annotations STATIC IMPORTED)

set_target_properties(absl::dynamic_annotations PROPERTIES
  INTERFACE_COMPILE_DEFINITIONS "__CLANG_SUPPORT_DYN_ANNOTATION__"
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::core_headers
add_library(absl::core_headers INTERFACE IMPORTED)

set_target_properties(absl::core_headers PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::config;-ignore:4221"
)

# Create imported target absl::malloc_internal
add_library(absl::malloc_internal STATIC IMPORTED)

set_target_properties(absl::malloc_internal PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::base;absl::config;absl::core_headers;absl::dynamic_annotations;absl::spinlock_wait;Threads::Threads;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::base_internal
add_library(absl::base_internal INTERFACE IMPORTED)

set_target_properties(absl::base_internal PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "-ignore:4221"
)

# Create imported target absl::base
add_library(absl::base STATIC IMPORTED)

set_target_properties(absl::base PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::base_internal;absl::config;absl::core_headers;absl::dynamic_annotations;absl::spinlock_wait;absl::type_traits;Threads::Threads;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::throw_delegate
add_library(absl::throw_delegate STATIC IMPORTED)

set_target_properties(absl::throw_delegate PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::base;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::pretty_function
add_library(absl::pretty_function INTERFACE IMPORTED)

set_target_properties(absl::pretty_function PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "-ignore:4221"
)

# Create imported target absl::endian
add_library(absl::endian INTERFACE IMPORTED)

set_target_properties(absl::endian PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::config;absl::core_headers;-ignore:4221"
)

# Create imported target absl::bits
add_library(absl::bits INTERFACE IMPORTED)

set_target_properties(absl::bits PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::core_headers;-ignore:4221"
)

# Create imported target absl::scoped_set_env
add_library(absl::scoped_set_env STATIC IMPORTED)

set_target_properties(absl::scoped_set_env PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::base;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::algorithm
add_library(absl::algorithm INTERFACE IMPORTED)

set_target_properties(absl::algorithm PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "-ignore:4221"
)

# Create imported target absl::algorithm_container
add_library(absl::algorithm_container INTERFACE IMPORTED)

set_target_properties(absl::algorithm_container PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::algorithm;absl::core_headers;absl::meta;-ignore:4221"
)

# Create imported target absl::container
add_library(absl::container INTERFACE IMPORTED)

set_target_properties(absl::container PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "-ignore:4221"
)

# Create imported target absl::compressed_tuple
add_library(absl::compressed_tuple INTERFACE IMPORTED)

set_target_properties(absl::compressed_tuple PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::utility;-ignore:4221"
)

# Create imported target absl::fixed_array
add_library(absl::fixed_array INTERFACE IMPORTED)

set_target_properties(absl::fixed_array PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::compressed_tuple;absl::algorithm;absl::core_headers;absl::dynamic_annotations;absl::throw_delegate;absl::memory;-ignore:4221"
)

# Create imported target absl::inlined_vector_internal
add_library(absl::inlined_vector_internal INTERFACE IMPORTED)

set_target_properties(absl::inlined_vector_internal PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::compressed_tuple;absl::type_traits;-ignore:4221"
)

# Create imported target absl::inlined_vector
add_library(absl::inlined_vector INTERFACE IMPORTED)

set_target_properties(absl::inlined_vector PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::algorithm;absl::core_headers;absl::inlined_vector_internal;absl::throw_delegate;absl::memory;-ignore:4221"
)

# Create imported target absl::counting_allocator
add_library(absl::counting_allocator INTERFACE IMPORTED)

set_target_properties(absl::counting_allocator PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "-ignore:4221"
)

# Create imported target absl::flat_hash_map
add_library(absl::flat_hash_map INTERFACE IMPORTED)

set_target_properties(absl::flat_hash_map PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::container_memory;absl::hash_function_defaults;absl::raw_hash_map;absl::algorithm_container;absl::memory;-ignore:4221"
)

# Create imported target absl::flat_hash_set
add_library(absl::flat_hash_set INTERFACE IMPORTED)

set_target_properties(absl::flat_hash_set PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::container_memory;absl::hash_function_defaults;absl::raw_hash_set;absl::algorithm_container;absl::core_headers;absl::memory;-ignore:4221"
)

# Create imported target absl::node_hash_map
add_library(absl::node_hash_map INTERFACE IMPORTED)

set_target_properties(absl::node_hash_map PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::container_memory;absl::hash_function_defaults;absl::node_hash_policy;absl::raw_hash_map;absl::algorithm_container;absl::memory;-ignore:4221"
)

# Create imported target absl::node_hash_set
add_library(absl::node_hash_set INTERFACE IMPORTED)

set_target_properties(absl::node_hash_set PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::hash_function_defaults;absl::node_hash_policy;absl::raw_hash_set;absl::algorithm_container;absl::memory;-ignore:4221"
)

# Create imported target absl::container_memory
add_library(absl::container_memory INTERFACE IMPORTED)

set_target_properties(absl::container_memory PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::memory;absl::utility;-ignore:4221"
)

# Create imported target absl::hash_function_defaults
add_library(absl::hash_function_defaults INTERFACE IMPORTED)

set_target_properties(absl::hash_function_defaults PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::config;absl::hash;absl::strings;-ignore:4221"
)

# Create imported target absl::hash_policy_traits
add_library(absl::hash_policy_traits INTERFACE IMPORTED)

set_target_properties(absl::hash_policy_traits PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::meta;-ignore:4221"
)

# Create imported target absl::hashtablez_sampler
add_library(absl::hashtablez_sampler STATIC IMPORTED)

set_target_properties(absl::hashtablez_sampler PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::base;absl::have_sse;absl::synchronization;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::hashtable_debug
add_library(absl::hashtable_debug INTERFACE IMPORTED)

set_target_properties(absl::hashtable_debug PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::hashtable_debug_hooks;-ignore:4221"
)

# Create imported target absl::hashtable_debug_hooks
add_library(absl::hashtable_debug_hooks INTERFACE IMPORTED)

set_target_properties(absl::hashtable_debug_hooks PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "-ignore:4221"
)

# Create imported target absl::have_sse
add_library(absl::have_sse INTERFACE IMPORTED)

set_target_properties(absl::have_sse PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "-ignore:4221"
)

# Create imported target absl::node_hash_policy
add_library(absl::node_hash_policy INTERFACE IMPORTED)

set_target_properties(absl::node_hash_policy PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "-ignore:4221"
)

# Create imported target absl::raw_hash_map
add_library(absl::raw_hash_map INTERFACE IMPORTED)

set_target_properties(absl::raw_hash_map PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::container_memory;absl::raw_hash_set;-ignore:4221"
)

# Create imported target absl::container_common
add_library(absl::container_common INTERFACE IMPORTED)

set_target_properties(absl::container_common PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::type_traits;-ignore:4221"
)

# Create imported target absl::raw_hash_set
add_library(absl::raw_hash_set STATIC IMPORTED)

set_target_properties(absl::raw_hash_set PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::bits;absl::compressed_tuple;absl::config;absl::container_common;absl::container_memory;absl::core_headers;absl::endian;absl::hash_policy_traits;absl::hashtable_debug_hooks;absl::have_sse;absl::layout;absl::memory;absl::meta;absl::optional;absl::utility;absl::hashtablez_sampler;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::layout
add_library(absl::layout INTERFACE IMPORTED)

set_target_properties(absl::layout PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::core_headers;absl::meta;absl::strings;absl::span;absl::utility;-ignore:4221"
)

# Create imported target absl::stacktrace
add_library(absl::stacktrace STATIC IMPORTED)

set_target_properties(absl::stacktrace PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::debugging_internal;absl::base;absl::core_headers;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::symbolize
add_library(absl::symbolize STATIC IMPORTED)

set_target_properties(absl::symbolize PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::debugging_internal;absl::demangle_internal;absl::base;absl::core_headers;absl::malloc_internal;\$<LINK_ONLY:-ignore:4221>;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::examine_stack
add_library(absl::examine_stack STATIC IMPORTED)

set_target_properties(absl::examine_stack PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::stacktrace;absl::symbolize;absl::base;absl::core_headers;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::failure_signal_handler
add_library(absl::failure_signal_handler STATIC IMPORTED)

set_target_properties(absl::failure_signal_handler PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::examine_stack;absl::stacktrace;absl::base;absl::config;absl::core_headers;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::debugging_internal
add_library(absl::debugging_internal STATIC IMPORTED)

set_target_properties(absl::debugging_internal PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::base;absl::core_headers;absl::dynamic_annotations;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::demangle_internal
add_library(absl::demangle_internal STATIC IMPORTED)

set_target_properties(absl::demangle_internal PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::base;absl::core_headers;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::leak_check
add_library(absl::leak_check STATIC IMPORTED)

set_target_properties(absl::leak_check PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::core_headers;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::leak_check_disable
add_library(absl::leak_check_disable STATIC IMPORTED)

set_target_properties(absl::leak_check_disable PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::debugging
add_library(absl::debugging INTERFACE IMPORTED)

set_target_properties(absl::debugging PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::stacktrace;absl::leak_check;-ignore:4221"
)

# Create imported target absl::flags_internal
add_library(absl::flags_internal STATIC IMPORTED)

set_target_properties(absl::flags_internal PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::strings;absl::synchronization;\$<LINK_ONLY:-ignore:4221>;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::flags_config
add_library(absl::flags_config STATIC IMPORTED)

set_target_properties(absl::flags_config PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::flags_internal;absl::core_headers;absl::strings;absl::synchronization;\$<LINK_ONLY:-ignore:4221>;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::flags_marshalling
add_library(absl::flags_marshalling STATIC IMPORTED)

set_target_properties(absl::flags_marshalling PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::core_headers;absl::strings;absl::str_format;\$<LINK_ONLY:-ignore:4221>;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::flags_handle
add_library(absl::flags_handle STATIC IMPORTED)

set_target_properties(absl::flags_handle PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::flags_config;absl::flags_marshalling;absl::base;absl::core_headers;absl::strings;absl::synchronization;absl::optional;\$<LINK_ONLY:-ignore:4221>;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::flags_registry
add_library(absl::flags_registry STATIC IMPORTED)

set_target_properties(absl::flags_registry PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::flags_config;absl::flags_handle;absl::base;absl::core_headers;absl::dynamic_annotations;absl::strings;absl::synchronization;\$<LINK_ONLY:-ignore:4221>;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::flags
add_library(absl::flags STATIC IMPORTED)

set_target_properties(absl::flags PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::flags_config;absl::flags_handle;absl::flags_marshalling;absl::flags_registry;absl::base;absl::core_headers;absl::strings;\$<LINK_ONLY:-ignore:4221>;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::flags_usage
add_library(absl::flags_usage STATIC IMPORTED)

set_target_properties(absl::flags_usage PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::flags_config;absl::flags;absl::flags_handle;absl::flags_internal;absl::strings;absl::synchronization;\$<LINK_ONLY:-ignore:4221>;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::flags_parse
add_library(absl::flags_parse STATIC IMPORTED)

set_target_properties(absl::flags_parse PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::flags_config;absl::flags;absl::flags_handle;absl::flags_internal;absl::flags_registry;absl::flags_usage;absl::strings;absl::synchronization;\$<LINK_ONLY:-ignore:4221>;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::hash
add_library(absl::hash STATIC IMPORTED)

set_target_properties(absl::hash PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::core_headers;absl::endian;absl::fixed_array;absl::meta;absl::int128;absl::strings;absl::optional;absl::variant;absl::utility;absl::city;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::city
add_library(absl::city STATIC IMPORTED)

set_target_properties(absl::city PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::config;absl::core_headers;absl::endian;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::memory
add_library(absl::memory INTERFACE IMPORTED)

set_target_properties(absl::memory PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::core_headers;absl::meta;-ignore:4221"
)

# Create imported target absl::type_traits
add_library(absl::type_traits INTERFACE IMPORTED)

set_target_properties(absl::type_traits PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::config;-ignore:4221"
)

# Create imported target absl::meta
add_library(absl::meta INTERFACE IMPORTED)

set_target_properties(absl::meta PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::type_traits;-ignore:4221"
)

# Create imported target absl::int128
add_library(absl::int128 STATIC IMPORTED)

set_target_properties(absl::int128 PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::config;absl::core_headers;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::numeric
add_library(absl::numeric INTERFACE IMPORTED)

set_target_properties(absl::numeric PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::int128;-ignore:4221"
)

# Create imported target absl::strings
add_library(absl::strings STATIC IMPORTED)

set_target_properties(absl::strings PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::strings_internal;absl::base;absl::bits;absl::config;absl::core_headers;absl::endian;absl::throw_delegate;absl::memory;absl::type_traits;absl::int128;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::strings_internal
add_library(absl::strings_internal STATIC IMPORTED)

set_target_properties(absl::strings_internal PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::core_headers;absl::endian;absl::type_traits;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::str_format
add_library(absl::str_format INTERFACE IMPORTED)

set_target_properties(absl::str_format PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::str_format_internal;-ignore:4221"
)

# Create imported target absl::str_format_internal
add_library(absl::str_format_internal STATIC IMPORTED)

set_target_properties(absl::str_format_internal PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::strings;absl::core_headers;absl::inlined_vector;absl::type_traits;absl::int128;absl::span;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::graphcycles_internal
add_library(absl::graphcycles_internal STATIC IMPORTED)

set_target_properties(absl::graphcycles_internal PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::base;absl::base_internal;absl::core_headers;absl::malloc_internal;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::synchronization
add_library(absl::synchronization STATIC IMPORTED)

set_target_properties(absl::synchronization PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::graphcycles_internal;absl::base;absl::base_internal;absl::config;absl::core_headers;absl::dynamic_annotations;absl::malloc_internal;absl::stacktrace;absl::symbolize;absl::time;Threads::Threads;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::time
add_library(absl::time STATIC IMPORTED)

set_target_properties(absl::time PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::base;absl::core_headers;absl::int128;absl::strings;absl::civil_time;absl::time_zone;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::civil_time
add_library(absl::civil_time STATIC IMPORTED)

set_target_properties(absl::civil_time PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::time_zone
add_library(absl::time_zone STATIC IMPORTED)

set_target_properties(absl::time_zone PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "\$<\$<PLATFORM_ID:Darwin>:>;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::any
add_library(absl::any INTERFACE IMPORTED)

set_target_properties(absl::any PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::bad_any_cast;absl::config;absl::core_headers;absl::type_traits;absl::utility;-ignore:4221"
)

# Create imported target absl::bad_any_cast
add_library(absl::bad_any_cast INTERFACE IMPORTED)

set_target_properties(absl::bad_any_cast PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::bad_any_cast_impl;absl::config;-ignore:4221"
)

# Create imported target absl::bad_any_cast_impl
add_library(absl::bad_any_cast_impl STATIC IMPORTED)

set_target_properties(absl::bad_any_cast_impl PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::base;absl::config;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::span
add_library(absl::span INTERFACE IMPORTED)

set_target_properties(absl::span PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::algorithm;absl::core_headers;absl::throw_delegate;absl::type_traits;-ignore:4221"
)

# Create imported target absl::optional
add_library(absl::optional INTERFACE IMPORTED)

set_target_properties(absl::optional PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::bad_optional_access;absl::base_internal;absl::config;absl::core_headers;absl::memory;absl::type_traits;absl::utility;-ignore:4221"
)

# Create imported target absl::bad_optional_access
add_library(absl::bad_optional_access STATIC IMPORTED)

set_target_properties(absl::bad_optional_access PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::base;absl::config;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::bad_variant_access
add_library(absl::bad_variant_access STATIC IMPORTED)

set_target_properties(absl::bad_variant_access PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::base;absl::config;\$<LINK_ONLY:-ignore:4221>"
)

# Create imported target absl::variant
add_library(absl::variant INTERFACE IMPORTED)

set_target_properties(absl::variant PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::bad_variant_access;absl::base_internal;absl::config;absl::core_headers;absl::type_traits;absl::utility;-ignore:4221"
)

# Create imported target absl::compare
add_library(absl::compare INTERFACE IMPORTED)

set_target_properties(absl::compare PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::core_headers;absl::type_traits;-ignore:4221"
)

# Create imported target absl::utility
add_library(absl::utility INTERFACE IMPORTED)

set_target_properties(absl::utility PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
  INTERFACE_LINK_LIBRARIES "absl::base_internal;absl::config;absl::type_traits;-ignore:4221"
)

if(CMAKE_VERSION VERSION_LESS 3.0.0)
  message(FATAL_ERROR "This file relies on consumers using CMake 3.0.0 or greater.")
endif()

# Load information for each installed configuration.
get_filename_component(_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
file(GLOB CONFIG_FILES "${_DIR}/abslTargets-*.cmake")
foreach(f ${CONFIG_FILES})
  include(${f})
endforeach()

# Cleanup temporary variables.
set(_IMPORT_PREFIX)

# Loop over all imported files and verify that they actually exist
foreach(target ${_IMPORT_CHECK_TARGETS} )
  foreach(file ${_IMPORT_CHECK_FILES_FOR_${target}} )
    if(NOT EXISTS "${file}" )
      message(FATAL_ERROR "The imported target \"${target}\" references the file
   \"${file}\"
but this file does not exist.  Possible reasons include:
* The file was deleted, renamed, or moved to another location.
* An install or uninstall procedure did not complete successfully.
* The installation package was faulty and contained
   \"${CMAKE_CURRENT_LIST_FILE}\"
but not all the files it references.
")
    endif()
  endforeach()
  unset(_IMPORT_CHECK_FILES_FOR_${target})
endforeach()
unset(_IMPORT_CHECK_TARGETS)

# This file does not depend on other imported targets which have
# been exported from the same project but in a separate export set.

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
cmake_policy(POP)
