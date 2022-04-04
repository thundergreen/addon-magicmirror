#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: MagicMirror²
# Configures NGINX for use with MagicMirror²
# ==============================================================================
declare certfile
declare keyfile

# Check SSL requirements, if enabled
bashio::config.require.ssl

# Enable SSL
if bashio::config.true 'ssl'; then
    certfile=$(bashio::config 'certfile')
    keyfile=$(bashio::config 'keyfile')

    sed -i "s/%%certfile%%/${certfile}/g" /etc/nginx/nginx-ssl.conf
    sed -i "s/%%keyfile%%/${keyfile}/g" /etc/nginx/nginx-ssl.conf
fi
