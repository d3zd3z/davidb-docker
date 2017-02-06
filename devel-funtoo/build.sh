#! /bin/bash

echo "Docker doesn't allow ptrace during build, which is needed by emerge at times"

echo "Within this container, do necessary build steps."
# to buid this image, start the base container with:
docker run -i --security-opt seccomp:unconfined \
	--name funwork \
	davidb/funtoo <<ZED
emerge --sync && \
	emerge -vDuN -j2 @world && \
	emerge -vDuN -j2 \
		tmux sudo vim && \
	find /usr/portage/distfiles -depth -mindepth 1 -delete &&
	echo '# Emptied' > /etc/bash/bash_logout
ZED

# Then within the container, Update, and install packages, trying to
# follow the docker file given here.

# Log out of that image, which should stop it.  Then commit that as a
# new base.
docker commit \
	--author 'David Brown <davidb@davidb.org>' \
	funwork davidb/funtoo-plus

# You should then be able to build images off of that

docker build -t davidb/devel:funtoo .

# Remove the temporary container
docker rm funwork
