#!/bin/bash

TARGET_DIR=/home/vagrant/projects/ansi-terra-project
ARCHIVE_DIR=/home/vagrant/archives
DAYS=30

TIMESTAMP=$(date +%Y%m%d%H%M%S)

if [ ! -d "$TARGET_DIR" ]; then
    echo "Target directory $TARGET_DIR doesn't exist"
    exit 1
fi

if [ ! -d "$ARCHIVE_DIR" ]; then
    echo "Archive directory $ARCHIVE_DIR doesn't exit. Creating it..."
    mkdir -p "$ARCHIVE_DIR"
fi

# Find files older than specified days, archive, and compress them
ARCHIVE_NAME="archive_$TIMESTAMP.tar.gz"
find "$TARGET_DIR" -type f -mtime +$DAYS -print | tar -czf "$ARCHIVE_DIR/$ARCHIVE_NAME" -T -

# Confirm the archive creation and list its contents
if [ -f "$ARCHIVE_DIR/$ARCHIVE_NAME" ]; then
    echo "Files older than $DAYS days from $TARGET_DIR have been archived into $ARCHIVE_DIR/$ARCHIVE_NAME"
    echo "Contents of the archive:"
    tar -tzf "$ARCHIVE_DIR/$ARCHIVE_NAME"
else
    echo "No files were found older than $DAYS days in $TARGET_DIR, so no archive was created."
fi