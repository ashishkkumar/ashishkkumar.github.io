FROM node:14

#RUN yum install curl -y
RUN sudo curl -sL https://rpm.nodesource.com/setup_lts.x | sudo bash -
RUN sudo bash nodesource_setup.sh
RUN sudo yum install -y nodejs

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install 
COPY . .

EXPOSE 8080

CMD ["node", "index.js"]
