#include <torch/extension.h>

#include <vector>

namespace be_torch {

// Registers _C as a Python extension module.
PYBIND11_MODULE(TORCH_EXTENSION_NAME, m) {}

// Defines the operators
TORCH_LIBRARY(be_torch, m) {
  m.def("be(Tensor edge_index, int N) -> Tensor");
}

}
