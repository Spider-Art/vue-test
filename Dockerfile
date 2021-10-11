FROM registry.access.redhat.com/ubi8/nodejs-14:1-46
USER root
COPY . /app
WORKDIR /app
RUN chown -R 1001:0 /app
USER 1001
RUN npm install
RUN npm run build