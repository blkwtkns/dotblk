#
# Dockerfile for testing sh scripting in container
#

FROM ubuntu:latest
MAINTAINER Blake Watkins "blakemwatkins@gmail.com"

RUN apt-get update -y
RUN apt-get install -y git
RUN apt-get install -y python
RUN apt-get install -y curl
# RUN apt-get install -y vim
RUN apt-get install -y strace
RUN apt-get install -y diffstat
RUN apt-get install -y pkg-config
RUN apt-get install -y cmake
RUN apt-get install -y build-essential
RUN apt-get install -y tcpdump

RUN apt-get install -y build essentials
RUN apt-get install -y make
RUN apt-get install -y libtool autoconf automake cmake libncurses5-dev g++
RUN apt-get install -y python-dev python-pip python3-dev python3-pip
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:neovim-ppa/unstable
RUN apt-get -y update
RUN apt-get -y install neovim

RUN pip2/pip3 -y install neovim -U

RUN apt-get -y install xclip

RUN apt-get -y install tmux 

RUN apt-get -y install exuberant-ctags

# Install go
# RUN curl https://go.googlecode.com/files/go1.2.1.linux-amd64.tar.gz | tar -C /usr/local -zx
# ENV GOROOT /usr/local/go
# ENV PATH /usr/local/go/bin:$PATH

# Setup home environment
RUN useradd dev
RUN mkdir /home/dev && chown -R dev: /home/dev
RUN mkdir -p /home/dev/go /home/dev/bin /home/dev/lib /home/dev/include
ENV PATH /home/dev/bin:$PATH
ENV PKG_CONFIG_PATH /home/dev/lib/pkgconfig
ENV LD_LIBRARY_PATH /home/dev/lib
# ENV GOPATH /home/dev/go:$GOPATH

# RUN go get github.com/dotcloud/gordon/pulls

# Create a shared data volume
# We need to create an empty file, otherwise the volume will
# belong to root.
# This is probably a Docker bug.

# RUN mkdir /var/shared/
# RUN touch /var/shared/placeholder
# RUN chown -R dev:dev /var/shared
# VOLUME /var/shared

WORKDIR /home/dev
ENV HOME /home/dev
ADD vimrc /home/dev/.vimrc
ADD vim /home/dev/.vim
ADD bash_profile /home/dev/.bash_profile
ADD gitconfig /home/dev/.gitconfig

# Link in shared parts of the home directory
# RUN ln -s /var/shared/.ssh
# RUN ln -s /var/shared/.bash_history
# RUN ln -s /var/shared/.maintainercfg

RUN chown -R dev: /home/dev
USER dev
