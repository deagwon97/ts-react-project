FROM ubuntu AS builder

RUN apt-get update -y &&\
    apt-get upgrade -y &&\
    apt-get install curl -y &&\
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash - &&\
    apt-get install nodejs -y &&\
    curl -qL https://www.npmjs.com/install.sh | sh

WORKDIR /root/workdir/src

COPY ./src /root/workdir/src

RUN npm i

# USER root
# RUN npm i --only=production
# RUN npm run build

# FROM nginx:latest AS bdg-front-prod
# COPY --from=builder /workdir/src/build /src/build
# COPY ./deploy/front-nginx/front.conf \
#     /etc/nginx/conf.d/default.conf