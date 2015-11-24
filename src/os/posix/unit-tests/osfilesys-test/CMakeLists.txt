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

set(CMAKE_CXX_FLAGS "-g -O0 -Wall -W -Wshadow -Wunused-variable 
	-Wunused-parameter -Wunused-function -Wunused -Wno-system-headers 
	-Wno-deprecated -Woverloaded-virtual -Wwrite-strings -fprofile-arcs 
	-ftest-coverage -m32")
set(CMAKE_C_FLAGS "-g -O0 -Wall -W -fprofile-arcs -ftest-coverage -m32")

# Add the executables
add_executable(OSAL-FileSys-UT 
		${CMAKE_CURRENT_SOURCE_DIR}/ut_osfilesys_diskio_test.c
		${CMAKE_CURRENT_SOURCE_DIR}/ut_osfilesys_diskio_test.c
		${CMAKE_CURRENT_SOURCE_DIR}/ut_osfilesys_test.c
		${CMAKE_CURRENT_SOURCE_DIR}/../../osfilesys.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_os_stubs.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_oscore_stubs.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_osfile_stubs.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_osloader_stubs.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_osnetwork_stubs.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_ostimer_stubs.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_psp_voltab_stubs.c)
target_link_libraries(OSAL-FileSys-UT -fprofile-arcs ${CMAKE_THREAD_LIBS_INIT} gcov)
add_test(osal-filesys ${EXECUTABLE_OUTPUT_PATH}/OSAL-FileSys-UT)

add_definitions(-fprofile-arcs -ftest-coverage)
