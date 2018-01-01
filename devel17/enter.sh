#! /bin/bash

# Start the 'asme' container to run as the current user in the current
# directory.

# The bind volumes should probably be changed to be broader than just
# the current example, but this case does work.
#
# You may want to bind your home directory, or at least things like
# ~/.ssh:~/.ssh:ro

container=davidb/devel:ubuntu-16.04

docker run --rm -ti \
	-v "$(pwd):$(pwd)" \
	-v "$HOME/.bashrc:$HOME/.bashrc" \
	-v "$HOME/.bash_profile:$HOME/.bash_profile" \
	-e USER=$USER \
	-e HOME=$HOME \
        -e UID=$(id -u) \
        -e GID=$(id -g) \
	-w $(pwd) \
	$container \
	bash -l \
        "$@"
