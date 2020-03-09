FROM node:10

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y zip && \
    apt-get clean

ARG RCON_WEB_ADMIN_VERSION=master

ADD https://github.com/lacaulac/rcon-web-admin/archive/${RCON_WEB_ADMIN_VERSION}.zip /tmp/rcon-web-admin.zip

RUN cd /tmp ; unzip /tmp/rcon-web-admin.zip && \
    mv rcon-web-admin-${RCON_WEB_ADMIN_VERSION} /opt/rcon-web-admin && \
    rm /tmp/rcon-web-admin.zip

WORKDIR /opt/rcon-web-admin

RUN npm install && \
    node src/main.js install-core-widgets && \
    chmod 0755 -R startscripts *

EXPOSE 4326 4327

VOLUME ["/opt/rcon-web-admin/db"]

ENTRYPOINT ["/usr/local/bin/node", "src/main.js", "start"]
