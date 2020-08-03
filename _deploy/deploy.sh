#!/usr/bin/env bash
set -e # halt script on error

# Update publish branch
STATUS=`git log -1 --pretty=oneline`
cd _site
git config user.name "GitHub Action"
git config user.email "GitHub Action"
git add .
git commit -m "Built by GitHub Action: $STATUS"
git status
GH_REPO="@github.com/adrianba/jekyll-adrianba.net.git"
FULL_REPO="https://$GH_TOKEN$GH_REPO"
git push $FULL_REPO publish:publish