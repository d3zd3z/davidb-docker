# devel-jessie

This is a docker image intended for interactive development.  Instead
of dropping the user into a root shell in /, it runs a setup script
that recreates the current user in the container.  With properly bound
volumes, this allows development tools from the container to be used
in ordinary directories.

The `build.sh` script is intended to show an example of how this image
can be built.  The `enter.sh` is a template for how to enter an image.
It may be necessary to invoke this with sudo.

Both of these should be modified to suit the current user.

For example, once the image has been installed locally, something like
this can be done:

    $ cd /path/to/android/tree
    $ sudo ./enter.sh
    name@0f017492$ source build/envsetup.sh
    ...

This layer is just a base to add the non-root user usage.  Images for
building specific targets can be built upon this.
