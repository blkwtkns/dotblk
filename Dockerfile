# Dockerfile for testing sh scripting in container
# FROM node:7.10-alpine
FROM alpine:edge
MAINTAINER Blake Watkins "blakemwatkins@gmail.com"
ENV CMAKE_EXTRA_FLAGS=-DENABLE_JEMALLOC=OFF
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk add --update-cache --virtual build-deps --no-cache \
    curl \
    autoconf \
    automake \
    cmake \
    g++ \
    libtool \
    libuv \
    linux-headers \
    lua5.3-dev \
    m4 \
    make \
    unzip \
    libtermkey-dev \
    lua-sec

RUN apk add --update-cache \
    curl \
    git \
    zsh \
    less \
    libtermkey \
    unibilium

RUN apk add --update-cache \
    ruby ruby-irb ruby-rake ruby-io-console ruby-bigdecimal ruby-json ruby-bundler \
    libstdc++ tzdata bash ca-certificates \
    &&  echo 'gem: --no-document' > /etc/gemrc

RUN git clone https://github.com/neovim/libvterm.git && \
    cd libvterm && \
    make && \
    make install && \
    cd ../ && rm -rf libvterm

RUN git clone https://github.com/neovim/neovim.git nvim && \
    cd nvim && \
    make && \
    make install && \
    cd .. && \
    rm -rf nvim && \
    apk del build-deps

# Setup home environment
RUN adduser -S dev
# RUN mkdir /home/dev
RUN chown -R dev: /home/dev
USER dev

WORKDIR /home/dev
ENV HOME /home/dev

# install rust and cargo
RUN curl -sSf https://static.rust-lang.org/rustup.sh | sh
# install ripgrep
RUN cargo install ripgrep
# install coderay
RUN gem install coderay

# Install nvm and newest node version
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
RUN nvm install node

# RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# RUN tmux source-file ~/.tmux.conf
# COPY .tmux.conf /home/dev/
# COPY jsdev.conf /home/dev/.tmux/

# COPY .basevimrc /home/dev/.vimrc
COPY nvim/ /home/dev/.config/
COPY .gitconfig /home/dev/
COPY .eslintrc /home/dev/
COPY .jscsrc /home/dev/
COPY .zshrc /home/dev/
COPY .zsh /home/dev/.zsh

RUN nvim +PlugInstall +qa 

ENV PATH "/root/bin:$PATH"
ENV SHELL /bin/zsh
CMD ["zsh", "-l"]

# ENTRYPOINT nvim
