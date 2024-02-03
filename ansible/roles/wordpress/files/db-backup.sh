#!/bin/bash

USER="vpuser"
PASSWD="password"
DB="wordpress_db"
DST="/export"

mysqldump $DB > $DST/dump-$(date +\%Y\%m\%d\%H\%M).sql


