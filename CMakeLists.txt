cmake_minimum_required(VERSION 3.20)
project(proj)
set(CMAKE_CXX_STANDARD 20)
enable_language(OBJCXX)


add_executable(proj src/main.cpp src/theme.mm inc/AppDelegate.h)

target_include_directories(proj PRIVATE inc)

target_link_libraries(proj
  "-framework Cocoa"
)
