#!/bin/bash

# GitHub Pages Deployment Script
# Usage: ./deploy.sh <github-username> <repo-name> <github-token>

if [ $# -lt 3 ]; then
    echo "Usage: ./deploy.sh <github-username> <repo-name> <github-token>"
    echo "Example: ./deploy.sh myusername rewards-landing ghp_xxxxxxxx"
    exit 1
fi

USERNAME=$1
REPO_NAME=$2
TOKEN=$3

echo "Creating GitHub repository and deploying to GitHub Pages..."

# Initialize git repo
git init

# Create the repository on GitHub
curl -H "Authorization: token $TOKEN" \
     -H "Accept: application/vnd.github.v3+json" \
     -d "{\"name\": \"$REPO_NAME\", \"private\": false, \"auto_init\": false}" \
     https://api.github.com/user/repos

# Add remote
git remote add origin "https://$TOKEN@github.com/$USERNAME/$REPO_NAME.git"

# Add all files
git add .

# Commit
git commit -m "Initial commit: Rewards landing page"

# Push to main
git branch -M main
git push -u origin main

echo "Repository created and code pushed!"
echo ""
echo "Now you need to enable GitHub Pages:"
echo "1. Go to https://github.com/$USERNAME/$REPO_NAME/settings/pages"
echo "2. Under 'Source', select 'Deploy from a branch'"
echo "3. Select 'main' branch and '/ (root)' folder"
echo "4. Click 'Save'"
echo ""
echo "Your site will be available at: https://$USERNAME.github.io/$REPO_NAME/"
