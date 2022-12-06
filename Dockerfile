FROM node:16.13.0 as dependencies

WORKDIR ./src

COPY package.json yarn.lock ./

FROM node:16.13.0 as builder

WORKDIR ./src

COPY . .

COPY --from=dependencies ./src/node_modules ./node_modules

RUN yarn build



FROM node:16.13.0 as runner

WORKDIR ./src

ENV NODE_ENV production

COPY --from=builder ./src/public ./public

COPY --from=builder ./src/node_modules ./node_modules

COPY --from=builder ./src/package.json ./package.json

EXPOSE 80

CMD ["yarn", "start", "-p", "80"]