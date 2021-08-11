# OpenVPN2Socks5
封装OpenVPN，暴露 socks5 端口，支持 UDP 转发

建议搭配 SSTap 使用，使用 Netch 可能会出现问题，原因未知.

## BUILD

```bash
git clone https://github.com/miyouzi/OpenVPN2Socks5.git
cd OpenVPN2Socks5
docker build -t miyouzi/openvpn2socks5:1.0 .
```

## RUN

```bash
docker run -it --rm --device=/dev/net/tun --cap-add=NET_ADMIN -v D:\AppData\Docker\OpenVPN:/vpn:ro -e OPENVPN_CONFIG=/vpn/yourConfig.ovpn -p 127.0.0.1:4080:4080 -p 127.0.0.1:4080:4080/udp -e udpPort=4080 miyouzi/openvpn2socks5:1.0
```

- `-v D:\AppData\Docker\OpenVPN:/vpn:ro` 配置目录映射，其中应包含 `ovpn` 文件。
- `OPENVPN_CONFIG=/vpn/yourConfig.ovpn` 其中 `yourConfig.ovpn` 替换成上面配置目录中想使用的配置文件名。
- `-e udpPort=4080` 设置容器内 socks5 server udp 监听端口，**请保持和 udp 外部映射端口号一致**，默认 `4080`。
- `-p 127.0.0.1:4080:4080 -p 127.0.0.1:4080:4080/udp` 端口映射，请注意，**udp内外部端口号要一致！**

