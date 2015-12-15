file(TO_CMAKE_PATH "${CMAKE_SOURCE_DIR}/memcheck.supp"  MEMORYCHECK_SUPPRESSIONS_FILE)
set(VALGRIND_COMMAND_OPTIONS "-q --tool=memcheck --gen-suppressions=all --leak-check=yes --workaround-gcc296-bugs=yes --num-callers=50 --trace-children=yes --leak-check=full --track-origins=yes --gen-suppressions=all")
set(MEMORYCHECK_COMMAND_OPTIONS "-q --tool=memcheck --leak-check=yes --workaround-gcc296-bugs=yes --num-callers=50 --trace-children=yes --leak-check=full --track-origins=yes --gen-suppressions=all")
