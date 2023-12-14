#include <stdio.h>
#include <stdlib.h>
#include "c_libtorch.h"

// Define the structure for the tensor
typedef struct {
    float *data;
    int64_t *sizes;
    int num_dims;
} Tensor;

// Function declaration for compute_gradient_c
Tensor *compute_gradient_c(float *data, int64_t *sizes, int num_dims);

// Test function to compute gradient
void test_compute_gradient() {
    // Define the Cartesian coordinates of the molecule
    float coordinates[] = {
        0.0f, 0.0f, 0.0f,
        1.0f, 0.0f, 0.0f,
        0.0f, 1.0f, 0.0f,
        0.0f, 0.0f, 1.0f,
        2.0f, 0.0f, 0.0f,
        0.0f, 2.0f, 0.0f,
        0.0f, 0.0f, 2.0f
    };  // Example coordinates for a molecule with 6 atoms
 
    // Compute the number of atoms
    int num_atoms = sizeof(coordinates) / (3 * sizeof(float));

    // Compute the size of the tensor
    int64_t sizes[] = {1, num_atoms, 3};

    // Create the tensor
    Tensor tensor;
    tensor.data = coordinates;
    tensor.sizes = sizes;
    tensor.num_dims = 3;

    // Compute the gradient
    Tensor *gradient = compute_gradient_c(tensor.data, tensor.sizes, tensor.num_dims);

    // Print the gradient
    int num_elements = sizes[0] * sizes[1] * sizes[2];
    for (int i = 0; i < num_elements; i++) {
        printf("%.2f ", gradient->data[i]);
    }
    printf("\n");

    // Clean up the gradient tensor
    free(gradient->data);
    free(gradient->sizes);
    free(gradient);
}

int main() {
    test_compute_gradient();
    return 0;
}

