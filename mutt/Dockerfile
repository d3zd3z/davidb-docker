FROM davidb/devel:alpine
MAINTAINER David Brown <david.brown@linaro.org>

RUN apk update && \
	apk add mutt w3m
COPY bin/* /usr/bin/
COPY mailcap /etc/mailcap
