#!/bin/sh
# Post-hook script designed to copying certs from certbot to mailcow containers

# load env variables
. ./.env

# certbot
LE_LIVE="./certs/live/aufy.pl"

echo "[INFO] Copying certs from $LE_LIVE to $MAILCOW_SSL..."

# Copy
cp -f $LE_LIVE/fullchain.pem $MAILCOW_SSL/cert.pem
cp -f $LE_LIVE/privkey.pem $MAILCOW_SSL/key.pem

# Permissions
chmod 600 $MAILCOW_SSL/key.pem
chmod 644 $MAILCOW_SSL/cert.pem

echo "[INFO] Restaring..."
docker restart $(docker ps -qaf name=postfix-mailcow)
docker restart $(docker ps -qaf name=nginx-mailcow)
docker restart $(docker ps -qaf name=dovecot-mailcow)

echo "[INFO] Certs copied successfully and mailcow reloaded."

