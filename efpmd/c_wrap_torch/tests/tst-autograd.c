
#include <stdio.h>
#include "my_autograd.h"

int main() {
    // Create input tensors
    float data1[] = {1.0, 2.0, 3.0};
    int shape1[] = {3};
    void* tensor1 = create_tensor(data1, shape1, 1);

    float data2[] = {4.0, 5.0, 6.0};
    int shape2[] = {3};
    void* tensor2 = create_tensor(data2, shape2, 1);

    // Perform addition
    void* result = create_tensor(NULL, shape1, 1);
    add_tensors(tensor1, tensor2, result);

    // Get the result tensor data
    float* result_data = (float*)((torch::Tensor*)result)->data_ptr();

    // Print the result
    printf("Addition Result: ");
    for (int i = 0; i < shape1[0]; i++) {
        printf("%.2f ", result_data[i]);
    }
    printf("\n");

    // Perform multiplication
    multiply_tensors(tensor1, tensor2, result);

    // Get the result tensor data
    result_data = (float*)((torch::Tensor*)result)->data_ptr();

    // Print the result
    printf("Multiplication Result: ");
    for (int i = 0; i < shape1[0]; i++) {
        printf("%.2f ", result_data[i]);
    }
    printf("\n");

    // Compute gradients
    void* target = create_tensor(data1, shape1, 1);
    void* grad = create_tensor(NULL, shape1, 1);
    compute_gradients(tensor1, target, grad);

    // Get the gradient tensor data
    result_data = (float*)((torch::Tensor*)grad)->data_ptr();

    // Print the gradient
    printf("Gradients: ");
    for (int i = 0; i < shape1[0]; i++) {
        printf("%.2f ", result_data[i]);
    }
    printf("\n");

    // Clean up
    delete (torch::Tensor*)tensor1;
    delete (torch::Tensor*)tensor2;
    delete (torch::Tensor*)result;
    delete (torch::Tensor*)target;
    delete (torch::Tensor*)grad;

    return 0;
}

