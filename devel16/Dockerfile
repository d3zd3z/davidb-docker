FROM ubuntu:16.04
MAINTAINER David Brown <david.brown@linaro.org>

# Ubuntu 12.04 doesn't have python 3 installed by default.
RUN apt-get update && \
	apt-get install -y \
		python3 \
		tmux \
		sudo

COPY setup.py /usr/bin/setup.py
ENTRYPOINT ["/usr/bin/setup.py"]
CMD ["/bin/bash"]
