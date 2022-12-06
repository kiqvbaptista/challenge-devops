FROM node:16.13.0 as dependencies

WORKDIR ./

COPY * ./

FROM node:16.13.0 as builder

WORKDIR ./

COPY * .

RUN yarn install

RUN yarn build



FROM node:16.13.0 as runner

WORKDIR ./

ENV NODE_ENV production

COPY --from=builder ./public ./public

COPY --from=builder ./node_modules ./node_modules

COPY --from=builder ./apackage.json ./package.json

EXPOSE 80

CMD ["yarn", "start", "-p", "80"]