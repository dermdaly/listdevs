#!/bin/bash

# Simple script to list the devices an ipa has been built for
# Copyright © Tapadoo, 2011.  All Rights Reserved
# No warranty is provided for the use of this script
# You are free to modify this for your needs 
LANG=C
LC_CTYPE=C
IPAFILE="$1"
TMPDIR=tmp$$.tmp
mkdir $TMPDIR
unzip -qq "$IPAFILE" -d $TMPDIR
EMBEDFILE=`find $TMPDIR -name embedded.mobileprovision -print | head -1`
EMBEDFILEONLY="${EMBEDFILE}.plist"
sed -n '/plist/,/\/plist/p' "$EMBEDFILE" > "$EMBEDFILEONLY"
sed -n '/ProvisionedDevices/,/\/array/p' "$EMBEDFILEONLY" | grep string | sed 's/<[/]*string>//g'
rm -rf $TMPDIR
