#!/bin/bash

#HELP: Remove bachkups older then 8 days

BACKUP_DIR=/srv/backups
DAYS_TO_RETAIN=8

echo "=== DELETING BACKUPS OLDER THAN $DAYS_TO_RETAIN DAYS ==="
/usr/bin/find $BACKUP_DIR -maxdepth 1 -type d -mtime +$DAYS_TO_RETAIN -exec /bin/rm -rvf {} \;

