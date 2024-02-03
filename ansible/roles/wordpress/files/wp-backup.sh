#!/bin/bash

USER="vpuser"
PASSWD="password"
DB="wordpress_db"
DST="/export"

tar -czf $DST/wordpress-$(date +\%Y\%m\%d\%H\%M).tar /var/www/html/wordpress

