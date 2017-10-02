#!/usr/bin/env bash
htmlproofer ./_site --disable-external --allow-hash-href --empty-alt-ignore --url-ignore /software/ --internal-domains adrianba.net
