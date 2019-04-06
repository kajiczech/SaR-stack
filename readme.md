#Stack for dronetag platform

This stack contains containers for every element of SaR platform

- Postgres database (default settings)
    - hostname: postgres
    - port: 5432
    - user: sar
    - password: sar 
    - database name: sar
- Nginx reverse proxy
    - config in images/nginx/config/nginx.conf
    - frontend static files accesible at / on port 80
    - routes to other containers from port 80
        - /api     : Django backend
        - /admin   : Django administration
- Django backend
    - python 3.6
    - accesible on port 10080 or \<server>/api
    - administration accesible at \<server>/admin
    - source files in src/backend
    
##Instalation
First you have to have docker client for your operating system installed. Once you have it, just run docker-compose
in the directory with desired stack 

e.g.: 

    cd stacks/local
    docker-compose up -d
After that, all the server should be running and ready and you can develop in src folders.

###Settings
Local stack has `.env` file predefined, dev and prod stack need to have their .env file specified locally.
All variables, which can be shared between containers should be in that file.

To add https support, you have to provide `nginx.cert` and `nginx.key` file to `data/nginx/ssl` directory. Test files with
self-signed certificate are available, you can just rename them. local stack is using the self-signed files by default.


---
##Other
You can access container command line with
    
    docker exec -ti <container> bash 



