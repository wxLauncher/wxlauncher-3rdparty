set(GENERATOR "NMake Makefiles")

include(build_deps-functions.cmake)

set(OPENAL "openal-soft-1.17.2")
set(OPENAL_BUILD "${OPENAL}/build")
set(SDL "SDL2-2.0.4")
set(SDL_BUILD "${SDL}/build")
set(WXMSW28 "wxMSW-2.8.12")
set(WXMSW28_BUILD "${WXMSW28}/build")
set(WXWIDGETS31 "wxWidgets-3.1.0")
set(WXWIDGETS31_BUILD "${WXWIDGETS31}/build")

# do the actual build
#include(build_deps-${CMAKE_SYSTEM_NAME}.cmake)

configure_build_dep(OpenAL-Soft ${OPENAL_BUILD} "Release")
configure_build_dep(SDL ${SDL_BUILD} "Release")
configure_build_dep(wxMSW2.8 ${WXMSW28_BUILD} "Release")
configure_build_dep(wxWidgets3.1 ${WXWIDGETS31_BUILD} "Release")


