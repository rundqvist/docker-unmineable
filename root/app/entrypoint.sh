#!/bin/sh

echo "[INFO] *** rundqvist/unmineable ***"

CPU_LIMIT=$(($(nproc) * $CPU_LIMIT_PERCENT))

if [ -z "$DIFFICULTY" ]
then    
    DIFFICULTY="50000"
fi

test $DONATE -eq $DONATE &>/dev/null

if [ $? -ne 0 ] || [ $DONATE -gt 99 ]
then
    DONATE=1
fi

echo "[INFO] CPU limited to to $CPU_LIMIT ($CPU_LIMIT_PERCENT %)"
echo "[INFO] Difficulty set to: $DIFFICULTY (if too many/few shares accepted, please adjust difficulty)"
echo "[INFO] Coin: $COIN"
echo "[INFO] Wallet: $WALLET"
echo "[INFO] Worker: $WORKER"
echo "[INFO] Donate: $DONATE%"

echo "[INFO] Configuring miner"

cp -f /app/config.org.json /app/config.json

if [ -z "$COIN" ] || [ -z "$WALLET" ]
then
    echo "[WARN] Coin or Wallet not configured. Starting demo."

    sed -i "s/rx.unmineable.com:3333/stratum+ssl:\/\/donatexmr.duckdns.org:20000/g" /app/config.json
    sed -i "s/COIN:WALLET.WORKER+DIFFICULTY#l7nr-nohw/docker/g" /app/config.json
else
    sed -i "s/COIN/$COIN/g" /app/config.json
    sed -i "s/WALLET/$WALLET/g" /app/config.json
    sed -i "s/WORKER/$WORKER/g" /app/config.json
    sed -i "s/DIFFICULTY/$DIFFICULTY/g" /app/config.json
fi

sed -i "s/DONATE/$DONATE/g" /app/config.json

echo "[INFO] Starting miner"

/usr/sbin/xmrig -c /app/config.json &
sleep 3

/usr/bin/cpulimit -l $CPU_LIMIT -p $(pidof xmrig) -z