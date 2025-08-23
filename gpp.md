############################
* * * NOTE - C++ Only! * * * 
############################
# Example
    * Compile to C++17
    * Add debugger flag
    * Search for header files in cars/ and tools/ dirs
    * Compile those with the car.cpp file
    * Into a compiled binary called car.o in folder build
    * (Do for every other cpp file)
    * Then link all cpp files together.
g++ -std=c++17 -g -I./cars -I./tools -c src/car.cpp -o build/car.o
g++ -std=c++17 -g -I./cars -I./tools -c src/engine.cpp -o build/engine.o
g++ -std=c++17 -g -I./cars -I./tools -c main.cpp -o build/main.o
g++ -g build/car.o build/engine.o build/main.o -o my_appExecutableName
# Debugger flag
-g
# Compile flag
-c
# Include path of header file folder location
    * NOTE: If you do this, you DO NOT need to have relative paths in your 
    *       #include preprocessor statements. Instead of #include "./folder/header.h"
    *       you just put #include "folder.h", then the -I command resolves the path
    *       conflict
-I./folder
# Which type of C++ to compile
-std=c++11, c++17, etc.
# Compiled output filename (creates in immediate path so if you are in root, it goes to root)
-o engine.o
# Link all files. Order matters. If engine.o uses a function or member defined in car.o, you need to compile car.o first. When linked (combined), the binary then will know where to point to.
g++ car.o engine.o main.o -o my_appExecutableName
# Treat all warnings as errors
g++ -Wall -Wextra -pedantic -Wconversion -Wsign-conversion -Wshadow -Wnull-dereference -Wold-style-cast -Woverloaded-virtual -Wdouble-promotion -Wformat=2 -Wimplicit-fallthrough -Wswitch-enum -Wuninitialized 
# Link library
```
