FROM nginx:1.13

ENV SERVICE_ROOT /service
ENV SERVICE_USER service

COPY nginx.conf /etc/nginx/nginx.conf
COPY conf/ /etc/nginx/conf/
COPY certs/ /etc/ssl/certs

RUN groupadd $SERVICE_USER && useradd --create-home --home $SERVICE_ROOT --gid $SERVICE_USER --shell /bin/bash $SERVICE_USER
WORKDIR $SERVICE_ROOT
