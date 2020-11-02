FROM centos:centos8 as builder
RUN dnf install -y python3 nodejs
WORKDIR /usr/_app
COPY . .
RUN npm i && npm run build

FROM nginx:alpine
COPY --from=builder /usr/_app/public /usr/share/nginx/html
