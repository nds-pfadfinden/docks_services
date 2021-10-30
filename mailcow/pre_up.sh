#!/bin/bash


volumes=('vmail-vol-1' 'vmail-index-vol-1' 'mysql-vol-1' 'mysql-socket-vol-1' 'redis-vol-1' 'rspamd-vol-1' 'solr-vol-1' 'postfix-vol-1' 'crypt-vol-1' 'sogo-web-vol-1' 'sogo-userdata-backup-vol-1')

for volume in "${volumes[@]}"
do
    docker volume create ${volume}
done