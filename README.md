# CPU crypto currency miner
A user friendly crypto currency miner based on Alpine Linux and XMRig. 

[![Docker pulls](https://img.shields.io/docker/pulls/rundqvist/unmineable.svg)](https://hub.docker.com/r/rundqvist/unmineable)
[![image size](https://img.shields.io/docker/image-size/rundqvist/unmineable.svg)](https://hub.docker.com/r/rundqvist/unmineable)
[![commit activity](https://img.shields.io/github/commit-activity/m/rundqvist/docker-unmineable)](https://github.com/rundqvist/docker-unmineable)
[![last commit](https://img.shields.io/github/last-commit/rundqvist/docker-unmineable.svg)](https://github.com/rundqvist/docker-unmineable)

## Features
* Easy to configure
* Supports a wide range of currencies
* Only 0,75% pool fee (default 1%)
* Optional dev fee

## Components
* [Alpine Linux](https://www.alpinelinux.org)
* [XMRig](https://xmrig.com)
* [unMineable](https://unmineable.com/?ref=l7nr-nohw)

## Run
### Quick test
```
docker run -d --name miner rundqvist/unmineable
```

### Configure miner for your coin and wallet
Replace the values in the sample code with your desired settings.<br />
Examples uses 50% of cpu to mine Shiba Inu to the specified wallet.

#### Docker run
```
docker run \
  -d \
  --name=miner \
  --dns 1.1.1.1 \ 
  --dns 1.0.0.1 \ 
  -e 'CPU_LIMIT_PERCENT=50' \
  -e 'COIN=SHIB' \
  -e 'WALLET=...' \
  -e 'WORKER=docker' \
  -e 'DIFFICULTY=35000' \
  -e 'DONATE=1' \
  rundqvist/unmineable
```

#### Docker compose
```
version: "3"
services:
  unmineable:
    image: rundqvist/unmineable
    container_name: unmineable
    
    restart: unless-stopped
    
    network_mode: bridge
    
    environment:
      - CPU_LIMIT_PERCENT=50
      - COIN=SHIB
      - WALLET=...
      - WORKER=docker
      - DIFFICULTY=35000
      - DONATE=1
    
    volumes:
      - /etc/localtime:/etc/localtime:ro
```

### Configuration

#### Variables

| Variable | Usage |
|----------|-------|
| CPU_LIMIT_PERCENT | Percentage of cpu to use for mining (digits only, 1-100). Default 50%. |
| COIN | Currency supported by unMineable.<br />Example:<br/>- BTC<br />- ETH<br />- DOGE<br />- XMR<br/>- ...and many more (please see [here](https://unmineable.com/coins?ref=l7nr-nohw) for a complete list). |
| WALLET | Your wallet address for specified coin. |
| WORKER | Name of your worker (default: docker). |
| DIFFICULTY | Desired difficulty. |
| DONATE | Percentage of cpu time to use for dev donation (digits only, 0-99). Default 1%. |

## Tips
Problem allocating memory or lower hashrate than expected? Try running container in privileged mode.

## Issues
Please report issues at https://github.com/rundqvist/docker-unmineable/issues

## Donations
Please support the development by making a small donation.

[![Support](https://img.shields.io/badge/support-Flattr-brightgreen)](https://flattr.com/@rundqvist)
[![Support](https://img.shields.io/badge/support-Buy%20me%20a%20coffee-orange)](https://www.buymeacoffee.com/rundqvist)
[![Support](https://img.shields.io/badge/support-PayPal-blue)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=SZ7J9JL9P5DGE&source=url)