# __author__ = 'trananhdung'
# Docker version 18.06.1-ce, build e68fc7a

FROM trananhdung17/odoo:11.0

RUN apt-get update && apt-get install net-tools wget

COPY ./keys/id_ecdsa /home/odoo/.ssh/id_ecdsa
COPY ./keys/id_ecdsa.pub /home/odoo/.ssh/id_ecdsa.pub
COPY ./keys/known_hosts /home/odoo/.ssh/known_hosts
COPY ./wkhtmltopdf/wkhtmltopdf.sh /usr/bin/wkhtmltopdf
COPY ./entrypoint.sh /entrypoint.sh

RUN chown odoo:odoo -R /home/odoo/.ssh
RUN chmod og-rw /home/odoo/.ssh/id_ecdsa
RUN chmod uog+x /usr/bin/wkhtmltopdf

ENTRYPOINT ["/entrypoint.sh"]

USER odoo
CMD ["odoo"]
