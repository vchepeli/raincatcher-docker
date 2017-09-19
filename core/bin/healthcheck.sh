#!/bin/bash

ETH0_IP4=$(ip -o -4 addr show eth0 | awk -F"[ /]+" "{print\$4}")
ETH0_IP6=$(ip -o -6 addr show eth0 | awk -F"[ /]+" "{print\$4}")

echo ===ROUTING TABLE===
ip r
echo ETH0_IP4=$ETH0_IP4
echo ETH0_IP6=$ETH0_IP6

CODE=$(curl -s -o /dev/null -w "%{http_code}" http://$ETH0_IP4:8001)

if [ $CODE -ne 200 ]; then
  echo "Failed Core healthcheck endpoint"
  exit 1
fi
 
exit 0