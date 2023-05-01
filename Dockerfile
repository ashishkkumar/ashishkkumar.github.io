FROM node:14

RUN apt-get install curl -y
RUN curl -sL https://rpm.nodesource.com/setup_lts.x | sudo bash -
RUN bash nodesource_setup.sh
RUN apt-get install nodejs -y

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install 
COPY . .

EXPOSE 8080

CMD ["node", "index.js"]
