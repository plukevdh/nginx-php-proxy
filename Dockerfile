FROM nginx:1.13

ENV SERVICE_ROOT /service
ENV SERVICE_USER service

RUN groupadd $SERVICE_USER && useradd --create-home --home $SERVICE_ROOT --gid $SERVICE_USER --shell /bin/bash $SERVICE_USER

COPY nginx.conf /etc/nginx/nginx.conf
COPY conf/ $SERVICE_ROOT/conf

RUN chown -R $SERVICE_USER:$SERVICE_USER $SERVICE_ROOT
WORKDIR $SERVICE_ROOT

