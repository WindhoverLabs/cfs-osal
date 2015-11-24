# Collect OSAL includes and sources
set(OSAL_SRC 
	${CMAKE_CURRENT_SOURCE_DIR}/osapi.c 
	${CMAKE_CURRENT_SOURCE_DIR}/osfileapi.c 
	${CMAKE_CURRENT_SOURCE_DIR}/osfilesys.c 
	${CMAKE_CURRENT_SOURCE_DIR}/osloader.c 
	${CMAKE_CURRENT_SOURCE_DIR}/osnetwork.c 
	${CMAKE_CURRENT_SOURCE_DIR}/ostimer.c 
	PARENT_SCOPE)

set(OSAL_INC_DIRS 
	${CMAKE_CURRENT_SOURCE_DIR}/../inc
	${CMAKE_CURRENT_SOURCE_DIR})
	
add_subdirectory(unit-tests unit-tests)

set(OSAL_INC_DIRS ${OSAL_INC_DIRS} PARENT_SCOPE)