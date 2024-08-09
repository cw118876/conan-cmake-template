
set(target exec)

add_executable(${target}
  {{project}}.cpp
)


install(
  TARGETS ${target}
  DESTINATION bin/
)