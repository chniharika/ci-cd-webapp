#!/bin/bash

STATUS=$(curl -s http://localhost:5000/health | grep ok || true)

if [ -z "$STATUS" ]; then
  echo "❌ Health check failed"
  exit 1
else
  echo "✅ Health check passed"
fi
