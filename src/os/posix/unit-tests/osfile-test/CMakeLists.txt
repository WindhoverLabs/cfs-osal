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

# Add the executables
add_executable(OSAL-File-UT 
		${CMAKE_CURRENT_SOURCE_DIR}/ut_osfile_dirio_test.c 
		${CMAKE_CURRENT_SOURCE_DIR}/ut_osfile_fileio_test.c 
		${CMAKE_CURRENT_SOURCE_DIR}/ut_osfile_test.c
		${CMAKE_CURRENT_SOURCE_DIR}/../../osapi.c
		${CMAKE_CURRENT_SOURCE_DIR}/../../osfileapi.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_os_stubs.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_osfilesys_stubs.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_osloader_stubs.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_osnetwork_stubs.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_ostimer_stubs.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_psp_voltab_stubs.c)
target_link_libraries(OSAL-File-UT -fprofile-arcs ${CMAKE_THREAD_LIBS_INIT} gcov)
add_test(osal-file ${EXECUTABLE_OUTPUT_PATH}/OSAL-File-UT)

add_definitions(-fprofile-arcs -ftest-coverage)
