#!/bin/bash

CSV_FILE=$1
export IFS=","

echo "Sending emails..."

email_template(){
	TAGUSERNAME=$1
	TAGFULLNAME="$1 $2"
	TAGURL=$3
	{
		echo "Dear $TAGUSERNAME,"
		echo ""
		echo "A PDF certificate has been issued for $TAGFULLNAME."
		echo ""
		echo "You can download it at URL $TAGURL"
		echo ""
		echo "Yours faithfully,"
		echo ""
		echo "Certificados TRPS 2019."
		echo ""
		echo "WARNING: Do NOT reply this message! Your reply will go directly to /dev/null! In other words, nobody will read it! ;-)"

	} >> temp_email.txt
}

for file in $( ls certificates ); do
	echo $file >> temp.txt
done

while read name family_name email; do
	LASTNAME=`echo $family_name | awk '{print $NF}'`
	
	while read line; do
		if [ ${line%.pdf} == $name$LASTNAME ]; then
			URL=`dropbox sharelink certificates/$line`
			email_template $name $family_name $URL
			mail -s "[Certificados TRPS] new PDF  certificate for you" $email < temp_email.txt
			rm temp_email.txt &> /dev/null
		fi
	done <"temp.txt"

done <"$CSV_FILE"

rm temp.txt

