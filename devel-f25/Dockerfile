FROM fedora:25
MAINTAINER David Brown <david.brown@linaro.org>

RUN dnf upgrade -y && \
	dnf install -y \
		tmux \
		sudo \
		less

COPY setup.py /usr/bin/setup.py
ENTRYPOINT ["/usr/bin/setup.py"]
CMD ["/bin/bash"]
