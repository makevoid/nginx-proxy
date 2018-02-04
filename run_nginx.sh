#!/usr/bin/env bash

ruby write_vhosts.rb

cp /app/vhost.conf /etc/nginx/conf.d/vhost.conf

nginx -g "daemon off;"
