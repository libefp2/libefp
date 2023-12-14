#include <stdio.h>
#include "c_libtorch.h"

int main() {
    // Create the network
    Net* model = createNet();

    // Define the training data
    const float input_data[3][3] = {
        {0.1, 0.2, 0.3},
        {0.4, 0.5, 0.6},
        {0.7, 0.8, 0.9},
//        {1.0, 1.1, 1.2}
    };
    const float target_data[3] = {0.5, 0.7, 1.1};
    int num_samples = 3;
    int num_epochs = 100;
    float learning_rate = 0.001;

    // Train the model
    const float* input_data_ptr[3];
    for (int i = 0; i < num_samples; ++i) {
        input_data_ptr[i] = input_data[i];
    }

    trainModelWrapper(model, input_data_ptr, target_data, num_samples, num_epochs, learning_rate);

    // Generate energy
    const float input_data_energy[2][3] = {
        {0.2, 0.4, 0.6},
        {0.8, 1.0, 1.2}
    };
    int batch_size = 2;
    int input_size = 3;

    const float* input_data_energy_ptr[2];
    for (int i = 0; i < batch_size; ++i) {
        input_data_energy_ptr[i] = input_data_energy[i];
    }

    generateEnergyWrapper(model, input_data_energy_ptr, batch_size, input_size);

    // Destroy the network
    destroyNet(model);

    return 0;
}

