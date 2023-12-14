set(SRC  
	src/cfg.c  
	src/common.c  
	src/efield.c  
	src/energy.c  
	src/grad.c  
	src/gtest.c  
	src/hess.c  
	src/md.c  
	src/msg.c  
	src/opt.c  
	src/main.c
	src/parse.c  
	src/rand.c  
	src/sp.c
	src/autodiff.c
	src/clib.c
)

set(headers
	./libff/ff.h
	./libopt/opt.h
	src/cfg.h  
	src/common.h  
	src/msg.h  
	src/phys.h  
	src/rand.h	
	src/autodiff.h
	src/clib.h
)

set(ext_headers 
	../src/balance.h
	../src/efp.h
	../src/int.h       
	../src/log.h       
	../src/private.h  
	../src/swf.h    
	../src/util.h
	../src/clapack.h  
	../src/elec.h  
	../src/intshift.h  
	../src/mathutil.h  
	../src/stream.h   
	../src/terms.h
	c_wrap_torch/src/c_libtorch.h
	c_wrap_torch/tests/acutest.h
#	libtorch/include/torch/csrc/api/include/torch/all.h
)

include_directories(../include)
include_directories(../src)
include_directories(libopt)
include_directories(libff)
include_directories(c_wrap_torch)
#include_directories(libtorch) #Today
#include_directories(libtorch/include/torch/csrc/api/include/) #Today

link_directories(libff libopt ../ c_wrap_torch/build) #Today
add_executable(efpmd ${SRC} ${headers} ${ext_headers})
target_link_libraries(efpmd PUBLIC ff opt efp m gfortran clibtorch)

#add_dependencies(efp_sources generated_headers)
#Set the location for library installation -- i.e., /usr/lib in this case
# not really necessary in this example. Use "sudo make install" to apply
#install(TARGETS testStudent DESTINATION /usr/lib)
