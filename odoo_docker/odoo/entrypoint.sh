#!/bin/bash

runserver() {
    python3 /odoo/odoo-bin --db_host=$DB_HOST --config=/odoo/odoo-server.conf
}

update_odoo() {
    cd /odoo && git pull
}

case "$1" in
    odoo)
        runserver
        ;;
    shell)
        /bin/bash
        ;;
    update)
        update_odoo
        ;;
    *)
        exit
        ;;
esac
