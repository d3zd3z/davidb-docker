#! /bin/bash

# Start the 'asme' container to run as the current user in the current
# directory.

# The bind volumes should probably be changed to be broader than just
# the current example, but this case does work.
#
# You may want to bind your home directory, or at least things like
# ~/.ssh:~/.ssh:ro

container=davidb/oe:latest

docker run --rm -ti \
	-v "$(pwd):$(pwd)" \
	-v "/mnt/linaro:/mnt/linaro" \
	-v "$HOME/.bashrc:$HOME/.bashrc" \
	-v "$HOME/.bash_profile:$HOME/.bash_profile" \
	-v "$HOME:$HOME" \
	-v $SSH_AUTH_SOCK:$SSH_AUTH_SOCK:ro \
	-e USER=$USER \
	-e HOME=$HOME \
	-e DISPLAY=$DISPLAY \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
        -e UID=$(id -u) \
        -e GID=$(id -g) \
	-w $(pwd) \
	$container \
	bash -l \
        "$@"
