cmake_minimum_required(VERSION 3.20)
project(proj)
set(CMAKE_CXX_STANDARD 20)
enable_language(OBJCXX)


add_executable(theme_notifier src/main.cpp src/theme.mm inc/AppDelegate.h)

target_compile_options(theme_notifier PUBLIC "-fobjc-arc")

target_include_directories(theme_notifier PRIVATE inc)

target_link_libraries(theme_notifier
  "-framework Cocoa"
)
