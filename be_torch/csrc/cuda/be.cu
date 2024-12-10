#include <torch/extension.h>

#include <cuda.h>
#include <cuda_runtime.h>

namespace be_torch {

__global__ void be_kernel(const long int* edge_index, long int N, long int* result) {
  //int idx = blockIdx.x * blockDim.x + threadIdx.x;
  //if (idx < numel) result[idx] = a[idx] * b[idx] + c;
}

at::Tensor be_cuda(const at::Tensor& edge_index, long int N) {
  //TORCH_CHECK(edge_index.sizes()[0] == 2);
  TORCH_INTERNAL_ASSERT(edge_index.device().type() == at::DeviceType::CUDA);
  at::Tensor edge_index_contig = edge_index_contig.contiguous();
  at::Tensor result = torch::empty(N, edge_index_contig.options());
  const float* edge_index_ptr = a_contig.data_ptr<long int>();
  float* result_ptr = result.data_ptr<long int>();

  be_kernel<<<(N+255)/256, 256>>>(edge_index_ptr, N, result_ptr);
  return result;
}

// Registers CUDA implementations for mymuladd, mymul, myadd_out
TORCH_LIBRARY_IMPL(be_torch, CUDA, m) {
  m.impl("be", &be_cuda);
}

}
