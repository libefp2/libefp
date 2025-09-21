
cmake_minimum_required(VERSION 3.13)
project(ctorch C CXX)

find_package(Torch REQUIRED)

add_library(ctorch SHARED c_libtorch.cc)

# integrate GPU compilation

message("TORCH_INSTALL_PREFIX = " ${TORCH_INSTALL_PREFIX})
message("TORCH_LIBRARIES = " ${TORCH_LIBRARIES})
message("TORCH_INCLUDE_DIRS = " ${TORCH_INCLUDE_DIRS})

target_include_directories(ctorch PRIVATE ${TORCH_INCLUDE_DIRS})
#target_link_directories(ctorch PRIVATE ${TORCH_INSTALL_PREFIX}/lib)
target_link_libraries(ctorch PUBLIC "${TORCH_LIBRARIES}")

set_target_properties(ctorch PROPERTIES
  CXX_STANDARD 17
  CXX_STANDARD_REQUIRED YES
)


