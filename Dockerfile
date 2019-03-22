FROM debian:stretch-slim

# Build does not have interactive TTY
ARG DEBIAN_FRONTEND=noninteractive

# Very basic prereqs
RUN apt-get update && \
	apt-get install -y apt-utils && \
	apt-get install -y curl apt-transport-https gpg && \
	# Clean up apt lists & temp dir to not bloat the layer
	rm -rf /var/lib/apt/lists/* /tmp/*

# pcp & pcp-webapi
RUN curl 'https://bintray.com/user/downloadSubjectPublicKey?username=pcp' | apt-key add - && \
	echo "deb https://dl.bintray.com/pcp/stretch stretch main" | tee -a /etc/apt/sources.list && \
	apt-get update && \
	apt-get install -y pcp pcp-webapi && \
	# Clean up apt lists & temp dir to not bloat the layer
	rm -rf /var/lib/apt/lists/* /tmp/*

CMD exec /bin/bash -c "/etc/init.d/pmcd start; /etc/init.d/pmwebd start; trap : TERM INT; sleep infinity & wait"