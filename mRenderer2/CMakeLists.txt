cmake_minimum_required(VERSION 3.28)
project(mRenderer2)

set(CMAKE_CXX_STANDARD 17)

#add_executable(mRenderer2 main.cpp)

# Set the build directory (similar to BUILD_DIR in the Makefile)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Compiler options
add_compile_options(-fvisibility=hidden)

# Include directories for the Vulkan SDK
include_directories(/Users/thytran/VulkanSDK/1.3.296.0/macOS/include)
link_directories(/Users/thytran/VulkanSDK/1.3.296.0/macOS/lib)

# Define the library
add_library(engine SHARED
        cLib/Engine.c
)

# Define additional include directories for the library
target_include_directories(engine PRIVATE ./cLib/)

# Link the Vulkan library with our library
target_link_libraries(engine vulkan)

# Application executable
add_executable(${PROJECT_NAME}
        main.cpp
)

# Include directories for the application
target_include_directories(${PROJECT_NAME} PRIVATE
        ./cLib
)

# Link the application with our custom library
target_link_libraries(${PROJECT_NAME} engine)

# Optional: specify a custom command to run the application as a post-build process
add_custom_command(
        TARGET ${PROJECT_NAME} POST_BUILD
        COMMAND ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${PROJECT_NAME}
)