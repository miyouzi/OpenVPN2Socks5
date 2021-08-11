#!/usr/bin/env bash
# Start OpenVPN
nohup /usr/local/bin/entrypoint.sh &
# Start Socks5 Server
sleep 5s
pubIP=$(curl ipinfo.io/ip)
proxy socks -t tcp -p "0.0.0.0:4080" --udp-port $udpPort --udp -g $pubIP
