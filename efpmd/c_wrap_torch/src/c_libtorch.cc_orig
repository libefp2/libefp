#include <torch/all.h>
#include <torch/script.h>
#include <cassert>
#include <torch/nn/module.h>
#include <torch/nn/functional.h>
#include <torch/serialize.h>
#include "c_libtorch.h"
//#include <torch/torch.h>
#include <torch/serialize/archive.h>
#include <torch/serialize/tensor.h>
#include <iostream>
#include <vector>
#include <memory>

using namespace torch::autograd;

namespace {

bool is_valid_dtype(c_torch_DType dtype) {
  if ((dtype == c_torch_kUint8)
  || (dtype == c_torch_kInt8)
  || (dtype == c_torch_kInt16)
  || (dtype == c_torch_kInt32)
  || (dtype == c_torch_kInt64)
  || (dtype == c_torch_kFloat16)
  || (dtype == c_torch_kFloat32)
  || (dtype == c_torch_kFloat64)
  ) {
    return true;
  }

  return false;

}

// Get torch native dtype.
constexpr auto get_dtype(c_torch_DType dtype) {
  if (dtype == c_torch_kFloat32) {
    return torch::kFloat32;
  }

  throw std::invalid_argument("Unknown dtype");
}

int test_c_libtorch() {
  return 0;
}

} // namespace

//=========== SKP June 6th ======================//

torch::jit::script::Module loadModel(const std::string& modelPath) {
    try {

	// Load the scripted model
//	torch::jit::script::Module loadedModule = torch::jit::load("../../ANI2x_saved.pt");
	
	// You can now call your custom method
//	at::Tensor output = loadedModule.forward("custom_forward_for_inference", inputs).toTensor();

	// Load the model from file
	torch::jit::script::Module model;
        model = torch::jit::load(modelPath);
        model.to(torch::kCPU);
        model.eval();
        return model;
    } catch (const c10::Error& e) {
        std::cerr << "Error loading the model: " << e.what() << std::endl;
        exit(1);
    }
}

//torch::jit::script::Module loadANIModel(){
	// Load the scripted model
//	torch::jit::script::Module loadedModule = torch::jit::load("../../ANI2x_saved.pt");

        // You can now call your custom method
//        at::Tensor output = loadedModule.forward("custom_forward_for_inference", inputs).toTensor();
//}

void generateEnergyForces(torch::jit::script::Module& model, const std::vector<std::vector<float>>& coordinates,
                          float& energy, std::vector<std::vector<float>>& forces) {
    try {
        // Create a non-const copy of the coordinates data
        std::vector<std::vector<float>> coordCopy(coordinates);
 
        // Convert the coordinates to a Torch tensor
        torch::Tensor inputTensor = torch::from_blob(coordCopy.data(), {1, static_cast<long>(coordCopy.size()), 3});
        
        // Forward pass to calculate energy
	std::vector<c10::IValue> energyInputs = {inputTensor};
        torch::Tensor energyTensor = model.forward(energyInputs).toTensor();

        // Calculate forces using autograd
	std::vector<torch::Tensor> forceInputs = {energyTensor};
        std::vector<torch::Tensor> forcesTensor = torch::autograd::grad(forceInputs, {inputTensor}, {torch::ones_like(energyTensor)}, true, true);

        // Extract energy and forces from tensors
	energy = energyTensor.item<float>();
        forces.resize(coordinates.size());
        for (size_t i = 0; i < coordinates.size(); ++i) {
            forces[i].resize(3);
            for (size_t j = 0; j < 3; ++j) {
                forces[i][j] = forcesTensor[0][i][j].item<float>();
            }
        }
    } catch (const c10::Error& e) {
        std::cerr << "Error generating energy and forces: " << e.what() << std::endl;
        exit(1);
    }
}

//============ June 29th ==========================//

