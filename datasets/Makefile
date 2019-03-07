.PHONY: all

all: wiki-Vote.mtx

wiki-Vote.mtx: wiki-Vote.tar.gz
	tar -xvf $^ --strip-components=1 wiki-Vote/$@

wiki-Vote.tar.gz:
	wget -O $@ https://sparse.tamu.edu/MM/SNAP/wiki-Vote.tar.gz
