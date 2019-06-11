#!/bin/bash

cd temp_dir
mkdir qrcode

for file in $( ls ); do
	if [ $file == "JOrbs.png" ] || [ $file == "TAGLOGO.png" ] || [ $file == "qrcode" ]; then
		continue 
	fi

	HMAC=`cat -n $file | openssl dgst -sha1 -hmac $2 | awk '{print $2}'`
	# cp $file ../certificates/verifiers
	
	convert xc:none -page A4 ../certificates/${file%.tex}.pdf
	LINK=`dropbox sharelink ../certificates/${file%.tex}.pdf`
	
	cd qrcode
	qrencode -o "${file%.tex}_LINK.png" $LINK
	qrencode -o "${file%.tex}_HMAC.png" $HMAC
	
	sed -i "s/TAGQRLINK.png/qrcode\/${file%.tex}_LINK.png/g" ../$file
	sed -i "s/TAGQRHMAC.png/qrcode\/${file%.tex}_HMAC.png/g" ../$file

	cd ..

	echo "Generateing PDFs..."
	pdflatex $file &> /dev/null
	pdfunite ${file%.tex}.pdf ../certificates/${file%.tex}.pdf	
done








