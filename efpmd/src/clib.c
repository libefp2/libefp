#include "common.h"
#include "efp.h"
#include "cfg.h"
#include "clib.h"
#include "../c_wrap_torch/src/c_libtorch.h"
#include "autodiff.h"
#include <stdio.h>


void sim_clib_test(); // SKP

void sim_clib_test(){
   
    printf("\nInside CLIB-TEST... Testing all EFP-TORCH jobs\n\n");

    tortest_version();
    tortest_ones_f32_1();
    test_fft_f32();
    Test_SKP();
    grad_tst();
    compute_gradient_test();
    test2_nn();
//    test_load_enforce();
    anitest();
    nnp_libefp();
    printf("\nDone in CLIB-TEST.. coming out!!\n\n");

}

//=========== test_grad=========================//
void grad_tst(){

    printf("\nTEST JOB : GRAD_TST()\n\n");

    float input_data[4] = {1.0, 2.0, 3.0, 4.0};
    int64_t input_sizes[2] = {2, 2};

    struct Tensor *gradient = compute_gradient_c(input_data, input_sizes, 2);

    printf("Gradient Tensor:\n");
    printf("Data: [");
    for (int i = 0; i < gradient->sizes[0]; i++) {
        for (int j = 0; j < gradient->sizes[1]; j++) {
            size_t index = i * gradient->sizes[1] + j;
            printf("%.2f ", ((float*)gradient->data)[index]);
        }
    }
//}

    printf("]\n");
    printf("Sizes: [%ld, %ld]\n", gradient->sizes[0], gradient->sizes[1]);
    printf("Num Dimensions: %d\n", gradient->ndim);
    printf("Type ID: %d\n", gradient->type_id);
    printf("Is Variable: %d\n", gradient->is_variable);

    destroy_tensor(gradient);

//    return 0;
}

//======================================//
//========== test_molecule ================================//

//struct Tensor {
//    float *data;
//    int64_t *sizes;
//    int num_dims;
//} TenGrad;

void compute_gradient_test() {

    printf("\nTEST JOB : COMPUTE_GRADIENT_TST()\n\n");

    float coordinates[] = {
        0.0f, 0.0f, 0.0f,
        1.0f, 0.0f, 0.0f,
        0.0f, 1.0f, 0.0f,
        0.0f, 0.0f, 1.0f,
        2.0f, 0.0f, 0.0f,
        0.0f, 2.0f, 0.0f,
        0.0f, 0.0f, 2.0f
    };  // Example coordinates for a molecule with 6 atoms

    int num_atoms = sizeof(coordinates) / (3 * sizeof(float));

    int64_t sizes[] = {1, num_atoms, 3};

    struct TenGrad tensor;
    tensor.data = coordinates;
    tensor.sizes = sizes;
    tensor.num_dims = 3;

    struct TenGrad *gradient = compute_gradient_c(tensor.data, tensor.sizes, tensor.num_dims);

    int num_elements = sizes[0] * sizes[1] * sizes[2];
    for (int i = 0; i < num_elements; i++) {
        printf("%.2f ", gradient->data[i]);
    }
    printf("\n");

    free(gradient->data);
    free(gradient->sizes);
    free(gradient);
}

//============================================================//

// =========== test2_nn ======================================//

void test2_nn() {

    printf("\nTEST JOB : TEST2_NN()\n\n");

    struct Net* model = createNet();

    const float input_data[3][3] = {
        {0.1, 0.2, 0.3},
        {0.4, 0.5, 0.6},
        {0.7, 0.8, 0.9},
    };
    const float target_data[3] = {0.5, 0.7, 1.1};
    int num_samples = 3;
    int num_epochs = 100;
    float learning_rate = 0.001;

    const float* input_data_ptr[3];
    for (int i = 0; i < num_samples; ++i) {
        input_data_ptr[i] = input_data[i];
    }

    trainModelWrapper(model, input_data_ptr, target_data, num_samples, num_epochs, learning_rate);

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

    destroyNet(model);

}

//======================================================//

// ============= test_load_enforce ==============================//

void test_load_enforce(){

    printf("\nTEST JOB : TEST_LOAD_ENFORCE()\n\n");

    const char* modelPath = "../ANI2x_model.pt";
    void* model = loadModelWrapper(modelPath);

    const float coordinates[5][3] = {
        {0.1, 0.2, 0.3},
        {0.4, 0.5, 0.6},
        {0.7, 0.8, 0.9}
    };

    int num_atoms = 3;

    float energy;
    float forces[3][3];

    generateEnergyForcesWrapper(model, (const float**)coordinates, num_atoms, &energy, (float**)forces);

    printf("Energy: %f\n", energy);
    printf("Forces:\n");
    for (int i = 0; i < num_atoms; ++i) {
        printf("%f, %f, %f\n", forces[i][0], forces[i][1], forces[i][2]);
    }

//    return 0;
}

void anitest() {
    const char* modelPath = "/depot/lslipche/data/skp/libtorch/ANI2x_saved.pt";
    void*  model = loadModelWrapper(modelPath);
    
    printf("\n\nInside ANItest()\n");
    printf("Energy:\n");
    printf("Forces:\n\n");
}

void nnp_libefp() {
    printf("\nTesting Methane molecule energy and force using ANI2x_saved.pt\n");
    float coordinates_data[5][3] = {
        {0.03192167, 0.00638559, 0.01301679},
        {-0.83140486, 0.39370209, -0.26395324},
        {-0.66518241, -0.84461308, 0.20759389},
        {0.45554739, 0.54289633, 0.81170881},
        {0.66091919, -0.16799635, -0.91037834}
    };

    int species_data[5] = {6, 1, 1, 1, 1};

    nnp_test6_wrapper((float*)coordinates_data, species_data, 5);

}


//==========================================================//


void Test_SKP(){

    printf("\nTEST JOB : TEST_SKP()\n\n");

   DualNumber x = variable(2.0);
   DualNumber x3 = multiply(multiply(x, x), x);
   DualNumber x2 = multiply(x, x);

   DualNumber y = add(x3 ,add(x2, x));

   printf("y = %f\n", y.value);
   printf("dy/dx = %f\n", y.derivative);
/*
   Variable* x = create_variable(2.0);
   Variable* y = create_variable(3.0);

   Variable* z = multiply(x, y);
   Variable* result = add(z, x);

   backward(result);

   printf("Gradient of x: %f\n", x->gradient);
    printf("Gradient of y: %f\n", y->gradient);

    free_variable(x);
    free_variable(y);
    free_variable(z);
    free_variable(result);
*/

}

void tortest_version() {
  int major, minor, patch;

  c_torch_version(&major, &minor, &patch);

  printf("version: %d.%d.%d\n", major, minor, patch);

}

void tortest_ones_f32_1() {
  c_at_Tensor *tp = c_torch_ones_1d(9, c_torch_kFloat32);
  delete_c_at_Tensor(tp);
  printf("Inside tortest_ones_f32_1()\n\n");
}

void test_fft_f32() {
  c_at_Tensor *tp = c_torch_ones_1d(9, c_torch_kFloat32);

  c_at_Tensor *ft = c_torch_fft_fft(tp, /* n */-1, C_TORCH_DEFAULT_DIM, c_torch_fft_norm_none);

  delete_c_at_Tensor(tp);
  delete_c_at_Tensor(ft);
  printf("Inside test_fft_f32()\n\n");
}
