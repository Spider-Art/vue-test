FROM registry.access.redhat.com/ubi8/nodejs-14:1-46
COPY . /app
WORKDIR /app
RUN npm install
RUN npm run build