FROM davidb/devel:ubuntu-22.10
MAINTAINER David Brown <david.brown@linaro.org>

# !@#$ dpkg desperately tries to ask for the timezone, even with
# nohup.
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Denver

# Packages from
# https://www.zephyrproject.org/doc/getting_started/installation_linux.html
# Plus 'wget' needed to follow further instructions.
# Also 'python' is needed by the tools, despite not being spelled out.

RUN TZ=America/Denver \
	DEBIAN_FRONTEND=noninteractive \
	apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y \
		software-properties-common \
		git \
		make \
		gcc \
		gcc-multilib \
		g++ \
		autoconf \
		automake \
		libtool \
		libc6-dev-i386 \
		g++-multilib \
		python3-ply \
		wget \
		curl \
		bzip2 \
		file \
		xz-utils \
		python3-pip \
		python3-setuptools \
		python3-wheel \
		ccache \
		doxygen \
		dfu-util \
		device-tree-compiler \
		gperf \
		ninja-build \
		direnv \
		libncurses5-dev \
		libssl-dev \
		python3 \
		cmake && \
	pip3 install pyelftools

# cmake

# Add golang to the devel image as well.  Make sure to get a recent
# version.
# RUN apt-get install -y software-properties-common && \
# 	add-apt-repository -y ppa:longsleep/golang-backports && \
# 	apt-get update && \
# 	apt-get install -y golang-go

# With Ubuntu 17.10, the golang version is new enough.
# RUN apt-install -y golang-go cmake

# Apt doesn't seem to be able to install this package together with
# the above.
# RUN apt-get install -y zlib1g-dev:i386 libstdc++6:i386

# Grumble, why does apt then seem to discard build essential.
# RUN apt-get install -y build-essential

# RUN mkdir -p /opt/cross

RUN \
	cd /tmp && \
	curl -L -O https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v0.15.1/zephyr-sdk-0.15.1_linux-x86_64.tar.gz && \
	ls -l && \
	tar -xzf ./zephyr-sdk-0.15.1_linux-x86_64.tar.gz -C /opt && \
	cd /opt/zephyr-sdk-0.15.1 && \
	./setup.sh -h && \
	rm -rf zephyr-sdk*.sh && \
	cd /tmp && \
	ls -l /opt && \
	rm -rf zephyr-sdk*

ENV LC_CTYPE C.UTF-8

# Zephyr requires a bleeding edge cmake, which we can build from
# source.
# NB: cmake in ubuntu is now newer than this.
#RUN \
#	mkdir /var/tmp/build && \
#	cd /var/tmp/build && \
#	curl -L https://github.com/Kitware/CMake/releases/download/v3.22.2/cmake-3.22.2.tar.gz | \
#	  tar -xzf - && \
#	cd cmake-3.22.2 && \
#	./bootstrap && \
#	make -j9 && \
#	make install && \
#	cd /var/tmp && \
#	rm -rf cmake-3.22.2

# Install Rustup for rust tools
# RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

# ENV PATH="/root/.cargo/bin:${PATH}"

# RUN cd /opt/cross && \
# 	wget http://releases.linaro.org/14.06/components/toolchain/binaries/gcc-linaro-aarch64-linux-gnu-4.9-2014.06-02_linux.tar.xz && \
# 	tar -xf gcc-linaro-aarch64-linux-gnu-4.9-2014.06-02_linux.tar.xz && \
# 	rm gcc-linaro-aarch64-linux-gnu-4.9-2014.06-02_linux.tar.xz

# Baremetal GNU GCC tools.
#RUN mkdir -p /opt/cross && \
#	cd /opt/cross && \
#	wget http://releases.linaro.org/14.07/components/toolchain/binaries/gcc-linaro-aarch64-none-elf-4.9-2014.07_linux.tar.xz && \
#	tar -xf gcc-linaro-aarch64-none-elf-4.9-2014.07_linux.tar.xz && \
#	rm gcc-linaro-aarch64-none-elf-4.9-2014.07_linux.tar.xz

# gnueabihf GCC tools.
#RUN cd /opt/cross && \
#	wget http://releases.linaro.org/13.12/components/toolchain/binaries/gcc-linaro-arm-linux-gnueabihf-4.8-2013.12_linux.tar.bz2 && \
#	tar -xf gcc-linaro-arm-linux-gnueabihf-4.8-2013.12_linux.tar.bz2 && \
#	rm gcc-linaro-arm-linux-gnueabihf-4.8-2013.12_linux.tar.bz2
