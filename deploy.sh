#!/bin/bash
docker-compose up -d --build
check_health() {
  if docker inspect --format='{{.State.Status}}' backend1 | grep -q "running"; then
    echo "✅ Backend1 is runnging"
  else
    echo "❌ Backend1 is failed!"
    exit 1
  fi
  if docker inspect --format='{{.State.Status}}' backend2 | grep -q "running"; then
    echo "✅ Backend2 is runnging"
  else
    echo "❌ Backend2 is failed!"
    exit 1
  fi
}

check_health
echo "🚀 Load-balanced site running on http://localhost:8000!"
