#!/bin/bash

DIRNAME=$1
ARCHIVETYPE=$2
OUTPUTFILE=$3

DIRECTORY="/Users/d.tsvetkova/Desktop/mds/devops/w1/"
ERRORLOG="error.log"
echo "Backup directory is $DIRECTORY"

ARCHIVEFILE="$OUTPUTFILE.$ARCHIVETYPE"

echo "Backing up $DIRNAME to $DIRECTORY$ARCHIVEFILE"
date

touch $DIRECTORY$ERRORLOG
echo "Create error.log $DIRECTORY$ERRORLOG"

tar --create --$ARCHIVETYPE --file $DIRECTORY/$ARCHIVEFILE $DIRNAME

openssl enc -aes256 -base64 -in $DIRECTORY/$ARCHIVEFILE -out $DIRECTORY/$ARCHIVEFILE.enc

echo "Backup finished"
date

exec > /$DIRECTORY$ERRORLOG 2>&1
