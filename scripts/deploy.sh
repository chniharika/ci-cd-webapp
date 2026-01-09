#!/bin/bash
set -e

echo "🚀 Starting STAGING deployment..."

echo "📦 Pulling latest Docker images..."
docker pull chniha03/backend-app:latest
docker pull chniha03/frontend-app:latest

echo "🛑 Stopping existing containers..."
docker compose -f docker-compose.staging.yml down

echo "▶️ Starting new containers..."
docker compose -f docker-compose.staging.yml up -d

echo "⏳ Waiting for services to stabilize..."
sleep 10

echo "🗄️ Running database migrations..."
docker exec backend-staging python migrate.py

echo "🔍 Verifying deployment..."
./scripts/health_check.sh

echo "✅ Deployment completed successfully!"
