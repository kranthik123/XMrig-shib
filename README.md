# Shib Coin Miner with XMRig Docker Image

This repository contains a Dockerfile to build a Docker image that includes the latest version of XMRig, a popular open-source miner for cryptocurrencies, and is configured to mine Shib Coin.

## Usage

### Prerequisites
- Docker installed on your system. You can download Docker from [here](https://www.docker.com/get-started).

### Building the Docker Image
To build the Docker image locally, clone this repository and run the following command:

```bash
docker build -t shib-coin-miner .

# Running the Docker Container
docker run -d --name shib-coin-miner -e POOL_URL=YOUR_SHIB_POOL_URL -e WALLET_ADDRESS=YOUR_SHIB_WALLET_ADDRESS shib-coin-miner

#Monitoring Mining Status
docker logs -f shib-coin-miner

