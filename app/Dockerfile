FROM node:14.21.1-alpine as build
WORKDIR /src
# ENV PATH /src/app/node_modules/.bin:$PATH
COPY ./package.json ./
COPY ./yarn.lock ./
COPY ./ ./
RUN npm install
RUN npm run build

# production environment
FROM node:alpine

WORKDIR /usr/app
COPY ./package.json ./
COPY ./yarn.lock ./
COPY --from=build /src/build ./build
COPY --from=build /src/public ./public
COPY --from=build /src/server.ts ./
EXPOSE 80
CMD ["npm", "run", "start"]