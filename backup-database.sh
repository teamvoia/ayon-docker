#!/bin/bash
# Backup Ayon PostgreSQL database

# DB will be backed up every day at 2 AM UTC
BACKUP_DIR="/mnt/data/Voia Dropbox/Ayon Server/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/db_$TIMESTAMP.sql"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Run pg_dump inside the postgres container
docker exec ayon-docker-postgres-1 pg_dump -U ayon ayon > "$BACKUP_FILE"

# Keep only last 7 days of backups (optional)
find "$BACKUP_DIR" -name "db_*.sql" -mtime +7 -delete

echo "$(date): Database backed up to $BACKUP_FILE" >> /mnt/data/Voia Dropbox/Ayon Server/backup.log