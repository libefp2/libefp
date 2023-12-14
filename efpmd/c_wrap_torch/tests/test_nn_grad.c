#include <stdio.h>
#include <stdlib.h>
#include <torch/nn/module.h>
#include <torch/nn/functional.h>
//#include <torch/csrc/api/include/torch/utils.h>
#include <torch/script.h>
#include "c_libtorch.h"

typedef struct {
    float* data;
    int64_t* sizes;
    int num_dims;
} Tensor;

// C wrapper function for compute_gradient written in C++
//extern "C" Tensor *compute_gradient_c(float* input_data, int64_t* input_sizes, int num_dims);

Tensor *compute_gradient_c(float* input_data, int64_t* input_sizes, int num_dims);

void test_energy_gradient() {
    // Define the Cartesian coordinates of the molecule
    float coordinates[] = {
        // Your molecule's Cartesian coordinates here
	0.0f, 0.0f, 0.0f,
        1.0f, 0.0f, 0.0f,
        0.0f, 1.0f, 0.0f,
        0.0f, 0.0f, 1.0f,
        2.0f, 0.0f, 0.0f,
        0.0f, 2.0f, 0.0f,
        0.0f, 0.0f, 2.0f
    };

    // Load the neural network model
    torch::jit::script::Module model;
    try {
        model = torch::jit::load("model.pt");
    } catch (const c10::Error& e) {
        std::cerr << "Error loading the model: " << e.msg() << std::endl;
        return;
    }

    // Create a tensor from the coordinates
    int num_atoms = sizeof(coordinates) / (3 * sizeof(float));
    int64_t sizes[] = {1, num_atoms, 3};
    Tensor tensor;
    tensor.data = coordinates;
    tensor.sizes = sizes;
    tensor.num_dims = 3;

    // Convert the tensor to a Torch tensor
    auto options = torch::TensorOptions().dtype(torch::kFloat32);
    auto input_tensor = torch::from_blob(tensor.data, (sizes[0], sizes[1], sizes[2]), options);

    // Generate energy from the coordinates using the model
    torch::Tensor energy_tensor;
    try {
        energy_tensor = model.forward((input_tensor)).toTensor();
    } catch (const c10::Error& e) {
        std::cerr << "Error generating energy from the model: " << e.msg() << std::endl;
        return;
    }

    // Compute the energy gradient
    Tensor* gradient = compute_gradient_c(tensor.data, tensor.sizes, tensor.num_dims);

    // Print the energy gradient
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

