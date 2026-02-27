#!/bin/bash
set -e

# Fix volume permissions - ensure staticfiles directory is writable
# This handles the case where the volume is mounted but owned by root
if [ -d /app/staticfiles ] && [ "$(stat -c '%U' /app/staticfiles)" != "appuser" ]; then
    echo "Fixing staticfiles permissions..."
    sudo chown -R appuser:appuser /app/staticfiles 2>/dev/null || \
    chown -R appuser:appuser /app/staticfiles 2>/dev/null || true
fi

# Start Gunicorn
echo "Starting Gunicorn..."
exec gunicorn --bind "0.0.0.0:8000" --workers 4 --worker-class sync --timeout 120 config.wsgi:application
