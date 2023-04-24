FROM node:18-alpine as production

EXPOSE 3000

ARG NODE_ENV
ENV NODE_ENV production

RUN apk update && apk upgrade
RUN npm install -g @nestjs/cli@9.2.0

RUN mkdir /app
WORKDIR /app

COPY package.json package-lock.json  /app/

RUN npm install

COPY . /app

RUN npm run build

CMD ["node", "dist/main"]