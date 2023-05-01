FROM node:14
RUN apt-get update
RUN apt-get install -y curl dirmngr apt-transport-https lsb-release ca-certificates
RUN curl -sL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -
RUN bash nodesource_setup.sh
RUN apt-get install nodejs -y

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install 
COPY . .

EXPOSE 8080

CMD ["node", "index.js"]
