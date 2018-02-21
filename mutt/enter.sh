#! /bin/bash

# Start the 'asme' container to run as the current user in the current
# directory.

# The bind volumes should probably be changed to be broader than just
# the current example, but this case does work.
#
# You may want to bind your home directory, or at least things like
# ~/.ssh:~/.ssh:ro

container=davidb/mutt

docker run --rm -ti \
	-v "${HOME}/Sync/dotfiles/mutt:${HOME}/.mutt:ro" \
	-v "${HOME}/.docker-mutt-cache:${HOME}/.mutt-cache" \
	-v "${HOME}/.mutt_certificates:${HOME}/.mutt_certificates" \
	-v $SSH_AUTH_SOCK:$SSH_AUTH_SOCK:ro \
	-e USER=$USER \
	-e HOME=$HOME \
	-e SSH_AUTH_SOCK=$SSH_AUTH_SOCK \
        -e UID=$(id -u) \
        -e GID=$(id -g) \
	-w $(pwd) \
	$container \
	bash -l \
        "$@"

	# -v "$(pwd):$(pwd)" \
