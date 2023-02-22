### a docker environment
#### wine:8.0 wrapped in debian:11
#### image push to dockerhub: elfore/wine:8.0


### 安装docker

参考 https://docs.docker.com/engine/install/centos/

```sh 
    yum remove docker \
                docker-client \
                docker-client-latest \
                docker-common \
                docker-latest \
                docker-latest-logrotate \
                docker-logrotate \
                docker-engine && \
    yum install -y yum-utils && \
    yum-config-manager \
         --add-repo \
         https://download.docker.com/linux/centos/docker-ce.repo && \
    yum install -y docker-ce \
                   docker-ce-cli \
                   containerd.io \
                   docker-buildx-plugin \
                   docker-compose-plugin && \
    service docker start
```

### 在debian：11镜像创建的容器中安装winehq

参考 https://mirrors.tuna.tsinghua.edu.cn/help/wine-builds/

``` sh
dpkg --add-architecture i386
wget -nc -O /usr/share/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
# vi /etc/apt/sources.list.d/winehq.list内容为
deb [arch=amd64,i386 signed-by=/usr/share/keyrings/winehq-archive.key] https://mirrors.tuna.tsinghua.edu.cn/wine-builds/debian/ bullseye main
apt install ca-certificates -y
apt update
apt install --install-recommends winehq-stable -y
```
