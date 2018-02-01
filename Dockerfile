FROM alpine

MAINTAINER m120

RUN \
		apk --update add bash jq python py-pip && \
		pip install awscli && \
		apk --purge -v del py-pip && \
		rm /var/cache/apk/*

COPY acm-resend-validation.bash /
CMD ["/bin/bash", "/acm-resend-validation.bash"]