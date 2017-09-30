#!/bin/bash
set LFTP_HOME=`realpath ./_deploy`
lftp -e "dir adrianba.net/wwwroot;exit" ftp.adrianba.net -u $LFTP_USER --env-password