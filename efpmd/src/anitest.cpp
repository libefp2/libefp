#include <torch/script.h>

torch::jit::script::Module loadModel(const std::string& modelPath) {
    try {
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

int main() {
    std::string modelPath = "/depot/lslipche/data/skp/libtorch/ANI2x_saved.pt";
    torch::jit::script::Module model = loadModel(modelPath);

    std::cout << "Energy: " << std::endl;
    std::cout << "Force: " << std::endl; 
 
    return 0;
}

