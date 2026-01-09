# ===============================
# Build stage
# ===============================
FROM python:3.11-slim AS builder

WORKDIR /app

# Install build dependencies
RUN apt-get update && apt-get install -y gcc && rm -rf /var/lib/apt/lists/*

# Copy dependency file
COPY requirements.txt .

# Install Python dependencies into a separate location
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt


# ===============================
# Runtime stage
# ===============================
FROM python:3.11-slim

# Create non-root user
RUN useradd -m appuser

WORKDIR /app

# Copy installed dependencies from builder
COPY --from=builder /install /usr/local

# Copy application code
COPY app.py .
COPY migrate.py .

# Environment variables
ENV PYTHONUNBUFFERED=1

# Switch to non-root user
USER appuser

# Expose backend port
EXPOSE 5000

# Run migrations first, then start app
CMD ["sh", "-c", "python migrate.py && python app.py"]
