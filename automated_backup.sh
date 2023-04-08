#!/bin/bash

# Configuration
BACKUP_DIR="/path/to/backup/directory"
SOURCE_DIR="/path/to/source/directory"
REMOTE_HOST="user@example.com"
REMOTE_DIR="/path/to/remote/directory"
KEEP_DAYS=7

# Create a timestamp for the backup filename
TIMESTAMP=$(date "+%Y%m%d_%H%M%S")

# Create a compressed tarball of the source directory
tar czf "${BACKUP_DIR}/backup_${TIMESTAMP}.tar.gz" -C "${SOURCE_DIR}" .

# Remove backups older than the KEEP_DAYS setting
find "${BACKUP_DIR}" -type f -name "backup_*.tar.gz" -mtime +${KEEP_DAYS} -exec rm {} \;

# Upload the backup to the remote server
scp "${BACKUP_DIR}/backup_${TIMESTAMP}.tar.gz" "${REMOTE_HOST}:${REMOTE_DIR}"

# Check the exit status and inform the user about the result
if [ $? -eq 0 ]; then
  echo "Backup successfully created and uploaded."
else
  echo "Backup creation or upload failed."
fi
