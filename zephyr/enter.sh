#! /bin/bash

# Start the 'asme' container to run as the current user in the current
# directory.

# The bind volumes should probably be changed to be broader than just
# the current example, but this case does work.
#
# You may want to bind your home directory, or at least things like
# ~/.ssh:~/.ssh:ro
#
# We also do a tricky bind with ~/go/bin so that the Linux host sees a
# different binary directory.

container=davidb/zephyr:latest

docker run --rm -ti \
	-v "$(pwd):$(pwd)" \
	-v "$HOME/.bashrc:$HOME/.bashrc" \
	-v "$HOME/.bash_profile:$HOME/.bash_profile" \
	-v "$HOME:$HOME" \
	-v "$HOME/go/linux-bin:$HOME/go/bin" \
	-e USER=$USER \
	-e HOME=$HOME \
	-e SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
        -e UID=$(id -u) \
        -e GID=$(id -g) \
	-w $(pwd) \
	$container \
	bash -l \
        "$@"

#	-v "/mnt/linaro:/mnt/linaro" \
#	-v "/mnt/zephyr:/mnt/zephyr" \
#	-v $SSH_AUTH_SOCK:$SSH_AUTH_SOCK:ro \
