FROM node:carbon AS build-env

# Create app directory
WORKDIR /usr/src/app

# Bundle app source
COPY ./package.json .
RUN npm install
COPY ./src src
COPY ./public public
COPY ./elm-package.json .
RUN ./node_modules/.bin/elm-app build

FROM node:carbon
WORKDIR /usr/src/app
COPY --from=build-env /usr/src/app/build .
RUN npm install -g serve
EXPOSE 5000
CMD [ "serve", "-s" ]