#include <stdio.h>
#include "c_libtorch.h" // Assuming you have the wrapper functions defined in net_wrapper.h

int main() {
    // Create the neural network model
    Net* model = createNet();

    // Define the training data
    const float input_data[3][3] = {
        {1.0f, 2.0f, 3.0f},
        {4.0f, 5.0f, 6.0f},
	{7.0f, 8.0f, 9.0f}
        // Add more training data if needed
    };
    const float target_data[] = {
//        10.0f,
//        20.0f,
	{10.0f, 20.0f, 30.0f}
        // Add more target data if needed
    };
    int num_samples = sizeof(input_data) / sizeof(input_data[0]);
    int num_epochs = 100;
    float learning_rate = 0.001f;

    // Train the model
    trainModelWrapper(model, (const float**)input_data, target_data, num_samples, num_epochs, learning_rate);

    // Define the input data for energy generation
    const float input_data_energy[3][3] = {
//        {7.0f, 8.0f, 9.0f},
//        {10.0f, 11.0f, 12.0f},
	{2.0f, 3.0f, 4.0f},
        {5.0f, 6.0f, 7.0f},
        {8.0f, 9.0f, 10.0f}
        // Add more input data for energy generation if needed
    };
    int batch_size = sizeof(input_data_energy) / sizeof(input_data_energy[0]);
    int input_size = sizeof(input_data_energy[0]) / sizeof(input_data_energy[0][0]);

    // Generate energy for the input data
    generateEnergyWrapper(model, (const float**)input_data_energy, batch_size, input_size);

    // Destroy the model
    destroyNet(model);

  //  nnp_test5_wrapper();

    return 0;
}
/*
void test() {
    std::vector<std::vector<float>> input_data = {
        {1.0f, 2.0f, 3.0f},
        {4.0f, 5.0f, 6.0f},
        {7.0f, 8.0f, 9.0f}
    };
    std::vector<float> target_data = {10.0f, 20.0f, 30.0f};

    Net model;
    trainModel(model, input_data, target_data, 100, 0.01f);

    std::vector<std::vector<float>> test_data = {
        {2.0f, 3.0f, 4.0f},
        {5.0f, 6.0f, 7.0f},
        {8.0f, 9.0f, 10.0f}
    };
    generateEnergy(model, test_data);
}
*/
