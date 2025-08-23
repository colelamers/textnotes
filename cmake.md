```
The assumption wtih this is that you are located in the build/ folder like
this: 
./App/
 |--src/
 |--main.cpp
 |--CMakeLists.txt
 |--...etc.
 |--build/
```
# NOTE! THE FUNCTIONS ARE A SPECIFIC ORDER! YOU CANNOT HAVE SOME BEFORE OR AFTER OTHERS.

# Build basic app with cmake
cmake ../mathApp

# Enable debugging 
cmake -DCMAKE_BUILD_TYPE=Debug ../mathApp

# CMakeLists.txt Example
* Note, many things in here are "CMAKE" syntax, especially the underscore things or the "lisp"-y function sets.
```cmake
    cmake_minimum_required(VERSION 3.10)

    # Set the project name
    project(tcash)

    # Set the C++ standard
    set(CMAKE_CXX_STANDARD 23)

    # Define the source files, can only do one at a time!
    # set(SOURCES src/*.cpp)

    # Include header files
    #include_directories(${PROJECT_SOURCE_DIR}/include)

    # Gather all source files in src/ + main.cpp
    file(GLOB_RECURSE SRC_FILES src/*.cpp)

    # Add debug ability
    #set(CMAKE_BUILD_TYPE Debug)

    # Set binary directory
    # CMAKE_BINARY_DIR = current dir
    # CMAKE_SOURCE_DIR = root dir of app /
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

    # Create an executable from the source files
    add_executable(tcash ${SRC_FILES})

    # Add the headers directory to the include path
    target_include_directories(tcash PRIVATE ${PROJECT_SOURCE_DIR}/include)

# Args
# SOURCES
# HEADERS
# INCLUDES
# RESOURCES
# SRC_FILES
# ALL_FILES

# Defines a variable
set(NAME value1 value2 ...) Variables, file paths, strings, lists
# Creates an executable target
add_executable(targetName [source1 source2 ...]) 
# Creates a library target
add_library(targetName STATICSHAREDOBJECT [source1 source2 ...]) 
# Adds sources to an existing target
target_sources(targetName PRIVATEPUBLICINTERFACE file1.cpp ...) 
# Adds include paths to a target
target_include_directories(targetName PRIVATEPUBLICINTERFACE dir1 ...) 
# Links libraries to a target
target_link_libraries(targetName PRIVATEPUBLICINTERFACE lib1 ...) 
# File operations (e.g., GLOB, COPY)
file(GLOB varName pattern1 pattern2 ...) file(COPY ...) 
# Adds global include paths (deprecated style)
include_directories(dir1 dir2 ...) 
# Adds directories for library linking
link_directories(dir1 dir2 ...) 
# Adds a subdirectory to the build
add_subdirectory(dir) 
# Declares the project 
project(projectName [LANGUAGES C CXX]) 
# Sets the minimum CMake version
cmake_minimum_required(VERSION 3.10) 
# Finds and loads external packages
find_package(PackageName REQUIREDOPTIONAL)
# Defines a user-toggleable option
option(OPTION_NAME "Description" ONOFF)
# Prints to the console
message(STATUSWARNINGERROR "message") 
# Installs files/targets
install(TARGETSFILESDIRECTORY ...) 
# Copies and modifies a file
configure_file(input output [COPYONLY@ONLY])
# Conditional logic
if(condition) 
# Loops over items
foreach(item IN LISTS listVar) 
# Defines a custom function
function(name args...) 
# Similar to function, less scoped
macro(name args...) 
```
