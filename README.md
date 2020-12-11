
|      Language      | Framework |   Platform   |   Author    |           Owner            |
| ------------------ | --------- |--------------|-------------|----------------------------|
| Python, Bashscript |   Odoo    | Linux, Docker| trananhdung | Elephas Software Solutions |

# Elephas ERP's project template base on Docker

## License
See [LICENSE](LICENSE).

## Usage

First, clone source code from 

```bash
$ cd <path_to_your_project_folder>
$ git clone <git@project-url.git> <project-name>
```

Then build project on docker
```bash
$ cd <project-name>
$ ./manage.sh init
```
**Notes:** After run all services, we need to change value of parameter `web.base.url` in Odoo system parameters
to `http://odoo_12:8069`, then create new parameter named `web.base.url.freeze` with value is `True`
## Manage
Use `manage.sh` to manage docker containers

Syntax: `./manage.sh <command> [service_name]`

Commands:

 - init:                   Initialize all services, this command consist of initdb
 
 - initdb:                 Initialize DB for odoo service
 
 - build:                  Build or rebuild all services
 
 - up:                     Create then run all services
 
 - start [service_name]:   Start a service.
                           If service not define, start all services
                           
 - stop [service_name]:    Stop a service.
                           If service not define, stop all services
                           
 - restart [service_name]: Restart a service.
                           If service not define, restart all services
                           
 - status:                 List services status
 
 - attach <service_name>:  Attach to a service,
                           
 - remove | rm:            Stop and remove all serivces
 
 - update [option]:        Update requirements for odoo service
                           Options: - odoo          Update Odoo source code by pull source code in git
                                    - requirements  Update project's requirements that define in requirements.txt
 
 - clean                   Stop and remove all project's container & network. 
                           But still keep log file (odoo-server.log) and database in ./pg_data
 
 - help:                   Get help on a command

Services:

 - odoo     
 - postgres
 - nginx
 - wk | wkhtmltopdf
 
 ## TODO
 - Add more options (commands) to allow automatically pull, restart, upgrade module in odoo service *(should name is upgrade)*
 - Copy all authentication keys to /etc/ssh/ in "wkhtmltopdf" service instead of generate new keys by `ssh-keygen -A`
 