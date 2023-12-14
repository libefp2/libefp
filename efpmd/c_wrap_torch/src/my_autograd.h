
#ifndef MY_AUTOGRAD_H
#define MY_AUTOGRAD_H

#ifdef __cplusplus
extern "C" {
#endif

// Function to create a tensor
void* create_tensor(float* data, int* shape, int num_dims);

// Function to perform element-wise addition of two tensors
void add_tensors(void* tensor1, void* tensor2, void* result);

// Function to perform element-wise multiplication of two tensors
void multiply_tensors(void* tensor1, void* tensor2, void* result);

// Function to compute gradients of a tensor with respect to another tensor
void compute_gradients(void* tensor, void* target, void* grad);

#ifdef __cplusplus
}
#endif

#endif /* MY_AUTOGRAD_H */

