#!/bin/bash
REPO_DIR="$HOME/lab-githubworkflow"
LOG="$HOME/deploy.log"

cd "$REPO_DIR" || exit 1
git fetch origin main

if [ "$(git rev-parse HEAD)" != "$(git rev-parse origin/main)" ]; then
    echo "[$(date)] Changes detected, pulling..." >> "$LOG"
    git pull origin main >> "$LOG" 2>&1
    echo "[$(date)] Deploy complete" >> "$LOG"
fi
