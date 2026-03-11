#!/bin/bash
# Start all Blockscout containers using locally built images (no pull from ghcr)

COMPOSE_DIR="/home/exlo/blockscout-etho/docker-compose"

echo "Starting Blockscout stack (local builds only)..."
cd "$COMPOSE_DIR"
docker compose up -d --no-build

echo ""
echo "Waiting for containers to settle..."
sleep 5
docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}" | grep -E "NAME|backend|frontend|stats|db|redis|visualizer|sig-provider"
echo ""
echo "Blockscout stack started. Frontend: http://localhost:3000"