void generateSpeciesEnergyForces(torch::jit::script::Module& model,
                          const torch::Tensor& species,
                          const torch::Tensor& coordinates,
                          float& energy,
                          torch::Tensor& forces) {
    try {
	// Compute the energy
        torch::IValue species_coordinates = std::make_tuple(species, coordinates);
	auto result = model.forward({species_coordinates}).toTuple();
//	energy = result->elements()[0].toTensor().item<float>();
//        forces = result->elements()[1].toTensor();
	energy = result->elements()[0].toTensor().index({0}).item<float>();  // Extract the scalar value
	forces = result->elements()[1].toTensor().clone();  // Make a clone to avoid modifying the original tensor
	
  
    } catch (const c10::Error& e) {
        std::cerr << "Error generating energy and forces: " << e.what() << std::endl;
        exit(1);
    }
}

//struct Atom {
//    std::string species;
//    std::vector<float> coordinates;
//};

/*
float calculateEnergy(const torch::jit::script::Module& model, const std::vector<Atom>& atoms) {
    try {
        // Preprocess the data
	int numAtoms = atoms.size();
        std::vector<float> coordinates;
        std::vector<int> species;
        for (const auto& atom : atoms) {
            coordinates.insert(coordinates.end(), atom.coordinates.begin(), atom.coordinates.end());
            species.push_back(getSpeciesIndex(atom.species));
        }

        torch::Tensor coordinatesTensor = torch::from_blob(coordinates.data(), {1, numAtoms, 3});
        torch::Tensor speciesTensor = torch::from_blob(species.data(), {1, numAtoms}, torch::kInt32);

        // Perform forward pass inference
	torch::Tensor output = model.forward({coordinatesTensor, speciesTensor}).toTensor();

        // Extract and return the energy
	return output[0][0].item<float>();
    } catch (const c10::Error& e) {
        std::cerr << "Error generating energy: " << e.what() << std::endl;
        exit(1);
    }
}
*/

int64_t mapSpeciesToInteger(const std::string& species) {
    if (species == "H")
        return 1;
    else if (species == "O")
        return 2;
    else if (species == "C")
        return 3;
    else
        return 0; // Default value if species is unknown
}

void calculateEnergyAndForces(torch::jit::script::Module& model, const std::vector<Atom>& atoms) {
    // Create the input tensors
    torch::Tensor coordinatesTensor = torch::zeros({atoms.size(), 3});
    torch::Tensor speciesTensor = torch::zeros({atoms.size()});

    // Fill the input tensors
    for (size_t i = 0; i < atoms.size(); ++i) {
        const Atom& atom = atoms[i];
        coordinatesTensor[i][0] = atom.coordinates[0];
        coordinatesTensor[i][1] = atom.coordinates[1];
        coordinatesTensor[i][2] = atom.coordinates[2];
        speciesTensor[i] = mapSpeciesToInteger(atom.species);
    }

    // Create a tuple of tensors
    torch::IValue input = torch::ivalue::Tuple::create({coordinatesTensor, speciesTensor});

    // Run the model forward pass
//    torch::jit::IValue output = model.forward({coordinatesTensor, speciesTensor});
    torch::jit::IValue output = model.forward({input});


    // Retrieve the energy and forces tensors from the output
    torch::Tensor energyTensor = output.toTuple()->elements()[0].toTensor();
    torch::Tensor forcesTensor = output.toTuple()->elements()[1].toTensor();

    // Convert the energy and forces tensors to C++ arrays
    float energy = energyTensor.item<float>();
    std::vector<std::vector<float>> forces;
    for (int i = 0; i < forcesTensor.size(0); ++i) {
        std::vector<float> forceVec;
        forceVec.push_back(forcesTensor[i][0].item<float>());
        forceVec.push_back(forcesTensor[i][1].item<float>());
        forceVec.push_back(forcesTensor[i][2].item<float>());
        forces.push_back(forceVec);
    }

    // Print the energy and forces
    std::cout << "Energy: " << energy << std::endl;
    std::cout << "Forces:" << std::endl;
    for (const auto& forceVec : forces) {
        std::cout << forceVec[0] << ", " << forceVec[1] << ", " << forceVec[2] << std::endl;
    }
}    


