set(CMAKE_C_FLAGS "-g -O0 -Wformat=0 -Wno-pointer-to-int-cast -Wno-int-to-pointer-cast -fprofile-arcs -ftest-coverage -m32")

add_subdirectory(oscore-test core)
add_subdirectory(osfilesys-test filesys)
add_subdirectory(osfile-test file)
add_subdirectory(osloader-test loader)
add_subdirectory(osnetwork-test network)
add_subdirectory(ostimer-test timer)