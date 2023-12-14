
#include "my_autograd.h"
#include <torch/torch.h>
#include <torch/script.h>

using namespace torch::autograd;

extern "C" {
void* create_tensor(float* data, int* shape, int num_dims) {
    // Convert C data and shape to torch::TensorOptions and torch::IntArrayRef
    torch::TensorOptions options = torch::TensorOptions().dtype(torch::kFloat32);
    torch::IntArrayRef sizes(shape, num_dims);

    // Create and return the tensor
    return new torch::Tensor(torch::from_blob(data, sizes, options));
}

void add_tensors(void* tensor1, void* tensor2, void* result) {
    // Perform element-wise addition using autograd functionality
    *((torch::Tensor*)result) = *((torch::Tensor*)tensor1) + *((torch::Tensor*)tensor2);
}

void multiply_tensors(void* tensor1, void* tensor2, void* result) {
    // Perform element-wise multiplication using autograd functionality
    *((torch::Tensor*)result) = *((torch::Tensor*)tensor1) * *((torch::Tensor*)tensor2);
}

void compute_gradients(void* tensor, void* target, void* grad) {
    // Compute gradients of `tensor` with respect to `target` using autograd functionality
    torch::autograd::backward({*((torch::Tensor*)tensor)}, {*((torch::Tensor*)target)});
    *((torch::Tensor*)grad) = *((torch::Tensor*)tensor)->grad();
}

} // extern "C"
