cd
sudo apt update
sudo locale-gen "en_US.UTF-8"
sudo su
echo -e 'LANG="en_US.UTF-8" \n LANGUAGE="en_US.UTF-8" \n LC_ALL="en_US:en_US.UTF-8" \n ' > /etc/default/locale
exit

