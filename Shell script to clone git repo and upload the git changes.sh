#!/bin/bash

# Configuration
REPO_URL="https://github.com/username/repo.git"  # Replace with the Git repository URL
LOCAL_DIR="repo"  # Local directory to clone the repository
COMMIT_MESSAGE="Updated files"  # Commit message for the changes

# Clone the Git repository
git clone "$REPO_URL" "$LOCAL_DIR"

# Change to the local directory
cd "$LOCAL_DIR"

# Make changes to the files in the repository directory
# Replace the following line with your own commands to modify files

# Stage the changes
git add .

# Commit the changes
git commit -m "$COMMIT_MESSAGE"

# Push the changes to the remote repository
git push origin master
