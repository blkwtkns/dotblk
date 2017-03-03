# Dockerfile for testing sh scripting in container
FROM node:7.6-alpine
MAINTAINER Blake Watkins "blakemwatkins@gmail.com"

RUN apk add --update \
  zsh \
  git \
  less \
  vim 

# Setup home environment
RUN adduser -S dev
# RUN mkdir /home/dev
RUN chown -R dev: /home/dev
USER dev
# RUN mkdir -p /home/dev/go /home/dev/bin /home/dev/lib /home/dev/include
# ENV PATH /home/dev/bin:$PATH
# ENV PKG_CONFIG_PATH /home/dev/lib/pkgconfig
# ENV LD_LIBRARY_PATH /home/dev/lib
# ENV GOPATH /home/dev/go:$GOPATH

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

# RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# RUN tmux source-file ~/.tmux.conf
# COPY .tmux.conf /home/dev/
# COPY jsdev.conf /home/dev/.tmux/

COPY .basevimrc /home/dev/.vimrc
COPY .gitconfig /home/dev/
COPY .eslintrc /home/dev/
COPY .jscsrc /home/dev/
COPY .zshrc /home/dev/
COPY .zsh /home/dev/.zsh

# Link in shared parts of the home directory
# RUN ln -s /var/shared/.ssh
# RUN ln -s /var/shared/.bash_history
# RUN ln -s /var/shared/.maintainercfg
ENV SHELL /bin/zsh
CMD ["zsh", "-l"]
