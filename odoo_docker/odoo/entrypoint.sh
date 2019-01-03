#!/bin/bash

runserver() {
    python3 /odoo/odoo-bin --db_host=$DB_HOST --config=/odoo/odoo-server.conf
}

case "$1" in
    odoo)
        runserver
        ;;
    shell)
        /bin/bash
        ;;
    *)
        exit
        ;;
esac
