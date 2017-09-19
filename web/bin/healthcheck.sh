#!/bin/bash

ETH0_IP4=$(ip -o -4 addr show eth0 | awk -F"[ /]+" "{print\$4}")

echo ===ROUTING TABLE===
ip r
echo ETH0_IP4=$ETH0_IP4

CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:9002)

if [ $CODE -ne 200 ]; then
  echo "Failed Mobile healthcheck endpoint"
  exit 1
fi

CODE=`curl -s -o /dev/null -w "%{http_code}" http://localhost:9003`

if [ $CODE -ne 200 ]; then
  echo "Failed Portal healthcheck endpoint"
  exit 1
fi

exit 0