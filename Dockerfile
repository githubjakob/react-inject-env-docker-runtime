FROM node:14-alpine

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN npm install --silent
RUN npm install -g serve
RUN npm run build

EXPOSE 8080

RUN chmod +x docker-entrypoint.sh

ENTRYPOINT ["/usr/src/app/docker-entrypoint.sh"]
