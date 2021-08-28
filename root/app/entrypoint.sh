#!/bin/sh

CPU_LIMIT=$(($(nproc) * $CPU_LIMIT_PERCENT))

echo "-- Configuration --"
echo "* CPU limited to to $CPU_LIMIT ($CPU_LIMIT_PERCENT %)"

if [ -z "$DIFFICULTY" ]; then
    CPU_SINGLE_SPEED=$(cat /proc/cpuinfo | grep "^[c]pu MHz" | head -n1 | awk '{print $4}' | awk -F'.' '{print $1}')
    CPU_TOTAL_SPEED=$(($CPU_SINGLE_SPEED * $(nproc) / 100 * $CPU_LIMIT_PERCENT))

    DIFFICULTY=$CPU_TOTAL_SPEED

    echo "* Difficulty set to: $DIFFICULTY (if too many/few shares accepted, please set DIFFICULTY manually)"
else
    echo "* Difficulty set to: $DIFFICULTY"
fi

echo "* Coin: $COIN"
echo "* Wallet: $WALLET"
echo "* Worker: $WORKER"

echo "-- Starting miner --"

cp -f /app/config.org.json /app/config.json

sed -i "s/COIN/$COIN/g" /app/config.json
sed -i "s/WALLET/$WALLET/g" /app/config.json
sed -i "s/WORKER/$WORKER/g" /app/config.json
sed -i "s/DIFFICULTY/$DIFFICULTY/g" /app/config.json

xmrig -c /app/config.json &
sleep 3

cpulimit -l $CPU_LIMIT -p $(pidof xmrig) -z