/*

void generateEnergyForces(torch::jit::script::Module& model, const std::vector<std::vector<float>>& coordinates,
                          float& energy, std::vector<std::vector<float>>& forces) {
    try {
	// Create a non-const copy of the coordinates data
	std::vector<std::vector<float>> coordCopy(coordinates);

        // Convert the coordinates to a Torch tensor
	torch::Tensor inputTensor = torch::from_blob(coordCopy.data(), {1, static_cast<long>(coordCopy.size()), 3});

        // Forward pass to calculate energy
//	torch::Tensor energyTensor = model.forward({inputTensor}).toTensor();
	std::vector<torch::Tensor> energyInputs = {inputTensor};
        torch::Tensor energyTensor = model.forward(energyInputs).toTensor();
 
        // Calculate forces using autograd
	std::vector<torch::Tensor> forceInputs = {energyTensor};
        std::vector<torch::Tensor> forcesTensor = torch::autograd::grad(forceInputs, {inputTensor}, {torch::ones_like(energyTensor)}, true, true);

        // Extract energy and forces from tensors
        energy = energyTensor.item<float>();
        forces.resize(coordinates.size());
        for (size_t i = 0; i < coordinates.size(); ++i) {
            forces[i].resize(3);
            for (size_t j = 0; j < 3; ++j) {
                forces[i][j] = forcesTensor[0][i][j].item<float>();
            }
        }
    } catch (const c10::Error& e) {
        std::cerr << "Error generating energy and forces: " << e.what() << std::endl;
        exit(1);
    }
}
*/
//===============================================//

//=========== SKP June 5th========================//

struct Net : torch::nn::Module {
    Net() {
        fc1 = register_module("fc1", torch::nn::Linear(3, 16));
        fc2 = register_module("fc2", torch::nn::Linear(16, 3));
    }

    torch::Tensor forward(torch::Tensor x) {
        x = torch::relu(fc1->forward(x));
        x = fc2->forward(x);
        return x;
    }

    torch::nn::Linear fc1{nullptr}, fc2{nullptr};
};

void trainModel(Net &model, const std::vector<std::vector<float>> &input_data, const std::vector<float> &target_data, int num_epochs, float learning_rate) {
    torch::optim::SGD optimizer(model.parameters(), torch::optim::SGDOptions(learning_rate));

    for (int epoch = 0; epoch < num_epochs; ++epoch) {
        std::vector<std::vector<float>> non_const_input_data = input_data;
        torch::Tensor inputs = torch::from_blob(non_const_input_data.data(), {static_cast<long>(non_const_input_data.size()), static_cast<long>(non_const_input_data[0].size())});

        std::vector<float> target_data_nonconst(target_data.begin(), target_data.end());
        torch::TensorOptions options = torch::TensorOptions().dtype(torch::kFloat32);
        torch::Tensor targets = torch::from_blob(target_data_nonconst.data(), {static_cast<long>(target_data_nonconst.size())}, options);
        optimizer.zero_grad();
        torch::Tensor output = model.forward(inputs);
        torch::Tensor loss = torch::mse_loss(output, targets);
        loss.backward();
        optimizer.step();
        if (epoch % 10 == 0) {
            std::cout << "Epoch: " << epoch << ", Loss: " << loss.item<float>() << std::endl;
        }
    }
}

void generateEnergy(Net &model, const std::vector<std::vector<float>> &input_data) {
    torch::NoGradGuard no_grad;

    int batch_size = input_data.size(); // del later
    int input_size = input_data[0].size(); // del later

    std::vector<std::vector<float>> non_const_input_data = input_data;

    std::vector<float> flattened_input_data;
    flattened_input_data.reserve(batch_size * input_size);
    for (const auto &sample : non_const_input_data) {
        flattened_input_data.insert(flattened_input_data.end(), sample.begin(), sample.end());
    }


   torch::Tensor inputs = torch::from_blob(flattened_input_data.data(), {batch_size, input_size}); // de later



    torch::Tensor output = model.forward(inputs);

    std::cout << "Energy: ";
    std::vector<float> energy_values(output.data_ptr<float>(), output.data_ptr<float>() + output.numel());

    for (const auto &value : energy_values) {
        std::cout << value << " ";
    }
    std::cout << std::endl;
}

