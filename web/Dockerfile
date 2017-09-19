FROM centos-nodejs

# Labels
LABEL maintainer="vchepeli@redhat.com"
LABEL name="vchepeli/raincatcher-angularjs"
LABEL version="1.0.0"

# Enviornment Variables
ENV NVM_DIR /usr/local/nvm
ENV RAINCATCHER_ANGULARJS_REPO https://github.com/feedhenry-raincatcher/raincatcher-angularjs.git
ENV RAINCATCHER_INSTALL_DIR /opt/raincatcher
ENV RAINCATCHER_BIN_DIR $RAINCATCHER_INSTALL_DIR/bin
ENV RAINCATCHER_CONF_DIR $RAINCATCHER_INSTALL_DIR/conf
ENV RAINCATCHER_LOG_DIR /var/log/raincatcher
ENV RAINCATCHER_PORTAL_PORT 9002
ENV RAINCATCHER_MOBILE_PORT 9003

# Create Raincatcher installation directory
RUN mkdir -p $RAINCATCHER_INSTALL_DIR

# Copy BASH scripts to bin folder
ADD bin/*.sh $RAINCATCHER_BIN_DIR/

RUN chmod -R -v +x $RAINCATCHER_BIN_DIR

# Install raincatcher-angularjs
RUN sh $RAINCATCHER_BIN_DIR/install.sh

EXPOSE $RAINCATCHER_PORTAL_PORT
EXPOSE $RAINCATCHER_MOBILE_PORT

HEALTHCHECK --interval=5s --timeout=5s --retries=12 CMD ["/opt/raincatcher/bin/healthcheck.sh"]
ENTRYPOINT ["/opt/raincatcher/bin/start.sh"]