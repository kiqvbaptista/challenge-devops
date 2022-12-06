FROM node:latest

WORKDIR /app

COPY package.json ./

RUN npm install

COPY . .

EXPOSE 80
ENV PORT 80
CMD ["npm", "start", "-p", "80"]