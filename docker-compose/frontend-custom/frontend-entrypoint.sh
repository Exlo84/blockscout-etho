#!/bin/bash
set -e

echo "ETHO Frontend - Custom Entrypoint"

# Disable all ad providers
export NEXT_PUBLIC_ADVERT_PROVIDER=none
export NEXT_PUBLIC_AD_BANNER_PROVIDER=none
export NEXT_PUBLIC_COINZILLA_AD_PROVIDER=none
export NEXT_PUBLIC_SLISE_AD_PROVIDER=none

# Ensure logo is set
export NEXT_PUBLIC_NETWORK_LOGO=/app/public/etho-logo.png
export FAVICON_MASTER_URL=/app/public/etho-logo.png

# Create ETHO logo if it doesn't exist (placeholder)
if [ ! -f /app/public/etho-logo.png ]; then
  echo "Note: Logo file not mounted, using default"
fi

# Call original entrypoint
exec ./entrypoint.sh node bin/www
