cd

echo ""
echo "|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|"
echo "|  EXECUTING LARAVEL_AUTOSCRIPT  |"
echo "|________________________________|"
echo ""
sudo apt-get update
export DEBIAN_FRONTEND=noninteractive

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
sudo apt-get install git unzip curl -y

echo ""
echo "|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|"
echo "|  INSTALLING APACHE  |"
echo "|_____________________|"
echo ""
sudo apt-get install apache2 libapache2-mod-php7.2 -y

echo ""
echo "|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|"
echo "|  INSTALLING PHP  |"
echo "|__________________|"
echo ""
sudo apt-get install php7.2 -y
sudo apt-get install php7.2-xml php7.2-gd php7.2-opcache php7.2-mbstring -y

echo ""
echo "|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|"
echo "|  COMPOSER MEMORY SOLUTION  |"
echo "|____________________________|"
echo ""
sudo /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
sudo /sbin/mkswap /var/swap.1
sudo /sbin/swapon /var/swap.1

echo ""
echo "|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|"
echo "|  INSTALLING COMPOSER  |"
echo "|_______________________|"
echo ""
cd /tmp
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo ""
echo "|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|"
echo "|  INSTALLING LARAVEL  |"
echo "|______________________|"
echo ""
cd /var/www/html
sudo composer create-project laravel/laravel laravel-project --prefer-dist

sudo chgrp -R www-data /var/www/html/laravel-project
sudo chmod -R 775 /var/www/html/laravel-project/storage

sudo su
echo '
<VirtualHost *:80>
    # ServerName yourdomain.tld

    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/laravel-project/public

    <Directory /var/www/html/laravel-project>
        AllowOverride All
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
' > /etc/apache2/sites-available/laravel.conf
exit
sudo a2dissite 000-default.conf
sudo a2ensite laravel.conf
sudo a2enmod rewrite
sudo service apache2 restart

echo ""
echo "|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾|"
echo "|  DONE EXECUTING LARAVEL_AUTOSCRIPT  |"
echo "|_____________________________________|"
echo ""