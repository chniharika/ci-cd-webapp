FROM python:3.11-slim

WORKDIR /app

# Copy dependency file
COPY requirements.txt .

# Install dependencies + pytest
RUN pip install --no-cache-dir -r requirements.txt pytest

# Copy application code
COPY . .

EXPOSE 5000

CMD ["python", "app.py"]
