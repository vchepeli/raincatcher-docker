FROM centos:7

# Labels
LABEL maintainer="vchepeli@redhat.com"
LABEL name="vchepeli/raincatcher-angularjs"
LABEL version="1.0.0"

# Enviornment Variables
ENV NODE_VERSION 6
ENV NVM_DIR /usr/local/nvm
ENV RAINCATCHER_ANGULARJS_REPO https://github.com/feedhenry-raincatcher/raincatcher-angularjs.git
ENV RAINCATCHER_INSTALL_DIR /opt/raincatcher
ENV RAINCATCHER_BIN_DIR $RAINCATCHER_INSTALL_DIR/bin
ENV RAINCATCHER_CONF_DIR $RAINCATCHER_INSTALL_DIR/conf
ENV RAINCATCHER_LOG_DIR /var/log/raincatcher
ENV WEB_PORTAL_PORT 9002
ENV WEB_MOBILE_PORT 9003

# RUN yum -y update; yum clean all
# RUN yum -y install epel-release; yum clean all
# RUN yum -y install git curl gcc-c++ make; yum clean all
RUN yum -y update && yum -y install git && yum clean all

# Install NVM
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash \
  && . $NVM_DIR/nvm.sh \
  && nvm install $NODE_VERSION \
  && nvm alias default $NODE_VERSION

# Create Raincatcher installation directory
RUN mkdir -p $RAINCATCHER_INSTALL_DIR

# Copy BASH scripts to bin folder
COPY bin/* $RAINCATCHER_BIN_DIR/

# Install raincatcher-angularjs
RUN sh $RAINCATCHER_BIN_DIR/install.sh \
  && chmod +x $RAINCATCHER_BIN_DIR/start.sh

EXPOSE $WEB_PORTAL_PORT $WEB_MOBILE_PORT
# ENTRYPOINT["/opt/raincatcher/bin/start.sh"]