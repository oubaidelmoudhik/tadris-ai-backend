#!/bin/bash
set -e

# Run database migrations
echo "Running database migrations..."
python manage.py migrate --noinput

# Collect static files (for Django admin and static assets)
echo "Collecting static files..."
python manage.py collectstatic --noinput --clear

# Start Gunicorn
echo "Starting Gunicorn..."
exec gunicorn --bind "0.0.0.0:8000" --workers 4 --worker-class sync --timeout 120 config.wsgi:application