torch::Tensor compute_gradient(const torch::Tensor& input) {
     // Enable gradient computation
     torch::autograd::GradMode::set_enabled(true);
     // Create a variable from the input tensor
     torch::Tensor variable = input.clone().detach().requires_grad_(true);
     // Compute the output tensor
     torch::Tensor output = variable * variable/* your computation using the variable */;
     // Compute gradients of the output tensor with respect to the variable
     torch::autograd::variable_list grad_outputs = {torch::ones_like(output)};
     torch::autograd::variable_list gradients = torch::autograd::grad({output}, {variable}, grad_outputs, /* retain_graph */ true);
     torch::Tensor gradient = gradients[0];
     
     return gradient;
}     
                                            
void nnp_test5() {
    torch::jit::Module module = torch::jit::load("/depot/lslipche/data/skp/efpdev/libefp/efpmd/c-libtorch/src/ANI2x_saved.pt");
    torch::Tensor coordinates = torch::tensor({{{0.03192167, 0.00638559, 0.01301679},
                                                 {-0.83140486, 0.39370209, -0.26395324},
                                                 {-0.66518241, -0.84461308, 0.20759389},
                                                 {0.45554739, 0.54289633, 0.81170881},
                                                 {0.66091919, -0.16799635, -0.91037834}}}, torch::requires_grad(true));

    torch::Tensor species = torch::tensor({{6, 1, 1, 1, 1}});

    std::vector<torch::jit::IValue> inputs;
    inputs.push_back(std::make_tuple(species, coordinates));
    auto output = module.forward(inputs).toTuple();

    at::Tensor energy_tensor = output->elements()[1].toTensor();

    std::cout << "enery_tensor: " << energy_tensor << std::endl;
    auto energy = energy_tensor.item<float>();
    energy_tensor.backward(torch::ones_like(energy_tensor));
    auto force = -coordinates.grad();

    std::cout << "Energy: " << energy << std::endl;
    std::cout << "Force: " << force << std::endl;

    auto output2 = module.get_method("atomic_energies")(inputs).toTuple();
    auto atomic_energies = output2->elements()[1].toTensor();

    std::cout << "Average Atomic energies, for species 6 1 1 1 1: " << atomic_energies << std::endl;
}

void nnp_test6(const torch::Tensor& coordinates, const torch::Tensor& species) {
    torch::jit::Module module = torch::jit::load("/depot/lslipche/data/skp/efpdev/libefp/efpmd/c-libtorch/src/ANI2x_saved.pt");

    std::vector<torch::jit::IValue> inputs;
    inputs.push_back(std::make_tuple(species, coordinates));

    auto output = module.forward(inputs).toTuple();
    at::Tensor energy_tensor = output->elements()[1].toTensor();

    std::cout << "Energy Tensor: " << energy_tensor << std::endl;

    auto energy = energy_tensor.item<float>();
    energy_tensor.backward(torch::ones_like(energy_tensor));

    std::cout << "Before gradient calculation - Coordinates: " << coordinates << std::endl;
//    auto force = -coordinates.grad();
//    std::cout << "After gradient calculation - Force: " << force << std::endl;

    auto gradient = coordinates.grad();
    std::cout << "Gradient: " << gradient << std::endl;
 
// Check if gradient is defined and non-empty
    if (!gradient.defined() || gradient.numel() == 0) {
       std::cerr << "Error: Gradient is not defined or empty." << std::endl;
       return;
    }

    auto force = -gradient;


    std::cout << "Energy: " << energy << std::endl;
    std::cout << "Force: " << force << std::endl;

    auto output2 = module.get_method("atomic_energies")(inputs).toTuple();
    auto atomic_energies = output2->elements()[1].toTensor();

    std::cout << "Average Atomic Energies for species " << species << ": " << atomic_energies << std::endl;
}

//=============================//
 

