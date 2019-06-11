#!/bin/bash

CSV_FILE=$1
export IFS=","

TIPO="Participante"
EVENTO="Comer pizza"
REALIZACAO="Pizzaria"

mkdir temp_dir

cp template/JOrbs.png temp_dir/
cp template/TAGLOGO.png temp_dir/

while read name family_name email; do
	LASTNAME=`echo $family_name | awk '{print $NF}'`
	echo "NOME: $name $LASTNAME E-MAIL: $email"

	cp template/template.tex temp_dir/$name$LASTNAME.tex

	# replace tags on the template.tex file for the inputs of CSV file
	sed -i "s/TAGNOME/$name $family_name/g" temp_dir/$name$LASTNAME.tex
	sed -i "s/TAGTIPO/$TIPO/g" temp_dir/$name$LASTNAME.tex
	sed -i "s/TAGEVENTO/$EVENTO/g" temp_dir/$name$LASTNAME.tex
	sed -i "s/TAGREALIZACAO/$REALIZACAO/g" temp_dir/$name$LASTNAME.tex

done <"$CSV_FILE"
