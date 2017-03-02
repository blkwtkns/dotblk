#
# Dockerfile for testing sh scripting in container
#

FROM node:7.6-alpine
MAINTAINER Blake Watkins "blakemwatkins@gmail.com"

RUN apk add --update \
  git \
  alpine-sdk build-base\
  libtool \
  automake \
  m4 \
  autoconf \
  linux-headers \
  unzip \
  ncurses ncurses-dev ncurses-libs ncurses-terminfo \
  python \
  python-dev \
  py-pip \
  clang \
  go \
  xz \
  curl \
  make \
  cmake \
  && rm -rf /var/cache/apk/*

RUN git clone https://github.com/neovim/libtermkey.git && \
      cd libtermkey && \
      make && \
      make install && \
      cd ../ && rm -rf libtermkey

RUN git clone https://github.com/neovim/libvterm.git && \
      cd libvterm && \
      make && \
      make install && \
      cd ../ && rm -rf libvterm

RUN git clone https://github.com/neovim/unibilium.git && \
      cd unibilium && \
      make && \
      make install && \
      cd ../ && rm -rf unibilium

RUN  git clone https://github.com/neovim/neovim.git && \
      cd neovim && \
      make && \
      make install && \
      cd ../ && rm -rf nvim

RUN apk add --update \
     xclip\
     tmux \
     zsh \
     exuberant-ctags \
     && rm -rf /var/cache/apk/*

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

RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
RUN tmux source-file ~/.tmux.conf

RUN chsh -s /usr/bin/zsh 

RUN git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

COPY prezScript.sh /home/dev/
RUN prezScript.sh

COPY nvim /home/dev/.config
COPY .tmux.conf /home/dev/
COPY .gitconfig /home/dev/
COPY .eslintrc /home/dev/
COPY .jscsrc /home/dev/
COPY jsdev.conf /home/dev/.tmux/
COPY .zpreztorc /home/dev/
COPY .zprofile /home/dev/
COPY exports.sh /home/dev/

RUN exports.sh
# Link in shared parts of the home directory
# RUN ln -s /var/shared/.ssh
# RUN ln -s /var/shared/.bash_history
# RUN ln -s /var/shared/.maintainercfg


RUN chown -R dev: /home/dev
USER dev
