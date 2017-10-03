#!/usr/bin/env bash
set -e # halt script on error

bundle exec jekyll build
bundle exec htmlproofer ./_site --disable-external --allow-hash-href --empty-alt-ignore --internal-domains adrianba.net

ls -al ./_site