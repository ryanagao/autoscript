cd

# Node version to be installed
NODE_VERSION=lts

echo ""
echo "|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|"
echo "|  EXECUTING UNIREST_AUTOSCRIPT  |"
echo "|________________________________|"
echo ""
sudo apt-get update

echo ""
echo "|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|"
echo "|  SETTING UP LANGUAGE  |"
echo "|_______________________|"
echo ""
sudo locale-gen "en_US.UTF-8"
sudo su
echo -e 'LANG="en_US.UTF-8" \n LANGUAGE="en_US.UTF-8" \n LC_ALL="en_US:en_US.UTF-8" \n ' > /etc/default/locale
exit

echo ""
echo "|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|"
echo "|  INSTALLING NPM  |"
echo "|__________________|"
echo ""
sudo apt-get install npm -y

echo ""
echo "|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|"
echo "|  INSTALLING N  |"
echo "|________________|"
echo ""
sudo npm install -g n

echo ""
echo "|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|"
echo "|  INSTALLING NODE  |"
echo "|___________________|"
echo ""
sudo n $NODE_VERSION

