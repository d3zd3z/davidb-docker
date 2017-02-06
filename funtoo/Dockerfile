FROM busybox

MAINTAINER David Brown <davidb@davidb.org>

# Insert the generation script.
ADD gen.sh /

RUN /gen.sh amd64 x86_64

RUN echo 'UTC' > /etc/timezone
