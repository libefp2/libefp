
set(SRC_FF ff.c)
include_directories(../include)
add_library(ff STATIC ${SRC_FF} ff.h)

#target_link_libraries(libff libopt efp_sources)

#Set the location for library installation -- i.e., /usr/lib in this case
# not really necessary in this example. Use "sudo make install" to apply
#install(TARGETS src_ff DESTINATION /usr/lib)
