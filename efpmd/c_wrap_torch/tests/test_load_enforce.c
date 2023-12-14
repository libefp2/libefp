#include <stdio.h>
#include "c_libtorch.h"

int main() {
    // Load the model
    const char* modelPath = "/path/to//model.pt";
    void* model = loadModelWrapper(modelPath);

    // Define the coordinates of the molecule
    const float coordinates[3][3] = {
        {0.1, 0.2, 0.3},
        {0.4, 0.5, 0.6},
        {0.7, 0.8, 0.9}
    };
    int num_atoms = 3;
    
    // Generate energy and forces
    float energy;
    float forces[3][3];
    generateEnergyForcesWrapper(model, (const float**)coordinates, num_atoms, &energy, (float**)forces);

    // Print the energy and forces
    printf("Energy: %f\n", energy);
    printf("Forces:\n");
    for (int i = 0; i < num_atoms; ++i) {
        printf("%f, %f, %f\n", forces[i][0], forces[i][1], forces[i][2]);
    }

    return 0;
}

