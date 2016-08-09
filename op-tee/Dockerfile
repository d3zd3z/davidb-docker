FROM davidb/devel:ubuntu-16.04
MAINTAINER David Brown <david.brown@linaro.org>

# The Linaro toolchains seem to be built for 32-bit, so we need to
# grab everything.
RUN dpkg --add-architecture i386 && \
	apt-get update && \
	apt-get -y upgrade

# Packages from
# https://github.com/ARM-software/arm-trusted-firmware/blob/master/docs/user-guide.md
# Plus 'wget' needed to follow further instructions.
# Python needed, but not mentioned.
# unzip and bc needed but not mentioned.
# libfdt-dev needed by qemu.
RUN apt-get update && \
	apt-get install -y \
		git \
		build-essential uuid-dev iasl \
		autoconf bison \
		cscope \
		curl flex gdisk \
		libglib2.0-dev \
		libpixman-1-dev \
		netcat \
		python-crypto \
		python-serial \
		python-wand \
		uuid-dev \
		xdg-utils \
		xz-utils \
		zlib1g-dev \
		mtools \
		libtool \
		libftdi-dev \
		libhidapi-dev \
		wget \
		python \
		libc6:i386 \
		libstdc++6:i386 \
		libz1:i386 \
		unzip \
		bc \
		libfdt-dev

# Apt doesn't seem to be able to install this package together with
# the above.
# RUN apt-get install -y libc:i386 zlib1g-dev:i386 libstdc++6:i386

# Grumble, why does apt then seem to discard build essential.
# RUN apt-get install -y build-essential

# RUN mkdir -p /opt/cross

#RUN cd /opt/cross && \
#	wget http://releases.linaro.org/14.05/components/toolchain/binaries/gcc-linaro-arm-linux-gnueabihf-4.9-2014.05_linux.tar.xz && \
#	tar -xf gcc-linaro-arm-linux-gnueabihf-4.9-2014.05_linux.tar.xz && \
#	rm gcc-linaro-arm-linux-gnueabihf-4.9-2014.05_linux.tar.xz

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
