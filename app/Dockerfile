FROM node:14.21.1-alpine as build
WORKDIR /app
# ENV PATH /src/app/node_modules/.bin:$PATH
COPY ./src/package.json ./
COPY ./src/yarn.lock ./
COPY ./src ./
RUN npm install
RUN npm run build

# production environment
FROM node:alpine

WORKDIR /usr/app
COPY ./src/package.json ./
COPY ./src/yarn.lock ./
COPY --from=build /src/build ./build
COPY --from=build /src/public ./public
COPY --from=build /src/server.ts ./
EXPOSE 80
CMD ["npm", "run", "start"]