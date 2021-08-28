# CPU crypto currency miner
A user friendly crypto currency miner based on Alpine Linux and XMRig. 

[![Docker pulls](https://img.shields.io/docker/pulls/rundqvist/unmineable.svg)](https://hub.docker.com/r/rundqvist/unmineable)
[![image size](https://img.shields.io/docker/image-size/rundqvist/unmineable.svg)](https://hub.docker.com/r/rundqvist/unmineable)
[![commit activity](https://img.shields.io/github/commit-activity/m/rundqvist/docker-unmineable)](https://github.com/rundqvist/docker-unmineable)
[![last commit](https://img.shields.io/github/last-commit/rundqvist/docker-unmineable.svg)](https://github.com/rundqvist/docker-unmineable)

## Features
* Easy to configure
* Supports a wide range of currencies

## Components
* [Alpine Linux](https://www.alpinelinux.org)
* [XMRig](https://xmrig.com)
* [unMineable](https://unmineable.com/?ref=p0qy-qr2o)

## Run
### To make a quick test
Just run: 
```
docker run -d --name miner rundqvist/unmineable
```

### To configure miner for your coin and wallet
Replace the values with your desired cpu limit, coin and wallet, worker name and difficulty, and run:
```
docker run \
  -d \
  --name=miner \
  --dns 1.1.1.1 \ 
  --dns 1.0.0.1 \ 
  -e 'CPU_LIMIT_PERCENT=50' \
  -e 'COIN=SHIB' \
  -e 'WALLET=0xeD535E0eeeAA6EF97b42f5b9beCc4BA764409117' \
  -e 'WORKER=docker' \
  -e 'DIFFICULTY=35000' \
  rundqvist/unmineable
```
Example above uses 50% of cpu to mine Shiba Inu to the specified wallet.

### Configuration

#### Variables

| Variable | Usage |
|----------|-------|
| CPU_LIMIT_PERCENT | Percentage of cpu to use for mining (digits only, 1-100).  |
| COIN | Currency supported by unMineable.<br />Example:<br/>- BTC<br />- DOGE<br />- XMR<br/>Please see [here](https://unmineable.com/coins?ref=p0qy-qr2o) for a complete list. |
| WALLET | Your wallet address for specified coin. |
| WORKER | Name of your worker (default: docker). |
| DIFFICULTY | Desired difficulty. |

## Issues
Please report issues at https://github.com/rundqvist/docker-unmineable/issues

## Donations
Please support the development by making a small donation.

[![Support](https://img.shields.io/badge/support-Flattr-brightgreen)](https://flattr.com/@rundqvist)
[![Support](https://img.shields.io/badge/support-Buy%20me%20a%20coffee-orange)](https://www.buymeacoffee.com/rundqvist)
[![Support](https://img.shields.io/badge/support-PayPal-blue)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=SZ7J9JL9P5DGE&source=url)