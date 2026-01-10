# =========================
# Build stage
# =========================
FROM python:3.11-slim AS builder

WORKDIR /app

# System deps for psycopg2 etc.
RUN apt-get update && apt-get install -y gcc && rm -rf /var/lib/apt/lists/*

# Copy only requirements first (for caching)
COPY requirements.txt .

# Install dependencies to a separate location
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt


# =========================
# Runtime stage
# =========================
FROM python:3.11-slim

# Create non-root user
RUN useradd -m appuser

WORKDIR /app

# Copy installed dependencies from builder
COPY --from=builder /install /usr/local

# Copy application code (including tests)
COPY . .

# Environment settings
ENV PYTHONUNBUFFERED=1

# Fix permissions for pytest cache & app files
RUN chown -R appuser:appuser /app

# Switch to non-root user
USER appuser

# Expose backend port
EXPOSE 5000

# Run migrations first, then start app
CMD ["sh", "-c", "python migrate.py && python app.py"]
