Bootstrap: docker
From: ubuntu:16.04

%post
	apt update && apt -y install build-essential clang bison flex libreadline-dev \
                     gawk tcl-dev libffi-dev git mercurial graphviz   \
                     xdot pkg-config python python3 libftdi-dev sudo vim 
	
	cd /opt
	git clone https://github.com/cliffordwolf/icestorm
	cd icestorm
	make -j$(nproc)
	make install
	cd ..

	git clone https://github.com/cseed/arachne-pnr
	cd arachne-pnr
	make -j$(nproc)
	make install
	cd ..

	git clone https://github.com/cliffordwolf/yosys
	cd yosys
	make -j$(nproc)
	make install
	cd ..
	
	git clone https://github.com/cliffordwolf/icotools
	cd icotools/icoprog
	make USBMODE=1 install



