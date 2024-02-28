
#!/bin/bash

# Define variables
REMOTE_HOST="172.22.130.131"
REMOTE_DIR="/root/backups/"
LOCAL_DIR="/root/backups/"
SSH_PASSWORD="R4ua#YVjJ8HNB3T!LxCS"

# Copy each directory from the remote machine to the local machine
if sshpass -p "$SSH_PASSWORD" scp -r $REMOTE_HOST:$REMOTE_DIR* $LOCAL_DIR; then
    echo "All directories have been successfully backed up."
else
    echo "Error occurred while copying directories."
fi




