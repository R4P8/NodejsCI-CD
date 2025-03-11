FROM node:latest
WORKDIR /myapps
ADD . .
RUN npm install
CMD ["node", "index.js"]
