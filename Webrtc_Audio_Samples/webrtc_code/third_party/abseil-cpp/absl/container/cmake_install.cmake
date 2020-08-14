# Install script for directory: D:/open/webrtc/test_audio/Webrtc_Audio_Samples/Webrtc_Audio_Samples/Webrtc_Audio_Samples/webrtc_code/third_party/abseil-cpp/absl/container

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files (x86)/absl")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/open/webrtc/test_audio/Webrtc_Audio_Samples/Webrtc_Audio_Samples/Webrtc_Audio_Samples/webrtc_code/third_party/abseil-cpp/absl/container/Debug/absl_hashtablez_sampler.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/open/webrtc/test_audio/Webrtc_Audio_Samples/Webrtc_Audio_Samples/Webrtc_Audio_Samples/webrtc_code/third_party/abseil-cpp/absl/container/Release/absl_hashtablez_sampler.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/open/webrtc/test_audio/Webrtc_Audio_Samples/Webrtc_Audio_Samples/Webrtc_Audio_Samples/webrtc_code/third_party/abseil-cpp/absl/container/MinSizeRel/absl_hashtablez_sampler.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/open/webrtc/test_audio/Webrtc_Audio_Samples/Webrtc_Audio_Samples/Webrtc_Audio_Samples/webrtc_code/third_party/abseil-cpp/absl/container/RelWithDebInfo/absl_hashtablez_sampler.lib")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/open/webrtc/test_audio/Webrtc_Audio_Samples/Webrtc_Audio_Samples/Webrtc_Audio_Samples/webrtc_code/third_party/abseil-cpp/absl/container/Debug/absl_raw_hash_set.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/open/webrtc/test_audio/Webrtc_Audio_Samples/Webrtc_Audio_Samples/Webrtc_Audio_Samples/webrtc_code/third_party/abseil-cpp/absl/container/Release/absl_raw_hash_set.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/open/webrtc/test_audio/Webrtc_Audio_Samples/Webrtc_Audio_Samples/Webrtc_Audio_Samples/webrtc_code/third_party/abseil-cpp/absl/container/MinSizeRel/absl_raw_hash_set.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "D:/open/webrtc/test_audio/Webrtc_Audio_Samples/Webrtc_Audio_Samples/Webrtc_Audio_Samples/webrtc_code/third_party/abseil-cpp/absl/container/RelWithDebInfo/absl_raw_hash_set.lib")
  endif()
endif()

