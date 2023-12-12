#!/bin/sh

set -e

python manage.py waot_for_db
python manage.py collectstatic --noinput
python manage.py migrate

uwsgi --socket :9000 --workers 4 --master --enable-threads --module ecommerce.wsgi
