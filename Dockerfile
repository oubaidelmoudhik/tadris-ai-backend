# ============================================
# Django Backend Dockerfile - Production
# ============================================

FROM python:3.13-slim AS base

# Install system dependencies (including Playwright/Chromium for PDF generation)
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libc-dev \
    libpq-dev \
    libglib2.0-0 \
    libnss3 \
    libnspr4 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libxkbcommon0 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    libgbm1 \
    libpango-1.0-0 \
    libcairo2 \
    libasound2 \
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

# Install Playwright and Chromium browser for PDF generation
RUN pip install --no-cache-dir playwright && \
    python -m playwright install chromium

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
