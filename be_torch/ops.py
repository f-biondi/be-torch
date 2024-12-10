import torch
from torch import Tensor

__all__ = ["be"]


def be(edge_index: Tensor, N: int) -> Tensor:
    return torch.ops.be_torch.be.default(edge_index, N)


# Registers a FakeTensor kernel (aka "meta kernel", "abstract impl")
# that describes what the properties of the output Tensor are given
# the properties of the input Tensor. The FakeTensor kernel is necessary
# for the op to work performantly with torch.compile.
@torch.library.register_fake("be_torch::be")
def _(edge_index, N):
    torch._check(edge_index.shape[0] == 2)
    return torch.zeros(N)

