
set(SRC   
	aidisp.c 
	balance.c  
	clapack.c  
	disp.c  
	efp.c  
	elec.c  
	electerms.c  
	int.c  
	log.c  
	parse.c  
	pol.c  
	poldirect.c  
	stream.c  
	swf.c  
	util.c  
	xr.c
)

set(headers 
	balance.h
	efp.h
	int.h       
	log.h       
	private.h  
	swf.h    
	util.h
	clapack.h  
	elec.h  
	intshift.h  
	mathutil.h  
	stream.h   
	terms.h
)

include_directories(../include)
include_directories(../efpmd/src)
include_directories(../efpmd/libopt)
include_directories(../efpmd/libff)

add_library(frg_sources ${SRC} ${headers})
target_link_libraries(frg_sources efp_sources src_ff src_opt src_optf)
#add_dependencies(frg_sources generated_headers)
 
#Set the location for library installation -- i.e., /usr/lib in this case
# not really necessary in this example. Use "sudo make install" to apply
#install(TARGETS testStudent DESTINATION /usr/lib)
