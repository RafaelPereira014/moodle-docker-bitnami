#!/bin/bash

# Assuming $1 is the name of the school directory

if [ -z "$1" ]; then
    echo "Usage: $0 <school_directory>"
    exit 1
fi

# Define directories
OLD_DIR="/root/moodle/$1"
NEW_DIR="/root/new_moodle/moodle"
BACKUP_DIR="/root/moodle/${1}_old_version"

# Verify if the school directory exists
if [ ! -d "$OLD_DIR" ]; then
    echo "Error: School directory '$1' does not exist."
    exit 1
fi

# Create a backup of the old version
sudo cp -r "$OLD_DIR" "$BACKUP_DIR"

sudo rm -rf "$OLD_DIR"/*

# Copy new Moodle files to the school directory
sudo cp -r "$NEW_DIR/." "$OLD_DIR"

# Copy config.php from backup to the new directory
cp "$BACKUP_DIR/config.php" "$OLD_DIR"

echo "Upgrade complete for $1"
