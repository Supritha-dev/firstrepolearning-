#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo "=========================================="
echo "Starting Git Automation Script"
echo "=========================================="
echo ""

# Pull latest changes
echo "📥 Pulling latest changes from remote..."
if git pull origin main; then
    echo -e "${GREEN}✓ Pull successful${NC}"
else
    echo -e "${RED}✗ Pull failed${NC}"
    exit 1
fi
echo ""

# Check status
echo "📊 Checking repository status..."
git status
echo ""

# Add all changes
echo "➕ Adding all changes..."
if git add .; then
    echo -e "${GREEN}✓ Files added successfully${NC}"
else
    echo -e "${RED}✗ Failed to add files${NC}"
    exit 1
fi
echo ""

# Check if there are changes to commit
if git diff --staged --quiet; then
    echo -e "${YELLOW}⚠ No changes to commit${NC}"
    echo "=========================================="
    echo "Script completed - Nothing to commit"
    echo "=========================================="
    exit 0
fi

# Commit changes
echo "💾 Committing changes..."
if git commit -m "commit from shell script, it is an automated commit"; then
    echo -e "${GREEN}✓ Commit successful${NC}"
else
    echo -e "${RED}✗ Commit failed${NC}"
    exit 1
fi
echo ""

# Push to remote
echo "🚀 Pushing to remote repository..."
if git push origin main; then
    echo -e "${GREEN}✓ Push successful${NC}"
else
    echo -e "${RED}✗ Push failed${NC}"
    exit 1
fi
echo ""

echo "=========================================="
echo -e "${GREEN}✓ ALL OPERATIONS SUCCESSFUL!${NC}"
echo "=========================================="
echo "Summary:"
echo "  - Pulled latest changes"
echo "  - Added all files"
echo "  - Committed changes"
echo "  - Pushed to origin/main"
echo "=========================================="