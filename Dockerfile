# __author__ = 'trananhdung
# Docker version 18.06.1-ce, build e68fc7a
# Please pull image from tranhdung17/odoo:11.0 intead of build this Docker file

FROM ubuntu:18.04

# Install dependencies
RUN apt-get update
RUN apt-get install -y git curl libssl1.0-dev nodejs-dev node-gyp npm python3-dev libxml2-dev libxslt1-dev libsasl2-dev libldap2-dev
RUN npm install -g less

# Get odoo source code
RUN git clone --single-branch -b 11.0 https://github.com/odoo/odoo.git

# Add odoo user
RUN useradd odoo -m
RUN chown odoo:odoo -R /odoo

# Install python packages
RUN curl https://bootstrap.pypa.io/get-pip.py | python3
RUN python3 -m pip install -r /odoo/requirements.txt
RUN python3 -m pip install phonenumbers
