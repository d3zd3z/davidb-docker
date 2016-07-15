FROM davidb/devel:ubuntu-16.04
MAINTAINER David Brown <david.brown@linaro.org>

# Packages from
# http://yottadocs.mbed.com/#installing
# Plus 'wget' needed to follow further instructions.
# Plus 'git' for easy development
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y \
		git \
		python-setuptools \
		cmake \
		build-essential \
		ninja-build \
		python-dev \
		libffi-dev \
		libssl-dev \
		wget \
		&& \
		easy_install pip

# Install yotto itself, and allow it to be used without sudo.
RUN \
	pip install yotta && \
	mkdir -p /usr/local/lib/yotta_modules && \
	chmod 777 /usr/local/lib/yotta_modules

# Install the gcc-arm-embedded toolchain.
RUN \
	apt-get install -y software-properties-common && \
	add-apt-repository ppa:team-gcc-arm-embedded/ppa && \
	apt-get update && \
	apt-get install -y gcc-arm-embedded

# RUN \
# 	wget https://nexus.zephyrproject.org/content/repositories/releases/org/zephyrproject/zephyr-sdk/0.8-i686/zephyr-sdk-0.8-i686-setup.run && \
# 	chmod 755 ./zephyr-sdk-0.8-i686-setup.run && \
# 	./zephyr-sdk-0.8-i686-setup.run -- -d /opt/zephyr-sdk -y && \
# 	rm zephyr-sdk-0.8-i686-setup.run

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
