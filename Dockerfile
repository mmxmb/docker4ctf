# docker build -t ctf:ubuntu19.10 .
# docker run -d --rm -v $PWD:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --name ctf -i ctf:ubuntu19.10
# docker exec -it ctf /bin/bash

# based on https://github.com/LiveOverflow/pwn_docker_example/blob/master/ctf/Dockerfile
# SYS_PTRACE capability is needed for gdb
# seccomp=unconfined to disable ASLR during debugging

FROM ubuntu:19.10
ENV LC_CTYPE C.UTF-8
ARG DEBIAN_FRONTEND=noninteractive
RUN dpkg --add-architecture i386 && \
apt-get update && \
apt-get install -y build-essential jq strace ltrace curl wget gcc dnsutils netcat gcc-multilib net-tools vim gdb gdb-multiarch make 
