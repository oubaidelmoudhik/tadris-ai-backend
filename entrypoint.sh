#!/bin/bash
set -e

# Create necessary directories with proper permissions
mkdir -p /app/staticfiles /app/media /app/output_pdfs
chown -R appuser:appuser /app

# Run database migrations
echo "Running database migrations..."
python manage.py migrate --noinput

# Collect static files (for Django admin and static assets)
echo "Collecting static files..."
python manage.py collectstatic --noinput

# Start Gunicorn
echo "Starting Gunicorn..."
exec gunicorn --bind "0.0.0.0:8000" --workers 4 --worker-class sync --timeout 120 config.wsgi:application
