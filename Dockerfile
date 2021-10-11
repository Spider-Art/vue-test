FROM registry.access.redhat.com/ubi8/nodejs-14:1-46 as build
USER root
COPY . /app
WORKDIR /app
RUN chown -R 1001:0 /app
USER 1001
RUN npm install
RUN npm run build

FROM registry.access.redhat.com/ubi8/nginx-118
USER root
RUN mkdir /app
COPY --from=build /app/dist /app
COPY /app/dist /opt/app-root/src/dist
COPY /app /opt/app-root/src
RUN chown -R 1001:0 /var/run/app
USER 1001
CMD ["nginx", "-g", "daemon off;"]