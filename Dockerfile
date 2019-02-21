FROM node

WORKDIR /usr/src/app
COPY package*.json .
RUN npm install

COPY . .


# tell docker what port to expose
EXPOSE 8080
CMD ["npm", "start"]
