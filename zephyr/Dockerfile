FROM davidb/devel:ubuntu-16.04
MAINTAINER David Brown <david.brown@linaro.org>

# Packages from
# https://www.zephyrproject.org/doc/getting_started/installation_linux.html
# Plus 'wget' needed to follow further instructions.
# Also 'python' is needed by the tools, despite not being spelled out.
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y \
		git \
		make \
		gcc \
		gcc-multilib \
		g++ \
		libc6-dev-i386 \
		g++-multilib \
		python3-ply \
		wget \
		bzip2 \
		xz-utils \
		python-yaml \
		cmake \
		libncurses5-dev \
		python

# Apt doesn't seem to be able to install this package together with
# the above.
# RUN apt-get install -y zlib1g-dev:i386 libstdc++6:i386

# Grumble, why does apt then seem to discard build essential.
# RUN apt-get install -y build-essential

# RUN mkdir -p /opt/cross

RUN \
	wget https://nexus.zephyrproject.org/content/repositories/releases/org/zephyrproject/zephyr-sdk/0.9/zephyr-sdk-0.9-setup.run && \
	chmod 755 ./zephyr-sdk-0.9-setup.run && \
	./zephyr-sdk-0.9-setup.run -- -d /opt/zephyr-sdk -y && \
	rm zephyr-sdk-0.9-setup.run

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
