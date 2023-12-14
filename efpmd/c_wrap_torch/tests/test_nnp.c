#include <stdio.h>
#include "c_libtorch.h"

int main() {
    // Example input data for coordinates and species
    float coordinates_data[5][3] = {
        {0.03192167, 0.00638559, 0.01301679},
        {-0.83140486, 0.39370209, -0.26395324},
        {-0.66518241, -0.84461308, 0.20759389},
        {0.45554739, 0.54289633, 0.81170881},
        {0.66091919, -0.16799635, -0.91037834}
    };

    int species_data[5] = {6, 1, 1, 1, 1};

    // Call the C++ wrapper function
    nnp_test6_wrapper((float*)coordinates_data, species_data, 5);

    return 0;
}

