# ============================================
# Django Backend Dockerfile - Production
# ============================================

FROM python:3.13-slim AS base

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libc-dev \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONFAULTHANDLER=1

# Create app directory
WORKDIR /app

# Copy requirements first for better caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# --------------------------------------------
# Development stage
# --------------------------------------------
FROM base AS development

# Install dev dependencies
RUN pip install --no-cache-dir pytest pytest-django pytest-cov

# Copy source code
COPY . .

# Expose port
EXPOSE 8000

# Run development server
CMD ["python", "manage.py", "runserver", "0.0.0.0"]

# --------------------------------------------
# Production build stage
# --------------------------------------------
FROM base AS production

# Copy source code
COPY . .

# Create directories
RUN mkdir -p /app/staticfiles /app/media /app/output_pdfs

# Make entrypoint script executable
RUN chmod +x /app/entrypoint.sh

# Expose port
EXPOSE 8000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD python -c "import urllib.request; urllib.request.urlopen('http://localhost:8000/api/')" || exit 1

# Run entrypoint script (migrations + collectstatic + gunicorn)
ENTRYPOINT ["/app/entrypoint.sh"]
