

### make sure torch_switch = OFF, in setup.sh #########################
module load conda
conda create -n dev

conda activate dev

conda install -c conda-forge cmake ninja pybind11 pytest blas-devel numpy c-compiler cxx-compiler fortran-compiler qcelemental -y

conda install pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia
