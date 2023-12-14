#include <stdio.h>
#include "c_libtorch.h"

int main() {
    // Load the model
    const char* modelPath = "../../ANI2x_model.pt";
    void* model = loadModelWrapper(modelPath);

    // Define the input coordinates and species
    const float coordinates[5][3] = {
        {0.03192167, 0.00638559, 0.01301679},
        {-0.83140486, 0.39370209, -0.26395324},
        {-0.66518241, -0.84461308, 0.20759389},
        {0.45554739, 0.54289633, 0.81170881},
        {0.66091919, -0.16799635, -0.91037834}
    };
    const int species[5] = {6, 1, 1, 1, 1};
    int num_atoms = 5;

    // Generate energy and forces
    float energy;
    float forces[5][3];
//    generateEnergyForcesWrapper(model, (const float**)coordinates, species, num_atoms, &energy, (float**)forces);
    generateSpeciesEnergyForcesWrapper(model, (const float**)coordinates, species, num_atoms, &energy, (float**)forces);

    // Print the energy and forces
    printf("Energy: %f\n", energy);
    printf("Forces:\n");
    for (int i = 0; i < num_atoms; ++i) {
        printf("%f, %f, %f\n", forces[i][0], forces[i][1], forces[i][2]);
    }    

    // Cleanup
//    delete static_cast<torch::jit::script::Module*>(model);

    return 0;
}

