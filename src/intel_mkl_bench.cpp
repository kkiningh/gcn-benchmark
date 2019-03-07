#include <cstdint>
#include <cstring>
#include <iostream>
#include <fstream>
#include <cstdio>

#include "mkl.h"
#include "mkl_spblas.h"

std::string dataset_path(std::string dataset, std::string ext) {
  return "./" + dataset + "/" + dataset + ext;
}

template <typename T>
T* load_array(std::string dataset, std::string ext, size_t len) {
  char *array = static_cast<char*>(mkl_malloc(sizeof(T), len));

  // Initialize it with the specified file
  std::fstream file;
  file.open(dataset_path(dataset, ext), std::ios::in | std::ios::binary);
  file.read(array, sizeof(T) * len);

  // Cast back to the correct type
  return static_cast<T*>(static_cast<void*>(array));
}

int main(int argc, char *argv[]) {
  if (argc != 1) {
    std::cout << "Usage: intel_mkl_bench dataset_name" << std::endl;
    return -1;
  }

  auto dataset = std::string{argv[1]};
  auto config = std::fstream(dataset_path(dataset, ".conf").c_str());
  int n, m, nnz;
  if (!(config >> n >> m >> nnz)) {
    std::cout
      << "Could not read config file for dataset '"
      << dataset
      << "'\nMake sure a *.conf file exists"
      << std::endl;
    return -1;
  }

  float *data = load_array<float>(dataset, ".data", nnz);

  return 0;
}
