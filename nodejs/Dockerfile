FROM centos:${CENTOS_VERSION:-7}

# Labels
LABEL maintainer="vchepeli@redhat.com"
LABEL name="vchepeli/centos-nodejs"
LABEL version="1.0.0"

# Replace shell with bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install base dependencies
RUN yum -y update \
  && yum -y install \
    git \
    ca-certificates \
    curl \
    gcc \
    gcc-c++ \
    make \
    openssl-devel \
    iproute \
    wget \
  && yum clean all

# Default enviornment Variables
ENV NODE_VERSION 6
ENV NVM_DIR /usr/local/nvm
ENV NVM_GIT_URL https://raw.githubusercontent.com/creationix/nvm
ENV NVM_VERSION 0.33.4

# Install NVM
RUN curl -o- $NVM_GIT_URL/v$NVM_VERSION/install.sh | bash \
  && . $NVM_DIR/nvm.sh \
  && nvm install $NODE_VERSION \
  && nvm alias default $NODE_VERSION \
  && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH