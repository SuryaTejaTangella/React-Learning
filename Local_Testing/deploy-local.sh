#!/bin/bash

# Docker Local Deployment Script
# This script pulls and runs your React app from Docker Hub

set -e

# Configuration
DOCKER_USERNAME="${DOCKER_USERNAME:-}"
IMAGE_NAME="react-app"
PORT=3000

# Check if Docker is running
if ! docker ps > /dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker Desktop."
    exit 1
fi

# Get Docker username
if [ -z "$DOCKER_USERNAME" ]; then
    read -p "Enter your Docker Hub username: " DOCKER_USERNAME
fi

IMAGE_FULL="docker.io/$DOCKER_USERNAME/$IMAGE_NAME:latest"

echo "🔄 Pulling latest image from Docker Hub..."
docker pull "$IMAGE_FULL"

echo "🛑 Stopping any existing containers..."
docker stop react-app-local 2>/dev/null || true
docker rm react-app-local 2>/dev/null || true

echo "🚀 Starting React app..."
docker run -d \
    --name react-app-local \
    -p $PORT:3000 \
    --restart unless-stopped \
    "$IMAGE_FULL"

echo ""
echo "✅ React app is running!"
echo "🌐 Open your browser: http://localhost:$PORT"
echo ""
echo "📊 View logs: docker logs -f react-app-local"
echo "🛑 Stop app: docker stop react-app-local"
echo "🗑️  Remove container: docker rm react-app-local"
