#!/bin/bash

DIRNAME=$1
ARCHIVETYPE=$2
OUTPUTFILE=$3

DIRECTORY="/Users/d.tsvetkova/Desktop/mds/devops/w1/"
ERRORLOG="error.log"
echo "BACKUP DIRECTORY IS $DIRECTORY"


ARCHIVEFILE="$OUTPUTFILE.$ARCHIVETYPE"

echo "Backing up $DIRNAME to $DIRECTORY$ARCHIVEFILE"
date

touch $DIRECTORY$ERRORLOG
echo "CREATE $DIRECTORY$ERRORLOG"

tar --create --$ARCHIVETYPE --file $DIRECTORY/$ARCHIVEFILE $DIRNAME


openssl enc -aes256 -base64 -in $DIRECTORY/$ARCHIVEFILE -out $DIRECTORY/$ARCHIVEFILE.enc

echo "Backup finished"
date

exec > /$DIRECTORY$ERRORLOG 2>&1