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

# Create the directories for the unit tests to load the module from.
file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/cf)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/eeprom1)

# Add the executables
add_executable(OSAL-Loader-UT 
		${CMAKE_CURRENT_SOURCE_DIR}/ut_osloader_module_test.c 
		${CMAKE_CURRENT_SOURCE_DIR}/ut_osloader_symtable_test.c
		${CMAKE_CURRENT_SOURCE_DIR}/ut_osloader_test.c
		${CMAKE_CURRENT_SOURCE_DIR}/../../osloader.c
		${CMAKE_CURRENT_SOURCE_DIR}/../../osapi.c
		${CMAKE_CURRENT_SOURCE_DIR}/../../osfilesys.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_os_stubs.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_osfile_stubs.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_osnetwork_stubs.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_ostimer_stubs.c
		${CMAKE_CURRENT_SOURCE_DIR}/../shared/ut_psp_voltab_stubs.c)
target_link_libraries(OSAL-Loader-UT -fprofile-arcs gcov ${CMAKE_THREAD_LIBS_INIT} dl -lrt)
add_test(osal-loader ${EXECUTABLE_OUTPUT_PATH}/OSAL-Loader-UT)
add_definitions(-fprofile-arcs -ftest-coverage)

# Create the test module to be used by the unit tests.
add_app(module SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
set_target_properties(module PROPERTIES 
	LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/cf
    PREFIX "")
add_app(MODULE0 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE1 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE2 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE3 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE4 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE5 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE6 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE7 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE8 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE9 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE10 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE11 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE12 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE13 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE14 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE15 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE16 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE17 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE18 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE19 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE20 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE21 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE22 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE23 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE24 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE25 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE26 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE27 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE28 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE29 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE30 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
add_app(MODULE31 SHARED ${CMAKE_CURRENT_SOURCE_DIR}/ut_module.c)
set_target_properties(
	MODULE0 
	MODULE1 
	MODULE2 
	MODULE3 
	MODULE4 
	MODULE5 
	MODULE6 
	MODULE7 
	MODULE8 
	MODULE9 
	MODULE10 
	MODULE11 
	MODULE12
	MODULE13 
	MODULE14 
	MODULE15 
	MODULE16 
	MODULE17 
	MODULE18 
	MODULE19 
	MODULE20 
	MODULE21 
	MODULE22 
	MODULE23 
	MODULE24 
	MODULE25 
	MODULE26 
	MODULE27 
	MODULE28 
	MODULE29 
	MODULE30 
	MODULE31
	PROPERTIES 
		LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/eeprom1
    	PREFIX "")    
    
