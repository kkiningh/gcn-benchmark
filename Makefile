SRCDIR := src
OUTDIR := build
CFLAGS := -std=c++14 -lc++

# Setup Intel Math Kernel Library
ifndef MKLROOT
$(error MKLROOT is not set. Make sure to source the setup script)
endif
MKL_LIB := $(MKLROOT)/lib
MKL_INC := $(MKLROOT)/include

MKL_CFLAGS := -DMKL_ILP64 -m64 -I$(MKL_INC)
MKL_LFLAGS := \
	$(MKL_LIB)/libmkl_intel_ilp64.a \
	$(MKL_LIB)/libmkl_intel_thread.a \
	$(MKL_LIB)/libmkl_core.a \
	-liomp5 -lpthread -lm -ldl

$(OUTDIR)/intel_mkl_bench: $(OUTDIR)/intel_mkl_bench.o
	$(CXX) $< -o $@ $(MKL_LFLAGS)

$(OUTDIR)/%.o: $(SRCDIR)/%.cpp
	@mkdir -p $(OUTDIR)
	$(CXX) -c $< -o $@ $(CFLAGS) $(MKL_CFLAGS)

.PHONY: clean
clean:
	rm -rf build
