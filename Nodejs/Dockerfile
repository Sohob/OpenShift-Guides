FROM node:17.4.0-alpine

# Environment Variables
ENV NODE_ENV development
ENV PORT 8445
ENV APP_ROOT /opt/app-root
ENV HOME /opt/app-root/src
ENV NPM_CONFIG_PREFIX /opt/app-root/src/.npm-global
ENV PATH="/opt/app-root/src/.npm-global/bin:${PATH}"

# Permission fix
RUN mkdir -p /opt/app-root/src &&\
 chown -R node:node /opt/app-root/src
WORKDIR /opt/app-root/src
RUN chgrp -R 0 /opt/app-root/src &&\
 chmod -R g+rwX /opt/app-root/src

# Clean install of packages
COPY package*.json /opt/app-root/src/
RUN npm install &&\
    npm i pm2 -g

# Get rest of the files with user permission
COPY --chown=node:node . /opt/app-root/src

# Used ports
EXPOSE 8445
EXPOSE 4200

# Starting servers
CMD <insert pm2 link command or omit> &&\
    pm2 start NE-Frontend/client.js --name "FE" &&\
    pm2 start NE-Backend/server.js --name "SERVER" &&\
    pm2-runtime start NE-Proxy/proxy.js --name "PROXY"
