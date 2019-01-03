# __author__ = 'trananhdung
# Docker version 18.06.1-ce, build e68fc7a

FROM nginx


RUN apt-get update
RUN apt-get install -y gettext-base

RUN rm -f /etc/nginx/conf.d/*

COPY odoo_server.template /etc/nginx/conf.d/

CMD ["/bin/bash", "-c", "envsubst '$ODOO_SERVER' < /etc/nginx/conf.d/odoo_server.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]
