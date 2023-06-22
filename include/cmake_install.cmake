# Install script for directory: /home/kerlu/workspace/proto_linux/lib/libortp/include

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
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

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/ortp" TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "/home/kerlu/workspace/proto_linux/lib/libortp/include/ortp/b64.h"
    "/home/kerlu/workspace/proto_linux/lib/libortp/include/ortp/event.h"
    "/home/kerlu/workspace/proto_linux/lib/libortp/include/ortp/logging.h"
    "/home/kerlu/workspace/proto_linux/lib/libortp/include/ortp/ortp.h"
    "/home/kerlu/workspace/proto_linux/lib/libortp/include/ortp/payloadtype.h"
    "/home/kerlu/workspace/proto_linux/lib/libortp/include/ortp/port.h"
    "/home/kerlu/workspace/proto_linux/lib/libortp/include/ortp/rtcp.h"
    "/home/kerlu/workspace/proto_linux/lib/libortp/include/ortp/rtp.h"
    "/home/kerlu/workspace/proto_linux/lib/libortp/include/ortp/rtpprofile.h"
    "/home/kerlu/workspace/proto_linux/lib/libortp/include/ortp/rtpsession.h"
    "/home/kerlu/workspace/proto_linux/lib/libortp/include/ortp/rtpsignaltable.h"
    "/home/kerlu/workspace/proto_linux/lib/libortp/include/ortp/sessionset.h"
    "/home/kerlu/workspace/proto_linux/lib/libortp/include/ortp/str_utils.h"
    "/home/kerlu/workspace/proto_linux/lib/libortp/include/ortp/telephonyevents.h"
    )
endif()

