#!/usr/bin/env bash
set -e # halt script on error

BASEDIR=$(dirname "$0")
mkdir ~/.lftp
cp $BASEDIR/rc ~/.lftp
cp $BASEDIR/adrianba.net.crt ~/.lftp

lftp -e "mirror -R -p -n -P=20 --verbose=1 ./_site/. beta.adrianba.net/wwwroot/;exit" ftp.adrianba.net -u $LFTP_USER,$LFTP_PASSWORD