FROM davidb/funtoo-plus
MAINTAINER David Brown <davidb@davidb.org>

# The base funtoo image has very little in it.
# In addition, docker doesn't allow ptrace during build, so we need to
# fire up the container manually, and run this script that way.
#RUN emerge --sync && \
#	emerge -vDuN -j2 @world && \
#	emerge -vDuN -j2 \
#		tmux sudo vim && \
#	find /usr/portage/distfiles -depth -mindepth 1 -delete

# Ubuntu 12.04 doesn't have python 3 installed by default.
#RUN apt-get update && \
#	apt-get install -y \
#		python3 \
#		tmux \
#		sudo

COPY setup.py /usr/bin/setup.py
ENTRYPOINT ["/usr/bin/setup.py"]
CMD ["/bin/bash"]
