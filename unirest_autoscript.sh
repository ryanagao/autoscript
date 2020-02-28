# Node version to be installed
NODE_VERSION=lts

cd
echo "|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|"
echo "|  EXECUTING UNIREST_AUTOSCRIPT |"
echo "|_______________________________|"
sudo apt-get update

echo "|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|"
echo "|  SETTING UP LANGUAGE  |"
echo "|_______________________|"
sudo locale-gen "en_US.UTF-8"
sudo su
echo -e 'LANG="en_US.UTF-8" \n LANGUAGE="en_US.UTF-8" \n LC_ALL="en_US:en_US.UTF-8" \n ' > /etc/default/locale
exit

echo "|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|"
echo "|  INSTALLING NPM  |"
echo "|__________________|"
sudo apt-get install npm -y

echo "|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|"
echo "|  INSTALLING N  |"
echo "|________________|"
sudo npm install -g n

echo "|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|"
echo "|  INSTALLING NODE  |"
echo "|___________________|"
sudo n $NODE_VERSION

