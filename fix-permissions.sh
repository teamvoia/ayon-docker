#!/bin/bash
# Fix permissions for Ayon Server files so Dropbox can sync them (written by server container as root user) 
# EXCLUDE postgres directory - it needs special permissions for the database to function properly
find "/mnt/data/Voia Dropbox/Ayon Server/" -mindepth 1 -maxdepth 1 ! -name "postgres" -exec chown -R abdel:abdel {} \; 2>/dev/null
echo "$(date): Permission updated" >> /mnt/data/Voia Dropbox/Ayon Server/permissions.log
chown abdel:abdel /mnt/data/Voia Dropbox/Ayon Server/permissions.log 2>/dev/null