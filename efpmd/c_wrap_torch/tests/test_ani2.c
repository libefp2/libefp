#include <stdio.h>
#include "c_libtorch.h"

int main() {
    void* model = loadModelWrapper("../../ANI2x_model.pt");
    Atom atoms[] = {
        {"C", (float[3]){0.0, 0.0, 0.0}},
        {"H", (float[3]){1.0, 1.0, 1.0}},
        {"H", (float[3]){-1.0, -1.0, -1.0}}
    };
    size_t numAtoms = sizeof(atoms) / sizeof(Atom);
    calculateEnergyAndForcesWrapper(model, atoms, numAtoms);
}
