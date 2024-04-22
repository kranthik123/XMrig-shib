FROM alpine:latest

# Install dependencies
RUN apk add --no-cache git build-base cmake libuv-dev libssl-dev hwloc-dev && \
    git clone --single-branch --depth=1 https://github.com/xmrig/xmrig.git && \
    mkdir xmrig/build && \
    cd xmrig/build && \
    cmake .. && \
    make -j$(nproc)

WORKDIR /xmrig/build

# Default command
CMD ["./xmrig", "--coin=SHIB", "-o", "rx.unmineable.com:3333", "-u", "0x92010367aae0ffee1c6a3971bcea60b9cb3c3592", "-p", "x", "--donate-level=1"]