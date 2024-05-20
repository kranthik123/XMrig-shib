# Use Alpine as the base image
FROM alpine:latest

# Install dependencies
RUN apk update && apk add --no-cache \
    wget \
    tar \
    libstdc++ \
    && rm -rf /var/cache/apk/*

# Download and install the mining software (e.g., xmrig)
RUN wget -O xmrig.tar.gz https://github.com/xmrig/xmrig/releases/download/v6.21.3/xmrig-6.21.3-linux-static-x64.tar.gz \
    && tar -xvf xmrig.tar.gz \
    && mv xmrig-6.21.3 xmrig \
    && rm xmrig.tar.gz

# Create a script to start mining
RUN echo '#!/bin/sh\n\
./xmrig/xmrig -o rx.unmineable.com:3333 -u SHIB:0x92010367aae0ffee1c6a3971bcea60b9cb3c3592.miner -p x' > /start-mining.sh

# Make the script executable
RUN chmod +x /start-mining.sh

# Set the entrypoint to the mining script
ENTRYPOINT ["/start-mining.sh"]