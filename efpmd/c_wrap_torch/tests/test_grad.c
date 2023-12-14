#include <stdio.h>
#include "c_libtorch.h"

typedef struct Tensor Tensor;

int main() {
    // Input data
    float input_data[4] = {1.0, 2.0, 3.0, 4.0};
    int64_t input_sizes[2] = {2, 2};

    // Call the compute_gradient_c function
    Tensor *gradient = compute_gradient_c(input_data, input_sizes, 2);

    // Print the gradient tensor
    printf("Gradient Tensor:\n");
    printf("Data: [");
    for (int i = 0; i < gradient->sizes[0]; i++) {
        for (int j = 0; j < gradient->sizes[1]; j++) {
            size_t index = i * gradient->sizes[1] + j;
//            printf("%.2f ", static_cast<float*>(gradient->data)[index]);
	    printf("%.2f ", ((float*)gradient->data)[index]);
        }
    }
    printf("]\n");
    printf("Sizes: [%ld, %ld]\n", gradient->sizes[0], gradient->sizes[1]);
    printf("Num Dimensions: %d\n", gradient->ndim);
    printf("Type ID: %d\n", gradient->type_id);
    printf("Is Variable: %d\n", gradient->is_variable);

    // Clean up the memory
    destroy_tensor(gradient);

    return 0;
}

