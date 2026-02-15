# Docker Local Deployment Script (Windows PowerShell)
# This script pulls and runs your React app from Docker Hub

$DOCKER_USERNAME = $env:DOCKER_USERNAME
$IMAGE_NAME = "react-app"
$PORT = 3000

# Check if Docker is running
try {
    docker ps > $null 2>&1
} catch {
    Write-Host "❌ Docker is not running. Please start Docker Desktop." -ForegroundColor Red
    exit 1
}

# Get Docker username
if ([string]::IsNullOrEmpty($DOCKER_USERNAME)) {
    $DOCKER_USERNAME = Read-Host "Enter your Docker Hub username"
}

$IMAGE_FULL = "docker.io/$DOCKER_USERNAME/$IMAGE_NAME`:latest"

Write-Host "🔄 Pulling latest image from Docker Hub..." -ForegroundColor Cyan
docker pull $IMAGE_FULL

Write-Host "🛑 Stopping any existing containers..." -ForegroundColor Cyan
docker stop react-app-local 2>$null
docker rm react-app-local 2>$null

Write-Host "🚀 Starting React app..." -ForegroundColor Cyan
docker run -d `
    --name react-app-local `
    -p ${PORT}:3000 `
    --restart unless-stopped `
    $IMAGE_FULL

Write-Host ""
Write-Host "✅ React app is running!" -ForegroundColor Green
Write-Host "🌐 Open your browser: http://localhost:$PORT" -ForegroundColor Green
Write-Host ""
Write-Host "📊 View logs: docker logs -f react-app-local" -ForegroundColor Yellow
Write-Host "🛑 Stop app: docker stop react-app-local" -ForegroundColor Yellow
Write-Host "🗑️  Remove container: docker rm react-app-local" -ForegroundColor Yellow
