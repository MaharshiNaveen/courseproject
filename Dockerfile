FROM node16
WORKDIR usrsrcapp
COPY package.json .

RUN npm install
COPY . .

EXPOSE 8080
CMD [ node, server.js ]