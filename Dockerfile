FROM node:14-alpine

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN npm install --silent
RUN npm install -g serve
RUN npm run build

RUN chmod +x set_env_vars_runtime.sh
RUN chmod +x docker-entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/usr/src/app/docker-entrypoint.sh"]
