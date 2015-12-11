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

# Create the directories for the unit tests to mount devices to.
file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/ram0)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/ram1)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/ram2)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/ram3)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/ram4)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/ram5)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/ram6)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/ram7)

# Add the executables
add_executable(OSAL-File-UT 
		${CMAKE_CURRENT_SOURCE_DIR}/ut_osfile_dirio_test.c 
		${CMAKE_CURRENT_SOURCE_DIR}/ut_osfile_fileio_test.c 
		${CMAKE_CURRENT_SOURCE_DIR}/ut_osfile_test.c
		${CMAKE_CURRENT_SOURCE_DIR}/../../osapi.c
		${CMAKE_CURRENT_SOURCE_DIR}/../../osfileapi.c
		${CMAKE_CURRENT_SOURCE_DIR}/../../osfilesys.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_os_stubs.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_osloader_stubs.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_osnetwork_stubs.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_ostimer_stubs.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_psp_voltab_stubs.c)
target_link_libraries(OSAL-File-UT -fprofile-arcs ${CMAKE_THREAD_LIBS_INIT} gcov -lrt)
add_test(osal-file ${EXECUTABLE_OUTPUT_PATH}/OSAL-File-UT)

add_definitions(-fprofile-arcs -ftest-coverage)
