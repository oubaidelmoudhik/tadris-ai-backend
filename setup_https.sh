#!/bin/bash
# ============================================
# HTTPS Setup Script for EC2
# Run this script on your EC2 instance
# ============================================

set -e

DOMAIN="tadris.devagency.ma"
EMAIL="devinstitute.ma@gmail.com"  # Replace with your email
PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "========================================"
echo "HTTPS Setup for $DOMAIN"
echo "========================================"

# Check if running as root
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root (sudo ./setup_https.sh)"
    exit 1
fi

# Install certbot
echo "[1/5] Installing certbot..."
if command -v apt-get &> /dev/null; then
    apt-get update
    apt-get install -y certbot python3-certbot-nginx
elif command -v yum &> /dev/null; then
    yum install -y certbot python3-certbot-nginx
else
    echo "Unsupported package manager. Please install certbot manually."
    exit 1
fi

# Create directory for SSL certificates
echo "[2/5] Creating SSL certificate directory..."
mkdir -p /etc/letsencrypt/live/$DOMAIN

# Stop any running nginx container
echo "[3/5] Stopping nginx container..."
cd "$PROJECT_DIR"
docker compose down || docker-compose down || true

# Get SSL certificate (standalone mode)
echo "[4/5] Getting SSL certificate from Let's Encrypt..."
certbot certonly --standalone \
    -d $DOMAIN \
    --non-interactive \
    --agree-tos \
    --email $EMAIL \
    --force-renewal

# Copy certificates to expected location (if not already there)
echo "[5/5] Setting up certificate files..."

# Start the services
echo "Starting services with HTTPS..."
docker compose up -d

echo ""
echo "========================================"
echo "HTTPS Setup Complete!"
echo "========================================"
echo ""
echo "Your API is now available at:"
echo "  https://$DOMAIN/api/"
echo ""
echo "Frontend should use:"
echo "  NEXT_PUBLIC_API_URL=https://$DOMAIN/api"
echo ""
echo "To test HTTPS:"
echo "  curl -k https://$DOMAIN/api/"
echo ""
echo "========================================"
echo "Auto-renewal is enabled by certbot"
echo "========================================"
