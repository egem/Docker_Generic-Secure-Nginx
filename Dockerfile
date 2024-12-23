FROM      nginx:1.21.6-alpine

LABEL     Name="Generic Secure NGINX Server"
LABEL     Author="Mae"

WORKDIR   /

ARG       NGINX_PORT
ARG       NGINX_PUBLIC_KEY_PATH
ARG       NGINX_PRIVATE_KEY_PATH
ARG       NGINX_CONFIGURATION_PATH

ENV       NGINX_PORT $NGINX_PORT
ENV       NGINX_PUBLIC_KEY_PATH $NGINX_PUBLIC_KEY_PATH
ENV       NGINX_PRIVATE_KEY_PATH $NGINX_PRIVATE_KEY_PATH
ENV       NGINX_CONFIGURATION_PATH $NGINX_CONFIGURATION_PATH

COPY      nginx.conf.template /etc/nginx/nginx.conf.template

RUN       envsubst '${NGINX_PORT}:${NGINX_PUBLIC_KEY_PATH}:${NGINX_PRIVATE_KEY_PATH}:${NGINX_CONFIGURATION_PATH}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

EXPOSE    ${NGINX_PORT}
