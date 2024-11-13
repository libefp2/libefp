#ifndef C_LIBTORCH_H_
#define C_LIBTORCH_H_

#include <stdint.h>


#ifdef __cplusplus
extern "C" {
#endif

struct TensorData;  // Opaque

// TODO: Remove
// SKP-==========//

struct Tensor{
    void* data;
    int64_t* sizes;
    int ndim;
    int type_id;
    int is_variable;
};


void *compute_gradient_c(float* data, int64_t* sizes, int ndim);
void destroy_tensor(struct Tensor *tensor);

typedef struct Net Net;
Net *createNet();
void destroyNet(Net *model);
void forward(Net* model, const float *inputs, float *output, int input_size, int output_size);
void trainModelWrapper(Net *model, const float **input_data, const float *target_data, int num_samples, int num_epochs, float learning_rate);
void generateEnergyWrapper(Net *model, const float **input_data, int batch_size, int input_size);


// June-6th

void *loadModelWrapper(const char *modelPath);
void generateEnergyForcesWrapper(const void* model, const float* const* coordinates, int num_atoms, float* energy, float* const* forces);
void generateSpeciesEnergyForcesWrapper(const void* model, const float* const* coordinates, const int* species, int num_atoms, float* energy, float* const* forces);

// void get_torch_energy_grad(float* coordinates_data, int* species_data, int num_atoms, float *atomic_energies, float *gradients, float *forces, int model_type, int print);
//void get_custom_energy_grad(float* coordinates_data, int* species_data, float* elecpots_data, int num_atoms, float* custom_energy, float* cus_grads, float* cus_forces, int print);
void engrad_custom_model_wrapper(float* coordinates_data, int64_t* species_data, float* elecpots_data, int num_atoms, float *custom_energy, float *gradients, float *forces);

// ================== //
// ==== Wrappers ==== //

typedef struct ANIModel ANIModel;

ANIModel* ANIModel_new();
void load_ani_model(ANIModel* model, int model_type, const char* nn_path);
void load_custom_ani_model(ANIModel* model, const char* aev_name, const char* model_name, const char* nn_path);
void get_ani_energy_grad(ANIModel* model, float* coordinates, int* species, double* atomic_energies, float* gradients, float* forces, int num_atoms, int print);
//void get_ani_energy_grad(ANIModel* model, double* coordinates, int* species, double* atomic_energies, double* gradients, double* forces, int num_atoms, int print);
//void get_custom_energy_grad_wrapper(ANIModel* model, float* coordinates, int64_t* species, float* elecpots, int num_atoms, float* custom_energy, float* gradients, float* forces, int print);
void get_custom_energy_grad_wrapper(ANIModel* model, float* coordinates, int64_t* species, float* elecpots, int num_atoms, double* custom_energy, float* gradients, float* forces, int print);

void ANIModel_delete(ANIModel* model);
 
//================// 


#ifdef __cplusplus
}
#endif


#endif // C_LIBTORCH_H_
