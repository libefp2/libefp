
set(SRC_OPT opt.c)
set(SRC_F 
	blas.f  
	lbfgsb.f
	linpack.f
	timer.f	
)

add_library(opt ${SRC_OPT} ${SRC_F} opt.h) 
#add_library(src_optf STATIC ${SRC_F})
#target_link_libraries(src_opt src_ff src_optf efp_sources)
#target_link_libraries(src_opt src_ff)
