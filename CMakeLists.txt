cmake_minimum_required(VERSION 3.0.0)
project(test VERSION 0.1.0)
# add_compile_options("$<$<C_COMPILER_ID:MSVC>:/utf-8>")
# add_compile_options("$<$<CXX_COMPILER_ID:MSVC>:/utf-8>")
set(CMAKE_CXX_STANDARD 20)

set(MYSQL_ROOT_DIR C:/Users/jyf/scoop/apps/mysql/current)

add_executable(${PROJECT_NAME} test.cpp)
target_include_directories(${PROJECT_NAME} PRIVATE ${MYSQL_ROOT_DIR}/include)
target_link_directories(${PROJECT_NAME} PRIVATE ${MYSQL_ROOT_DIR}/lib)
target_link_libraries(${PROJECT_NAME} libmysql)