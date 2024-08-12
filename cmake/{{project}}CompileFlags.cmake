add_definitions(-DCMAKE_VERBOSE_MAKEFILE=ON)
set(CMAKE_C_FLAGS "-O2 -Wall -Wformat -Wformat=2 -Wconversion -Wimplicit-fallthrough\
    -Werror=format-security \
    -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3 \
    -D_GLIBCXX_ASSERTIONS \
    -fstack-clash-protection -fstack-protector-strong \
    -fdiagnostics-color=always"
)
set(CMAKE_CXX_FLAGS "-O2 -Wall -Wformat -Wformat=2 -Wconversion -Wimplicit-fallthrough\
    -Werror=format-security \
    -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3 \
    -D_GLIBCXX_ASSERTIONS \
    -fstack-clash-protection -fstack-protector-strong \
    -fdiagnostics-color=always"
)


if (CMAKE_BUILD_TYPE MATCHES "Debug")
    message("Enter Debug build mode")
    set(CMAKE_C_FLAGS "-g ${CMAKE_C_FLAGS}")
    set(CMAKE_CXX_FLAGS "-fno-inline -g ${CMAKE_CXX_FLAGS}")
endif()


set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)