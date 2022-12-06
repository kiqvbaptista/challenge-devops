FROM node:14.21.1-alpine as build
WORKDIR /src
# ENV PATH /src/app/node_modules/.bin:$PATH
COPY ./src/package.json ./
COPY ./src/yarn.lock ./
RUN npm ci --silent
# RUN npm install react-scripts@3.4.1 -g --silent
COPY ./src ./
RUN npm run build

# production environment
FROM node:alpine

WORKDIR /usr/app
COPY ./src/package.json ./
COPY ./src/yarn.lock ./
RUN npm ci --silent
COPY --from=build /src/build ./build
COPY --from=build /src/public ./public
COPY --from=build /src/server.ts ./
EXPOSE 80
CMD ["npm", "run", "start"]