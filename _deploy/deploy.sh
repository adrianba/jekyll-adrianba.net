#!/usr/bin/env bash
set -e # halt script on error

# Update publish branch
STATUS=`git log -1 --pretty=oneline`
cd _site
git config user.name "Travis-CI"
git config user.email "travis-ci"
git add .
git commit -m "Built by Travis-CI: $STATUS"
git status
GH_REPO="@github.com/adrianba/jekyll-adrianba.net.git"
FULL_REPO="https://$GH_TOKEN$GH_REPO"
git push $FULL_REPO publish:publish