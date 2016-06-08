FROM davidb/devel:ubuntu-16.04
MAINTAINER David Brown <david.brown@linaro.org>

# This is based on the tools needed to build Android.

# Packages from
# http://source.android.com/source/initializing.html
# Plus 'wget' needed to follow further instructions.
# Python needed, but not mentioned.
# 2016-03-31: add mtools for hikey build
# 2016-03-31: Add 'bc', and 'ncurses-dev' needed for kernel builds.
# 2016-04-12: Add 'realpath', and 'python-crypto' needed by optee Android tree.
# 2016-04-13: Add 'android-tools-fsutils'.
# 2016-04-14: Add 'dosfstools'.
# 2016-06-04: Add 'python-wand'.
RUN apt-get update && \
	apt-get install -y \
		openjdk-8-jdk \
		git-core \
		flex \
		bison \
		gperf \
		build-essential \
		zip \
		curl \
		zlib1g-dev \
		gcc-multilib \
		g++-multilib \
		libc6-dev-i386 \
		lib32ncurses5-dev \
		x11proto-core-dev \
		libx11-dev \
		lib32z-dev \
		ccache \
		libgl1-mesa-dev \
		libxml2-utils \
		xsltproc \
		unzip  \
		mtools \
		bc \
		ncurses-dev \
		wget \
		realpath python-crypto \
		android-tools-fsutils \
		dosfstools \
		python \
		python-wand

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
