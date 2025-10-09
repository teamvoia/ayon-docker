#!/bin/bash
# Fix permissions for Ayon Server files so Dropbox can sync them (written by server container as root user) 
chown -R abdel:abdel "/mnt/data/Voia Dropbox/Ayon Server/" 2>/dev/null