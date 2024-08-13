
set(target {{project}})

add_executable(${target}
  {{project}}.cpp
)


install(
  TARGETS ${target}
  DESTINATION bin/
)