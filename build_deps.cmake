set(GENERATOR "NMake Makefiles")

set(3RD_PARTY_SOURCE_DIR ${CMAKE_BINARY_DIR})

include(build_deps-functions.cmake)
include(dirs.cmake)

set(OPENAL_BUILD "${3RD_PARTY_OPENAL}/build")
set(SDL_BUILD "${3RD_PARTY_SDL2}/build")
set(WXMSW28_BUILD "${3RD_PARTY_WXMSW28}/build")
set(WXWIDGETS31_BUILD "${3RD_PARTY_WXWIDGETS31}/build")

install_dep(OpenAL-Soft ${OPENAL_BUILD} "Release" ${3RD_PARTY_OPENAL})
install_dep(SDL ${SDL_BUILD} "Release" ${3RD_PARTY_SDL2})
build_dep_only(wxMSW2.8 ${WXMSW28_BUILD} "Release" ${3RD_PARTY_WXMSW28})
build_dep_only(wxWidgets3.1 ${WXWIDGETS31_BUILD} "Release" ${3RD_PARTY_WXMSW28})


