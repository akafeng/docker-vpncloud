<p align="center">
    <img src="https://vpncloud.ddswd.de/img/logo.png" width="150" />
</p>

<h1 align="center">VpnCloud</h1>

<p align="center">A high performance peer-to-peer mesh VPN over UDP supporting strong encryption.</p>

<p align="center">
    <a href="https://hub.docker.com/r/akafeng/vpncloud">Docker Hub</a> ·
    <a href="https://github.com/dswd/vpncloud">Project Source</a>
</p>

<p align="center">
    <img src="https://img.shields.io/docker/v/akafeng/vpncloud?sort=semver" />
    <img src="https://img.shields.io/docker/pulls/akafeng/vpncloud" />
    <img src="https://img.shields.io/docker/image-size/akafeng/vpncloud??sort=semver" />
</p>

---

### Environment Variables

| Name | Default | Example |
| --- | ---- | ---- |
| TZ | UTC | Asia/Shanghai |
| RUN_MODE | normal | ws_proxy |
| LISTEN_PORT | 3210 | 80 |

---

### Pull The Image

```bash
$ docker pull akafeng/vpncloud
```

### Start Container

```bash
$ docker run -d \
  -v /etc/vpncloud/:/etc/vpncloud/ \
  -v /var/log/vpncloud/:/var/log/vpncloud/ \
  --device=/dev/net/tun \
  --cap-add=NET_ADMIN \
  --network host\
  --restart always \
  --name=vpncloud \
  akafeng/vpncloud
```
