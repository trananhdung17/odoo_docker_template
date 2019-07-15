#!/usr/bin/env bash

install_requirements(){
    echo "Installing project's requirements..."
    docker-compose exec -u root odoo_11 python3 -m pip install -r /requirements.txt
    echo 'Restarting odoo service...'
    docker-compose stop odoo_11
    docker-compose start odoo_11
    echo 'Install requirements done.'
}

init_odoo_db(){
    echo 'Initializing Odoo DB...'
    docker-compose exec -u root postgres_10 psql -U postgres -c "create role odoo with login createdb password 'odoo'"
    docker-compose exec -u root postgres_10 psql -U odoo -d template1 -c "create database odoo"
    echo 'Init DB done.'
}

case "$1" in

    init)
        echo '[logs]' > odoo-server.log
        chmod uog+rw odoo-server.log
        echo 'Building images...'
        docker-compose build
        echo 'Creating containers...'
        docker-compose up -d
        init_odoo_db
        install_requirements
        echo 'INIT PROJECT DONE.'
        ;;

    initdb)
        init_odoo_db
        ;;

    build | rebuild)
        docker-compose stop
        docker-compose rm
        docker-compose build
        ;;

    start | stop | restart)
        case "$2" in
            odoo)
                docker-compose "$1" odoo_11
                ;;
            postgres)
                docker-compose "$1" postgres_10
                ;;
            nginx)
                docker-compose "$1" nginx
                ;;
            wk | wkhtmltopdf)
                docker-compose "$1" wkhtmltopdf
                ;;
            all)
                 docker-compose "$1"
                 ;;
            *)
                cat ./README.md
                ;;
            esac
        ;;
    up)
        docker-compose up -d
        ;;
        
    status)
        docker-compose ps
        ;;
    log)
        tail -f odoo-server.log
        ;;
    attach)
        case "$2" in
            odoo)
                docker-compose exec -u root odoo_11 /bin/bash
                ;;
            postgres)
                docker-compose exec -u root postgres_10 /bin/bash
                ;;
            nginx)
                docker-compose exec -u root nginx /bin/bash
                ;;
            wk | wkhtmltopdf)
                docker-compose exec -u root wkhtmltopdf /bin/bash
                ;;
            *)
                cat ./README.md
                ;;
        esac
        ;;

    update)
        case "$2" in
            odoo)
                docker-compose exec odoo_11 /entrypoint.sh update
                ;;
            requirements)
                echo 'Updating project requirements...'
                install_requirements
                echo 'Done.'
                ;;
            *)
                echo 'Usage: ./manage.sh update <options>'
                echo '    options:'
                echo '        - odoo            Update odoo base source code'
                echo "        - requirements    Update project's requirements defined in requirements.txt"
                ;;
            esac
            ;;
    remove | rm)
        docker-compose stop
        docker-compose rm
        ;;

    clean)
        docker-compose down
        ;;

    *)
        cat ./README.md
        ;;
esac
