FROM node:14.21.1-alpine as build
WORKDIR /app
# ENV PATH /src/app/node_modules/.bin:$PATH
COPY ./app/src/package.json ./
COPY ./app/src/yarn.lock ./
COPY ./app/public ./
COPY ./app/src ./

RUN yarn build

# production environment
FROM node:alpine

WORKDIR /usr/app
COPY ./src/package.json ./
COPY ./src/yarn.lock ./
COPY --from=build /app/src/build ./build
COPY --from=build /app/public ./public
COPY --from=build /app/src/server.ts ./
EXPOSE 80
CMD ["npm", "run", "start"]