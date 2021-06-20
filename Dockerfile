FROM node:12.14.0 as builder

COPY angular-docker /angular-docker

WORKDIR /angular-docker

RUN npm install
RUN npm run build

FROM nginx

COPY --from=builder /angular-docker/dist/* /usr/share/nginx/html/

EXPOSE 80