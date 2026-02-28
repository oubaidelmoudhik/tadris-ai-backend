#!/bin/bash
set -e

echo "Waiting for database..."
python -c "
import socket
import time
while True:
    try:
        socket.create_connection(('postgres', 5432), timeout=5)
        break
    except socket.error:
        time.sleep(2)
"

# Run database migrations
echo "Running database migrations..."
python manage.py migrate --noinput

# Collect static files
echo "Collecting static files..."
mkdir -p /app/staticfiles
python manage.py collectstatic --noinput

# Start Gunicorn
echo "Starting Gunicorn..."
exec gunicorn --bind "0.0.0.0:8000" --workers 4 --worker-class sync --timeout 120 config.wsgi:application
