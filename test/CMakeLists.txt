set(project_test_sources
    test_main.cpp
    unit_test/test_{{project}}.cpp
)

add_executable(test.{{project}} ${project_test_sources})


find_package(GTest REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})
target_link_libraries(test.{{project}}
    PUBLIC
    GTest::gtest
    GTest::gmock
)
