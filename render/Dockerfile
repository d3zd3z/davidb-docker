FROM amazonlinux:2017.12

LABEL authors="David Brown <davidb@davidb.org>"

RUN yum -y update && \
	yum -y install aws-cli bzip2 \
		mesa-libGLU libXi libXrender

ENV BLENDER_MAJOR 2.79
ENV BLENDER_VERSION 2.79
ENV BLENDER_BZ2_URL https://mirror.clarkson.edu/blender/release/Blender$BLENDER_MAJOR/blender-$BLENDER_VERSION-linux-glibc219-x86_64.tar.bz2

RUN mkdir /usr/local/blender && \
	curl -SL "$BLENDER_BZ2_URL" | \
	tar -xjf - -C /usr/local/blender --strip-components=1
