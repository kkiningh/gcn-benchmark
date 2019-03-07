SRCDIR := src
OUTDIR := build

MKLPATH := $(MKLROOT)/lib
MKLINCLUDE := $(MKLROOT)/include

$(OUTDIR)/intel_mkl_bench: $(OUTDIR)/intel_mkl_bench.o
	$(CC) $< -o $@

$(OUTDIR)/%.o: $(SRCDIR)/%.cpp
	@mkdir -p $(OUTDIR)
	$(CC) -c $< -o $@ -I$(MKLINCLUDE)

.PHONY: clean
clean:
	rm -rf build
