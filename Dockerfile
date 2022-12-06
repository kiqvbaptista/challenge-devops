# FROM node:latest

# WORKDIR /app

# COPY package.json ./

# RUN npm install

# COPY . .

# EXPOSE 80
# ENV PORT 80
# CMD ["npm", "start", "-p", "80"]

FROM nginx:latest


EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]