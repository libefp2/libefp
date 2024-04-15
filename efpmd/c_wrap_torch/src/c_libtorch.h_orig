#ifndef C_LIBTORCH_H_
#define C_LIBTORCH_H_

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

#if defined(_WIN32)
#ifdef C_TORCH_COMPILE_LIBRARY
#define C_TORCH_EXPORT __declspec(dllexport)
#else
#define C_TORCH_EXPORT __declspec(dllimport)
#endif
#else
#define C_TORCH_EXPORT __attribute__((visibility("default")))
#endif


#define C_TORCH_TENSOR_MAX_DIM  (8)

#define C_TORCH_DEFAULT_DIM (-1)
#define C_TORCH_DEFAULT_N (-1)

typedef enum {
  c_torch_fft_norm_none,
  c_torch_fft_norm_forward,
  c_torch_fft_norm_backward,
  c_torch_fft_norm_ortho,
} c_torch_fft_NormMode;

typedef enum {
  c_torch_kInvalid,
  c_torch_kUint8,
  c_torch_kInt8,
  c_torch_kInt16,
  c_torch_kInt32,
  c_torch_kInt64,
  c_torch_kFloat16,
  c_torch_kFloat32,
  c_torch_kFloat64
} c_torch_DType;

struct TensorData;  // Opaque

typedef struct {
  c_torch_DType dtype;
  int ndim;
  int shape[C_TORCH_TENSOR_MAX_DIM];
  struct TensorData *data;
} c_at_Tensor;


struct ModuleData; // Opaque

typedef struct {
  struct ModuleData *data;
} c_torch_jit_script_Module;

// TODO: Remove
int test_c_libtorch();

//void compute_gradients(void *tensor, void *target, void *grad); // SKP changes

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

// June-29th
//struct Atom {
//    std::string species;
//    std::vector<float> coordinates;
//};

//void nnp_test5_wrapper();
void nnp_test6_wrapper(float* coordinates_data, int* species_data, int num_atoms);

typedef struct {
    char* species;
    float* coordinates;
} Atom;

//typedef struct {
//    const char* species;
//    float coordinates[3];
//} Atom;
//void calculateEnergyAndForcesWrapper(void* model, Atom* atoms, size_t num_atoms);


//void trainForcesWrapper(ForceModel* model, const float* coordinates, const float* forces, int num_atoms);
//void generateForcesWrapper(const ForceModel* model, const float* coordinates, float* forces, int num_atoms);

/*
//torch::Tensor compute_gradient(const torch::Tensor& input);

void *compute_gradient_c(float *data, int64_t *sizes, int ndim) {
    // Create a tensor from the input data

    torch::TensorOptions options = torch::TensorOptions().dtype(torch::kFloat32);
    torch::Tensor input_tensor = torch::from_blob(data, torch::IntArrayRef(sizes, ndim), options).clone();

    // Call the C++ compute_gradient function
    torch::Tensor gradient_tensor = compute_gradient(input_tensor);

    // Allocate memory for the gradient tensor in C-style struct
    size_t tensor_size = gradient_tensor.numel();
    float* gradient_data = new float[tensor_size];
    std::memcpy(gradient_data, gradient_tensor.data_ptr<float>(), tensor_size * sizeof(float));
 
    int64_t *gradient_sizes = new int64_t[gradient_tensor.dim()];
    std::memcpy(gradient_sizes, gradient_tensor.sizes().data(), gradient_tensor.dim() * sizeof(int64_t));

    Tensor *gradient = new Tensor();
    gradient->data = gradient_data;
    gradient->sizes = gradient_sizes;
    gradient->ndim = gradient_tensor.dim();
    gradient->type_id = static_cast<int>(gradient_tensor.scalar_type());
    gradient->is_variable = 0;

    return gradient;
}

void destroy_tensor(Tensor *tensor) {
    delete[] tensor->data;
    delete[] tensor->sizes;
    delete tensor;
}
 
*/
//================// 


// Delete Tensor object.
C_TORCH_EXPORT int delete_c_at_Tensor(c_at_Tensor *obj);

// Delete Module object
C_TORCH_EXPORT int delete_c_torch_jit_script_Module(c_torch_jit_script_Module *obj);


C_TORCH_EXPORT void c_torch_version(int *major, int *minor, int *patch);

// Returns 1: CUDA is availabe, 0: CUDA is not available
C_TORCH_EXPORT int c_torch_cuda_is_available();

// torch::ones()
C_TORCH_EXPORT c_at_Tensor *c_torch_ones(int ndim, int *shape, c_torch_DType dtype);

// Alias for torch::ones({sz0});
C_TORCH_EXPORT c_at_Tensor *c_torch_ones_1d(int sz0, c_torch_DType dtype);

// Alias for torch::ones({sz0, sz1});
C_TORCH_EXPORT c_at_Tensor *c_torch_ones_2d(int sz0, int sz1, c_torch_DType dtype);

// Alias for torch::ones({sz0, sz1, sz2});
C_TORCH_EXPORT c_at_Tensor *c_torch_ones_3d(int sz0, int sz1, int sz3, c_torch_DType dtype);

// Alias for torch::ones({sz0, sz1, sz2, sz3});
C_TORCH_EXPORT c_at_Tensor *c_torch_ones_4d(int sz0, int sz1, int sz3, c_torch_DType dtype);

// torch::zeros()
C_TORCH_EXPORT c_at_Tensor *c_torch_zeros(int ndim, int *shape, c_torch_DType dtype);

// Useful aliases
C_TORCH_EXPORT c_at_Tensor *c_torch_zeros_1d(int sz0, c_torch_DType dtype);
C_TORCH_EXPORT c_at_Tensor *c_torch_zeros_2d(int sz0, int sz1, c_torch_DType dtype);
C_TORCH_EXPORT c_at_Tensor *c_torch_zeros_3d(int sz0, int sz1, int sz2, c_torch_DType dtype);
C_TORCH_EXPORT c_at_Tensor *c_torch_zeros_4d(int sz0, int sz1, int sz2, int sz3, c_torch_DType dtype);

// torch::eye()
C_TORCH_EXPORT c_at_Tensor *c_torch_eye(int n, c_torch_DType dtype);


//
// torch::fft()
// n: fft length. -1 = None
//
C_TORCH_EXPORT c_at_Tensor *c_torch_fft_fft(const c_at_Tensor *self, int64_t n, int64_t dim, c_torch_fft_NormMode norm_mode);

//
// torch::ifft()
// n: fft length. -1 = None
//
C_TORCH_EXPORT c_at_Tensor *c_torch_fft_ifft(const c_at_Tensor *self, int64_t n, int64_t dim, c_torch_fft_NormMode norm_mode);

//
// torch::fft2()
// n: fft length. -1 = None
//
C_TORCH_EXPORT c_at_Tensor *c_torch_fft_fft2(const c_at_Tensor *self, int64_t n[2], int64_t dim[2], c_torch_fft_NormMode norm_mode);

//
// torch::ifft2()
// n: fft length. -1 = None
//
C_TORCH_EXPORT c_at_Tensor *c_torch_fft_ifft2(const c_at_Tensor *self, int64_t n[2], int64_t dim[2], c_torch_fft_NormMode norm_mode);

//
// torch::jit::load()
// return null when error loading a module(TODO: report an error);
//
C_TORCH_EXPORT c_torch_jit_script_Module *c_torch_jit_load(const char *filename);


#ifdef __cplusplus
}
#endif


#endif // C_LIBTORCH_H_
