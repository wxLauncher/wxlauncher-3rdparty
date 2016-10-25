cmake_minimum_required(VERSION 2.8)
if(CMAKE_MAJOR_VERSION GREATER 2)
  # Continue to support compatiable interface for _DEBUG on targets
  # see: http://www.cmake.org/cmake/help/v3.0/policy/CMP0043.html
  cmake_policy(SET CMP0043 OLD)
endif()

include(../../cmake/wxl_platforms.cmake)

if(IS_WIN32)
	add_custom_target(nmake_build ALL
		COMMAND nmake -f makefile.vc
		UNICODE=1 BUILD=$<LOWER_CASE:$<CONFIG>>
		WORKING_DIRECTORY msw)
elseif(IS_APPLE)
	add_custom_target(xcode_build ALL
		COMMAND sh ../configure --enable-cxx11 --enable-cxx11
		--disable-mediactrl --enable-unicode --enable-debug
		--disable-shared --with-macosx-version-min=10.9
		CC=clang CXX=clang++ CXXFLAGS="-stdlib=libc++ -std=c++11"
		OBJCXXFLAGS="-stdlib=libc++ -std=c++11" LDFLAGS=-stdlib=libc++
		COMMAND make
		)
endif()
