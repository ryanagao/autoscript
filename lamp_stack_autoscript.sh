cd

# MySQL Password to be used
MYSQL_PASSWORD=ryan1996

echo ""
echo "|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|"
echo "|  EXECUTING LAMP_STACK_AUTOSCRIPT  |"
echo "|___________________________________|"
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
echo "|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|"
echo "|  INSTALLING GIT, UNZIP, CURL  |"
echo "|_______________________________|"
echo ""
sudo apt-get install git, un -y

echo ""
echo "|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|"
echo "|  INSTALLING APACHE  |"
echo "|_____________________|"
echo ""
sudo apt-get install apache2 libapache2-mod-php -y

echo ""
echo "|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|"
echo "|  INSTALLING MYSQL  |"
echo "|____________________|"
echo ""
echo "mysql-server mysql-server/root_password password $MYSQL_PASSWORD" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $MYSQL_PASSWORD" | sudo debconf-set-selections
sudo apt install mysql-server mysql-client -y

echo ""
echo "|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|"
echo "|  INSTALLING PHP  |"
echo "|__________________|"
echo ""
sudo apt-get install php7.2 -y
sudo apt-get install php7.2-cli php7.2-gd php7.2-mysql php7.2-curl php7.2-mbstring php7.2-xml -y
