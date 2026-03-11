#!/bin/bash
# Stop and remove all Blockscout-related containers

CONTAINERS="backend frontend stats stats-db db redis-db visualizer sig-provider nft_media_handler"

echo "Stopping Blockscout containers..."
docker stop -t 15 $CONTAINERS 2>/dev/null
echo "Removing Blockscout containers..."
docker rm $CONTAINERS 2>/dev/null
echo "Done. All Blockscout containers stopped."
