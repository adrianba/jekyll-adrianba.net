#!/usr/bin/env bash
set -e # halt script on error

if [ -f .cache/.jekyll-metadata ] then
  cp .cache/.jekyll-metadata .
fi

bundle exec jekyll build --incremental
bundle exec htmlproofer ./_site --disable-external --allow-hash-href --empty-alt-ignore --internal-domains adrianba.net

ls -al ./_site