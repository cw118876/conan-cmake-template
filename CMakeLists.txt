cmake_minimum_required(VERSION 3.11)
project({{project}})
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

include_directories(include)

include(cmake/{{project}}CompileFlags.cmake)

add_subdirectory(src)

execute_process(
    COMMAND ${CMAKE_COMMAND} -E create_symlink
        ${CMAKE_BINARY_DIR}/compile_commands.json
        /var/tmp/compile_commands.json
        
)