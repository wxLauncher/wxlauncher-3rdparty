cmake_minimum_required(VERSION 2.8)
if(CMAKE_MAJOR_VERSION GREATER 2)
  # Continue to support compatiable interface for _DEBUG on targets
  # see: http://www.cmake.org/cmake/help/v3.0/policy/CMP0043.html
  cmake_policy(SET CMP0043 OLD)
endif()

add_custom_target(nmake_build ALL
	COMMAND nmake -f makefile.vc UNICODE=1 BUILD=$<LOWER_CASE:$<CONFIG>>
	WORKING_DIRECTORY msw)
