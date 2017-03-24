#! /usr/bin/python3

import grp
import sys
import os
import os.path
import shutil

from subprocess import check_call, call

def die(msg):
    print("Unable to run: '{}'".format(msg), file=sys.stderr)
    sys.exit(1)

def getenv(name):
    if name not in os.environ:
        die("variable '{}' not set in environemnt".format(name))
    return os.environ[name]

class State():
    def __init__(self):
        self.uid = int(getenv('UID'))
        self.gid = int(getenv('GID'))
        self.user = getenv('USER')
        self.home = getenv('HOME')
        # Just guess that the current user's first group is their
        # name.

    def make_user(self):
        if self.uid == 0:
            return

        # If the user has already been created, don't do it again.
        ufile = "/.setup-{}".format(self.uid)
        if os.path.isfile(ufile):
            return

        os.makedirs(self.home, exist_ok=True)
        os.chown(self.home, self.uid, self.gid)
        try:
            grp.getgrgid(self.gid)
        except KeyError:
            check_call(["groupadd", "-g", str(self.gid), self.user])
        check_call(["useradd", "-u", str(self.uid),
            "-g", str(self.gid),
            "-d", self.home,
            "-G", "sudo",
            "-M",
            self.user])

        # Ensure that this user can sudo without a password.
        # Unfortunately, sudo -v still wants a password.
        with open("/etc/sudoers", "a") as fd:
            print("{} ALL = NOPASSWD: ALL".format(self.user), file=fd)
            print("%sudo ALL=(ALL) NOPASSWD: ALL", file=fd)

        # Mark that the setup has run, so it doesn't get rerun in the
        # same image.
        with open(ufile, "w"):
            pass

    def start(self, args):
        if len(args) == 0:
            die("Need at least 1 argument of program to run")

        cmd = shutil.which(args[0])
        if not cmd:
            die("Unable to find program on path: '{}'".format(args[0]))
        # print("run '{}', '{}'".format(cmd, args))
        os.setgid(self.gid)
        # TODO: Don't hardcode to 27, look it up.
        # This isn't really needed with the above, anyway.
        # os.setgroups([self.gid, 27])
        os.setuid(self.uid)
        os.execl(cmd, *args)

if __name__ == '__main__':
    st = State()
    st.make_user()
    st.start(sys.argv[1:])

# 	echo "$USER:secret" | chpasswd
