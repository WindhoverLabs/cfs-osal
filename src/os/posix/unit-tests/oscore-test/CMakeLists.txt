include(CTest)
find_program( MEMORYCHECK_COMMAND valgrind )
find_package(Threads)
set( MEMORYCHECK_COMMAND_OPTIONS "--trace-children=yes --leak-check=full" )

# Set include directories
include_directories(
	${CMAKE_CURRENT_SOURCE_DIR}
	${CFE_INC_DIRS}
	${OSAL_INC_DIRS}
	${CMAKE_CURRENT_SOURCE_DIR}
	${CMAKE_CURRENT_SOURCE_DIR}/../shared)

add_definitions(-DCFE_LINUX)
set(CMAKE_EXE_LINKER_FLAGS "-lpthread")

# Add the executables
add_executable(OSAL-Core-UT 
		${CMAKE_CURRENT_SOURCE_DIR}/ut_oscore_binsem_test.c 
		${CMAKE_CURRENT_SOURCE_DIR}/ut_oscore_binsem_test.c 
		${CMAKE_CURRENT_SOURCE_DIR}/ut_oscore_countsem_test.c
		${CMAKE_CURRENT_SOURCE_DIR}/ut_oscore_misc_test.c
		${CMAKE_CURRENT_SOURCE_DIR}/ut_oscore_mutex_test.c
		${CMAKE_CURRENT_SOURCE_DIR}/ut_oscore_queue_test.c
		${CMAKE_CURRENT_SOURCE_DIR}/ut_oscore_task_test.c
		${CMAKE_CURRENT_SOURCE_DIR}/ut_oscore_test.c
		${CMAKE_CURRENT_SOURCE_DIR}/../../osapi.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_os_stubs.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_osfile_stubs.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_osfilesys_stubs.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_osloader_stubs.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_osnetwork_stubs.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_ostimer_stubs.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_psp_voltab_stubs.c)
target_link_libraries(OSAL-Core-UT -fprofile-arcs gcov ${CMAKE_THREAD_LIBS_INIT})
add_test(osal-core ${EXECUTABLE_OUTPUT_PATH}/OSAL-Core-UT)

add_definitions(-fprofile-arcs -ftest-coverage)
