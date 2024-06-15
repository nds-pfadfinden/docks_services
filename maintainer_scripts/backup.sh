#!/bin/bash

#HELP: Backup important dirs. The backup is uploaded to AWS.

backup_root=/srv/backups/$(date +%Y-%m-%d_%H-%M-%S)
mkdir -p ${backup_root}

# Backup a list of dirs to a tar.gz
# Useage: backupdirs PATH_TO_TAR_GZ LIST_OF_DIRS
backup_dirs () {

  dest_path=$1
  source_list=( $@ )
  # shellcheck disable=SC2124
  source_list=${source_list[@]:1}

  /bin/tar -czf ${dest_path}  --totals ${source_list}

}

backup_paths=( opt etc var/www )
echo "==== Backup to $backup_root ==="

for backup_path in "${backup_paths[@]}";
do
  echo "=== $backup_path ==="

  tar_file="$backup_root/${backup_path////_}.tar.gz"
  backup_dirs $tar_file /$backup_path
done

echo "=== Upload to s3 buckets ==="
/usr/bin/aws --profile s3-login s3 sync $backup_root s3://docks.pfadfinderei.de/ --only-show-errors

echo "=== Done ==="
