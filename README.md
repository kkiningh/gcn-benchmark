GCN Benchmarks
---

This repository contains performance benchmarks for the core operations in Graph Convolutional Networks (GCN).

## Setup

You must have [Intel MKL](https://software.intel.com/en-us/mkl/choose-download).
After installing, you'll need to source the setup script before making.
On OSX for the 2019 version of MKL, this is located at the following path after installation.

```bash
source /opt/intel/compilers_and_libraries_2019/mac/mkl/bin/mklvars.sh
```

### Datasets

To download the datasets, run the following:

```bash
cd datasets && make all
```

Note some of the datasets are quite large once uncompressed
