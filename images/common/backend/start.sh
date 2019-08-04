#!/usr/bin/env bash

if ! [[ "$(ls -A .)" ]]; then
    git clone git@bitbucket.org:savebambi/backend.git .
else echo $(ls -A .)
fi

while ! curl postgres:5432 2>&1 | grep 52
           do
             sleep 1
           done;
              python manage.py collectstatic --no-input --settings=backend.settings.docker_dev;
              python manage.py migrate --settings=backend.settings.docker_dev;
              python manage.py runserver 0.0.0.0:80 --settings=backend.settings.docker_dev;
#              celery worker --app=backend.tasks"