FROM alpine:3.7
MAINTAINER David Brown <david.brown@linaro.org>

RUN apk update && \
	apk add python3 tmux sudo bash \
		musl-dev go openssl-dev

COPY setup.py /usr/bin/setup.py
ENTRYPOINT ["/usr/bin/setup.py"]
CMD ["/bin/bash"]
