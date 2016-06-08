FROM davidb/devel:jessie
MAINTAINER David Brown <david.brown@linaro.org>

# Use the backports
# COPY backports.list /etc/apt/sources.list.d/backports.list

# The Linaro toolchains seem to be built for 32-bit, so we need to
# grab everything.
#RUN dpkg --add-architecture i386 && \
#	apt-get update && \
#	apt-get -y upgrade

# Packages needed for oe:
#   git - to have, it is useful
#   build-essential - get the compilers and such.
#   python - it's written in python
#   wget - useful for getting missing things
# In addition, bitbake itself reports the following as needed
# (misleadingly giving makeinfo instead of texinfo):
#   diffstat
#   texinfo
#   gawk
#   chrpath
#   cpio
# The build then fails reporting missing packages:
#   zlib1g-dev
RUN apt-get update && \
	apt-get install -y \
		git \
		build-essential \
		python \
		wget \
		diffstat \
		texinfo \
		gawk \
		chrpath \
		cpio \
		zlib1g-dev

# Apt doesn't seem to be able to install this package together with
# the above.
# RUN apt-get install -y zlib1g-dev:i386 libstdc++6:i386

# Grumble, why does apt then seem to discard build essential.
# RUN apt-get install -y build-essential

# RUN mkdir -p /opt/cross

# RUN cd /opt/cross && \
# 	wget http://releases.linaro.org/14.06/components/toolchain/binaries/gcc-linaro-aarch64-linux-gnu-4.9-2014.06-02_linux.tar.xz && \
# 	tar -xf gcc-linaro-aarch64-linux-gnu-4.9-2014.06-02_linux.tar.xz && \
# 	rm gcc-linaro-aarch64-linux-gnu-4.9-2014.06-02_linux.tar.xz

# Install the lava tool to manipulate lava.
#RUN apt-get -y -t jessie-backports install lava-tool

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
