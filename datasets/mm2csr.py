from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import argparse
import os

import numpy as np
import scipy.io
import scipy.sparse

parser = argparse.ArgumentParser(description='Convert a Matrix Market file to CSR')
parser.add_argument('mmfile', type=str, help='Matrix Market file')

def main(args):
    path = os.path.normpath(args.mmfile)
    base, ext = os.path.splitext(path)
    if (ext != '.mtx'):
        raise RuntimeError("File '{}' is not a Matrix Market file (*.mtx)".format(path))

    data = scipy.io.mmread(path)
    data = scipy.sparse.csr_matrix(data)

    # Write out the seperate
    data.data.astype(np.int32).tofile(base + '.data')
    data.indptr.astype(np.int32).tofile(base + '.indptr')
    data.indices.astype(np.int32).tofile(base + '.indices')

if __name__ == '__main__':
    args = parser.parse_args()
    main(args)