extern "C" {

struct TensorData
{
  at::Tensor tensor;
};

struct ModuleData
{
  torch::jit::script::Module module;
};


void c_torch_version(int *major, int *minor, int *patch)
{
  if (major) {
    (*major) = TORCH_VERSION_MAJOR;
  }
  if (minor) {
    (*minor) = TORCH_VERSION_MINOR;
  }
  if (patch) {
    (*patch) = TORCH_VERSION_PATCH;
  }

}

int c_torch_cuda_is_available()
{
  return torch::cuda::is_available();
}


int delete_c_at_Tensor(c_at_Tensor *obj) {
  if (obj == NULL) {
    return -1;
  }

  delete obj->data;

  free(obj);

  return 0; // success
}

int delete_c_torch_jit_script_Module(c_torch_jit_script_Module *obj) {
  if (obj == NULL) {
    return -1;
  }

  delete obj->data;

  free(obj);

  return 0; // success
}

c_at_Tensor *c_torch_ones(int ndim, int *shape, c_torch_DType dtype) {
  if (shape == NULL) {
    return NULL;
  }

  if (!is_valid_dtype(dtype)) {
    return NULL;
  }

  c_at_Tensor *ct = reinterpret_cast<c_at_Tensor *>(malloc(sizeof(c_at_Tensor)));

  ct->dtype = dtype;
  ct->ndim = ndim;

  std::vector<int64_t> vshape;
  for (size_t i = 0; i < ndim; i++) {
    ct->shape[i] = shape[i];
    vshape.push_back(shape[i]);
  }

  TensorData *data = new TensorData();
  data->tensor = torch::ones(vshape, get_dtype(dtype));

  ct->data = data;

  return ct;

}

c_at_Tensor *c_torch_ones_1d(int sz, c_torch_DType dtype) {

  int shape[1];
  shape[0] = sz;

  return c_torch_ones(1, shape, dtype);
}

c_at_Tensor *c_torch_fft_fft(const c_at_Tensor *self, int64_t _n, int64_t dim, c_torch_fft_NormMode norm_mode) {
  c10::optional<int64_t> n = c10::nullopt;

  if (_n > 0) {
    n = _n;
  }

  c10::optional<c10::string_view> norm = c10::nullopt;

  if (norm_mode == c_torch_fft_norm_forward) {
    norm = "forward";
  } else if (norm_mode == c_torch_fft_norm_backward) {
    norm = "backward";
  } else if (norm_mode == c_torch_fft_norm_ortho) {
    norm = "ortho";
  }

  at::Tensor t = torch::fft::fft(self->data->tensor, n, dim, norm);

  c_at_Tensor *ct = reinterpret_cast<c_at_Tensor *>(malloc(sizeof(c_at_Tensor)));

  ct->dtype = self->dtype;
  ct->ndim = 1;
  ct->shape[0] = t.sizes()[0];

  TensorData *data = new TensorData();
  data->tensor = t;

  ct->data = data;

  return ct;

}

c_torch_jit_script_Module *c_torch_jit_load(const char *filename)
{
  torch::jit::script::Module module;

  try {
    module = torch::jit::load(filename);
  } catch (const c10::Error &e) {
    return nullptr;
  }


  c_torch_jit_script_Module *c_module = reinterpret_cast<c_torch_jit_script_Module *>(malloc(sizeof(c_torch_jit_script_Module)));

  ModuleData *data = new ModuleData();
  data->module = module;

  c_module->data = data;

  return c_module;
}

// SKP wrappers
 
void *compute_gradient_c(float* data, int64_t* sizes, int ndim) {

  torch::TensorOptions options;
  options = options.dtype(torch::kFloat32);
  torch::Tensor input_tensor = torch::from_blob(data, torch::IntArrayRef(sizes, ndim), options).clone();

  torch::Tensor gradient_tensor = compute_gradient(input_tensor);

  size_t tensor_size = gradient_tensor.numel();
        float* gradient_data = new float[tensor_size];
        std::memcpy(gradient_data, gradient_tensor.data_ptr<float>(), tensor_size * sizeof(float));

  int64_t* gradient_sizes = new int64_t[gradient_tensor.dim()];
        std::memcpy(gradient_sizes, gradient_tensor.sizes().data(), gradient_tensor.dim() * sizeof(int64_t));

        struct Tensor {
            void* data;
            int64_t* sizes;
            int ndim;
            int type_id;
            int is_variable;
        }; 

   Tensor* gradient = new Tensor();
        gradient->data = gradient_data;
        gradient->sizes = gradient_sizes;
        gradient->ndim = gradient_tensor.dim();
        gradient->type_id = static_cast<int>(gradient_tensor.scalar_type());
        gradient->is_variable = 0;

        return gradient;
}

void destroy_tensor(struct Tensor *tensor) {
        //delete[] tensor->data;
	delete[] static_cast<float*>(tensor->data);
        delete[] tensor->sizes;
        delete tensor;
}

//  SKP started on June 5th=========================//

Net *createNet() {
    return new Net();
}

void destroyNet(Net *model) {
    delete model;
}

void forward(Net *model, const float *inputs, float *output, int input_size, int output_size) {
    torch::Tensor input_tensor = torch::from_blob(const_cast<float*>(inputs), {input_size});
    torch::Tensor output_tensor = torch::from_blob(output, {output_size});
    torch::Tensor result = model->forward(input_tensor);

    std::memcpy(output, result.data_ptr<float>(), output_size * sizeof(float));
}

void trainModelWrapper(Net *model, const float **input_data, const float *target_data,int num_samples, int num_epochs, float learning_rate) {

    std::vector<std::vector<float>> input_vec;
    for (int i = 0; i < num_samples; ++i) {
        std::vector<float> data;
        for (int j = 0; j < 3; ++j) {
            data.push_back(input_data[i][j]);
        }
        input_vec.push_back(data);
    }

    trainModel(*model, input_vec, std::vector<float>(target_data, target_data + num_samples), num_epochs, learning_rate);

}

void generateEnergyWrapper(Net* model, const float **input_data, int batch_size, int input_size) {
    std::vector<std::vector<float>> input_vec(batch_size, std::vector<float>(input_size));

    for (int i = 0; i < batch_size; ++i) {
            for (int j = 0; j < input_size; ++j) {
                input_vec[i][j] = input_data[i][j];
            }
        }

    generateEnergy(*model, input_vec);
}

// June6th

void *loadModelWrapper(const char *modelPath) {
    std::string path(modelPath);
    torch::jit::script::Module *model = new torch::jit::script::Module(loadModel(path));
    return static_cast<void*>(model);
}

void generateEnergyForcesWrapper(const void* model, const float* const* coordinates, int num_atoms, float* energy, float* const* forces) {

    const torch::jit::script::Module* torchModel = static_cast<const torch::jit::script::Module*>(model);

    std::vector<std::vector<float>> coordVec(num_atoms, std::vector<float>(3));
    for (int i = 0; i < num_atoms; ++i) {
        for (int j = 0; j < 3; ++j) {
            coordVec[i][j] = coordinates[i][j];
        }
    }

    std::vector<std::vector<float>> forcesVec;
    generateEnergyForces(const_cast<torch::jit::script::Module&>(*torchModel), coordVec, *energy, forcesVec);

    for (int i = 0; i < num_atoms; ++i) {
        for (int j = 0; j < 3; ++j) {
            forces[i][j] = forcesVec[i][j];
        }
    }
}

void generateSpeciesEnergyForcesWrapper(const void* model,
                                 const float* const* coordinates,
                                 const int* species,
                                 int num_atoms,
                                 float* energy,
                                 float* const* forces) {
    const torch::jit::script::Module* torchModel = static_cast<const torch::jit::script::Module*>(model);

    // Convert the species and coordinates to Torch tensors
//    torch::Tensor speciesTensor = torch::from_blob(species, {1, num_atoms}, torch::kInt32).clone();
//    torch::Tensor coordinatesTensor = torch::from_blob(coordinates, {1, num_atoms, 3}).clone();

    torch::Tensor speciesTensor = torch::from_blob(const_cast<int*>(species), {1, num_atoms}, torch::kInt32).clone();
    torch::Tensor coordinatesTensor = torch::from_blob(const_cast<float**>(coordinates), {1, num_atoms, 3}).clone();

    torch::jit::script::Module& nonConstModel = const_cast<torch::jit::script::Module&>(*torchModel);

    // Generate energy and forces
    torch::Tensor forcesTensor;
    generateSpeciesEnergyForces(nonConstModel, speciesTensor, coordinatesTensor, *energy, forcesTensor);

    // Copy the forces to the output array
    for (int i = 0; i < num_atoms; ++i) {
        for (int j = 0; j < 3; ++j) {
//            forces[i][j] = forcesTensor[0][i][j].item<float>();
	   forces[i][j] = forcesTensor[i][j].item<float>();
        }
    }
}

//======== SKP June 29 =================================//
/*
float calculateEnergyWrapper(void* model, Atom* atoms, int numAtoms) {
    // Convert the model to the appropriate type
    torch::jit::script::Module* torchModel = static_cast<torch::jit::script::Module*>(model);

    // Convert the atom data to the appropriate format
    std::vector<Atom> atomVec(atoms, atoms + numAtoms);

    // Call the C++ routine
    float energy = calculateEnergy(*torchModel, atomVec);

    return energy;
}
*/

/*
void calculateEnergyAndForcesWrapper(void* model, const float* coordinates, const int* species, int num_atoms, float* energy, float* forces) {
    // Cast the model pointer to the appropriate type
    torch::jit::script::Module& torchModel = *reinterpret_cast<torch::jit::script::Module*>(model);

    // Create a vector to hold the Atom data
    std::vector<Atom> atoms;
    for (int i = 0; i < num_atoms; ++i) {
        Atom atom;
        atom.x = coordinates[i * 3];
        atom.y = coordinates[i * 3 + 1];
        atom.z = coordinates[i * 3 + 2];
        atom.species = species[i];
        atoms.push_back(atom);
    }

    // Call the calculateEnergyAndForces routine
    std::pair<float, std::vector<float>> result = calculateEnergyAndForces(torchModel, atoms);

    // Copy the energy and forces values to the output arrays
    *energy = result.first;
    std::memcpy(forces, result.second.data(), sizeof(float) * num_atoms * 3);
}
*/


void calculateEnergyAndForcesWrapper(void* model, Atom* atoms, size_t num_atoms) {
    // Convert the model pointer to torch::jit::script::Module
    torch::jit::script::Module* torchModel = static_cast<torch::jit::script::Module*>(model);

    // Create a vector of Atom objects from the input array
    std::vector<Atom> atomsVec(atoms, atoms + num_atoms);

    // Call the calculateEnergyAndForces function
    calculateEnergyAndForces(*torchModel, atomsVec);
}

void nnp_test6_wrapper(float* coordinates_data, int* species_data, int num_atoms) {
        // Convert C-style arrays to Torch tensors
//	torch::Tensor coordinates = torch::from_blob(static_cast<float*>(coordinates_data), {num_atoms, 3}, torch::requires_grad(true));
//        torch::Tensor species = torch::from_blob(static_cast<int*>(species_data), {num_atoms}, torch::kInt);

	torch::Tensor speciesTensor = torch::from_blob(const_cast<int*>(species_data), {1, num_atoms}, torch::kInt32);
        torch::Tensor coordinatesTensor = torch::from_blob(const_cast<float*>(coordinates_data), {1, num_atoms, 3}, torch::requires_grad(true));
 
	std::cout << "Species Tensor: " << speciesTensor.sizes() << " - " << speciesTensor.dtype() << std::endl;
        std::cout << "Coordinates Tensor: " << coordinatesTensor.sizes() << " - " << coordinatesTensor.dtype() << std::endl;
 
        // Call the C++ function
	nnp_test6(coordinatesTensor, speciesTensor);

}
//=====================================// 



} // extern "C"
