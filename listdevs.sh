IPAFILE=$1
TMPDIR=tmp$$.tmp
mkdir $TMPDIR
unzip -qq $IPAFILE -d $TMPDIR
EMBEDFILE=`find $TMPDIR -name embedded.mobileprovision -print | head -1`
echo $EMBEDFILE
EMBEDFILEONLY=$EMBEDFILE.plist
sed -n '/plist/,/\/plist/p' $EMBEDFILE > $EMBEDFILEONLY
sed -n '/ProvisionedDevices/,/\/array/p' $EMBEDFILEONLY | grep string | sed 's/<[/]*string>//g'
rm -rf $TMPDIR

