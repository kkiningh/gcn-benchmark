.PHONY: all

all: wiki-Vote/wiki-Vote.mtx

wiki-Vote/wiki-Vote.mtx: wiki-Vote/wiki-Vote.tar.gz
	tar -xvf $^ --strip-components=1 wiki-Vote/$@

wiki-Vote/wiki-Vote.tar.gz:
	@echo "Downloading dataset '$@'"
	wget -O $@ https://sparse.tamu.edu/MM/SNAP/wiki-Vote.tar.gz
