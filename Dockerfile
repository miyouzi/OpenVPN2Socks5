FROM curve25519xsalsa20poly1305/openvpn-tunnel:latest

COPY openvpn2socks5_entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/openvpn2socks5_entrypoint.sh
RUN apk add grep && curl -L https://mirrors.host900.com/https://github.com/snail007/goproxy/blob/master/install_auto.sh | bash
ENV udpPort "4080"
EXPOSE 4080

ENTRYPOINT ["openvpn2socks5_entrypoint.sh"]