#!/bin/bash

mkdir certificates &> /dev/null

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <csv_file> <hmac_key>" 
    exit
fi

./lib/generate_tex_files.sh $1

./lib/generate_pdf_files.sh $1 $2

rm temp_dir -r

# ./lib/send_email.sh $1

echo "Done"








