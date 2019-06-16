# Certificate Generator
System to generate certificates utilizing command line tools.

## Getting Started
These instructions will tell you what do you need to get a copy set and run on your system.


## Prerequisites
Things you need to install to run the script and how install them.

* [Unix/Linux system](https://en.wikipedia.org/wiki/Linux) - Used to run the script  
* [Dropbox](https://www.dropbox.com/) - Used to store the certificates and generate the links 

### Install 
On your Unix/Linux system you will need to install some dependecies.

* [qrencode](https://linux.die.net/man/1/qrencode) - Used generate the qr-codes on the certificate: ```sudo apt-get install qrencode```
* [pdflatex](https://linux.die.net/man/1/pdflatex) - Used to generate the PDF files
* [pdfunite](https://www.manpagez.com/man/1/pdfunite/) - Used to merge PDF files 
* [ssmtp](https://wiki.archlinux.org/index.php/SSMTP) - Used to send the certificates to email:```sudo apt-get install ssmtp```

To send the emails you must configurate the **ssmtp.conf** file:  
Here I use a gmail account:  
> root="email"@gmail.com  
> mailhub=smtp.gmail.com:587  
> AuthUser="email"@gmail.com  
> AuthPass="password"  
> UseSTARTTLS=yes  
> UseTLS=yes  
> FromLineOverride=yes  
> rewriteDomain=gmail.com

Other thing you must do on gmail is to activate the **IMAP** and allow [less secure apps access](https://myaccount.google.com/security).

For your **Dropbox** account you will need to the **sharelink** command, use the link to know how to set up
[sharelink on dropbox](https://askubuntu.com/questions/777878/how-to-integrate-dropbox-in-thunar/777879#777879).

## How to run
In addition to the prerequisites above you will need a CSV file to run the generator, the CSV must have **name**, **family name** and **e-mail** field (Don't forget to make sure that all **.sh** files have execute permissions:```chmod +x <file>.sh```)

Example: 
> ./main.sh <file.csv> \<hmac-key>
 
## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
