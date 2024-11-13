#ifndef ANIMODEL_H
#define ANIMODEL_H

#include <torch/torch.h>
#include <torch/script.h>
#include <stdio.h>

//===== class ANIModel ==== //
 
class ANIModel {
public:
    //ANIModel() = default;
    ANIModel() {printf("\nANIModel() Constructor\n");}
    ~ANIModel() {printf("\nANIModel() Destructor\n");}
    void load_model(int model_type, const std::string &nn_path);
    void load_custom_model(const std::string &aev_name, const std::string &model_name, const std::string &nn_path);
    void get_energy_grad(const torch::Tensor& coordinates, const torch::Tensor& species, double* atomic_energies, float* gradients, float* forces, int num_atoms, int print);
    //void get_energy_grad(const torch::Tensor& coordinates, const torch::Tensor& species, double* atomic_energies, double* gradients, double* forces, int num_atoms, int print);
    //void get_custom_energy_grad(float* coordinates_data, int64_t* species_data, float* elecpots_data, int num_atoms, float* custom_energy, float* cus_grads, float* cus_forces, int print);
    void get_custom_energy_grad(float* coordinates_data, int64_t* species_data, float* elecpots_data, int num_atoms, double* custom_energy, float* cus_grads, float* cus_forces, int print);

private:
    torch::jit::Module module;
    torch::jit::Module aev_computer;
};

#endif // ANIMODEL_H
