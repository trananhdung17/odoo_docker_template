# __author__ = 'trananhdung
# Docker version 18.06.1-ce, build e68fc7a
# Please pull image from tranhdung17/odoo:12.0 intead of build this Docker file

FROM debian:stable

# Install dependencies
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y git curl nodejs npm wkhtmltopdf
RUN npm install -g less

# Get odoo source code
RUN git clone --single-branch -b 12.0 https://github.com/odoo/odoo.git

# Add odoo user
RUN useradd odoo -m
RUN chown odoo:odoo -R /odoo

# Install libs:
RUN apt-get install -y libssl-dev node-gyp npm python3-dev libxml2-dev libxslt1-dev libsasl2-dev libldap2-dev libpq-dev

# Install python packages
RUN curl https://bootstrap.pypa.io/get-pip.py | python3
RUN python3 -m pip install -r /odoo/requirements.txt
RUN python3 -m pip install phonenumbers

USER odoo
CMD 'python3' '/odoo/odoo-bin'
