#!/bin/bash
set -e

echo "⏪ Rolling back to previous stable deployment..."

docker compose -f docker-compose.staging.yml down

echo "⚠️ NOTE: Rollback assumes previous images are already available locally."

docker compose -f docker-compose.staging.yml up -d

echo "✅ Rollback completed"
