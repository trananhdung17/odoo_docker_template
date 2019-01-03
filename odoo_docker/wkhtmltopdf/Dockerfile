# __author__ = 'trananhdung'
# Docker version 18.06.1-ce, build e68fc7a

FROM centos:7.2.1511

RUN yum install -y libpng libjpeg openssl icu libX11 libXext libXrender xorg-x11-fonts-Type1 xorg-x11-fonts-75dpi openssh-server
RUN rpm -ivh https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.1/wkhtmltox-0.12.1_linux-centos7-amd64.rpm
# TODO: copy keys instead of generate keys by `ssh-keygen -A`
RUN ssh-keygen -A
RUN mkdir -p /root/.ssh
COPY ./keys/authorized_keys /root/.ssh/authorized_keys
RUN chown root:root -R /root/.ssh/
RUN chmod og-rw /root/.ssh/authorized_keys
COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["run"]
