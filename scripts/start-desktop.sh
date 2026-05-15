#!/bin/bash
until docker info > /dev/null 2>&1; do
    echo "Waiting for Docker..."
    sleep 2
done
echo "Docker is ready!"
mkdir -p /workspaces/desktop-data
if [ "$(docker ps -aq -f name=mydesktop)" ]; then
    echo "Starting existing container..."
    docker start mydesktop
else
    echo "Creating new desktop container..."
    docker run -d \
        --name=mydesktop \
        -e PUID=1000 \
        -e PGID=1000 \
        -e TZ=Asia/Kolkata \
        -e TITLE="My Desktop" \
        -p 3000:3000 \
        -v /workspaces/desktop-data:/config \
        --shm-size=2gb \
        --restart unless-stopped \
        lscr.io/linuxserver/webtop:ubuntu-kde
fi
echo "Open port 3000 in your browser to access your desktop"
sleep 10
if [ -f /workspaces/desktop-data/my-apps.txt ]; then
    docker exec mydesktop bash /config/install-saved-apps.sh
fi
echo "Done! Your desktop is ready."