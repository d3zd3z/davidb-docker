# FROM davidb/devel:ubuntu-22.10
FROM ghcr.io/catthehacker/ubuntu:act-latest
MAINTAINER David Brown <david.brown@linaro.org>

# !@#$ dpkg desperately tries to ask for the timezone, even with
# nohup.
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Denver

RUN TZ=America/Denver \
	DEBIAN_FRONTEND=noninteractive \
	apt-get update && \
	apt-get upgrade -y && \
  apt-get install -y \
    libusb-1.0-0-dev \
    python3-pip \
    golang \
    python3-venv \
    cmake

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
