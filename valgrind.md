# Run program with valgrind
valgrind ./executable
# Check for memory leaks (basic)
valgrind --leak-check=full ./executable
# Track origin of uninitialized values
valgrind --track-origins=yes ./executable
# Save valgrind output to a file
valgrind --leak-check=full --log-file=valgrind.log ./executable
# Increase verbosity (print more info)
valgrind -v ./executable
# Suppress specific known warnings (use suppression file)
valgrind --suppressions=my.supp ./executable
# Check only memory leaks (skip expensive checks)
valgrind --leak-check=full --tool=memcheck ./executable
# Use different valgrind tool (example: callgrind for profiling CPU)
valgrind --tool=callgrind ./executable
# Check for stack/global memory issues (experimental)
valgrind --tool=exp-sgcheck ./executable
# Typical full command for C++ apps (memory leaks + origins)
valgrind --leak-check=full --track-origins=yes --show-leak-kinds=all ./executable
# Example basic
valgrind ./MyProgram
# Example full leak-check
valgrind --leak-check=full --track-origins=yes ./MyProgram
# Example save output
valgrind --leak-check=full --log-file=valgrind_output.txt ./MyProgram
