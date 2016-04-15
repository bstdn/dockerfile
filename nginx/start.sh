#!/bin/bash

nginx
php5-fpm

tail -f /var/log/nginx/error.log
