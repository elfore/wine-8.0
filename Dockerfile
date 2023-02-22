FROM debian:11
COPY winehq-archive.key /usr/share/keyrings/
COPY winehq.list /etc/apt/sources.list.d/
RUN dpkg --add-architecture i386 && \
    apt update -y && \
    apt install ca-certificates -y && \
    apt update -y && \
    apt install --install-recommends winehq-stable -y

#elfore/wine:8.0