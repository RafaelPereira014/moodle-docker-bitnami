#!/bin/bash

# Function to list Docker containers with names containing "moodle" along with their IDs
docker_ps_moodle() {
    # Loop through Docker containers with names containing "moodle"
    docker ps --format "{{.ID}}\t{{.Names}}" | grep 'moodle' | while read -r id name; do
        docker_path="/bitnami/moodle/backup/$name"

        # Check if the directory exists in the container
        if docker exec "$id" test -d "$docker_path"; then
            # Copy the directory from the container to the local backup directory
            sudo docker cp "$id:$docker_path" "/root/backups/$name"
            echo "Copy of container $id:$name done."
        else
            echo "Directory $docker_path is not found in container $id."
        fi
    done
}

# Call the function
echo "Starting the copy of containers..."
docker_ps_moodle
