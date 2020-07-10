#!/bin/sh

###################################
#                                 #
#       Lamp Auto Install         #
#           By Maeve              #
#                                 #
###################################

# Colors Variables

RED='\033[0;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
RESET='\033[0m'

# We're checking if user has the root access

if  [ $(id -u) != 0 ]; then
    clear
    echo "${RED}Error: Please start the script with admin privileges (root)${RESET}"
    exit
fi

echo "-------------------------------"
echo "Lamp Auto Install"
echo "By Maeve (https://github.com/MaeveLaOuf)"
echo "${GREEN}Starting in 5 seconds${RESET}"
echo "-------------------------------"
sleep 5

clear
echo "${BLUE}Packets update${RESET}"
sleep 2
apt update -y

clear

echo "${BLUE}Installing packets needed${RESET}"
sleep 2
apt install wget apt-transport-https lsb-release ca-certificates -y

clear

echo "${BLUE}Installing Apache${RESET}"
sleep 2
apt install apache2 -y

clear

echo "${BLUE}Installing PHP${RESET}"
sleep 2
wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list
apt update -y
apt install php7.4 -y
apt search php7.4 -y

clear

echo "${BLUE}Installing most used php modules${RESET}"
sleep 2
apt install php7.4-cli php7.4-common php7.4-json php7.4-opcache php7.4-mysql php7.4-zip php7.4-fpm php7.4-mbstring -y

clear

echo "${BLUE}Creating default Lamp Auto Install welcome page${RESET}"
sleep 2
echo "Your Web Server Using Lamp Auto Install script has been successfully installed ! Go in phpmyadmin/ to access databases manager." > /var/www/html/index.html

clear

echo "${BLUE}Installing MySQL and phpMyAdmin${RESET}"
sleep 2
apt install mysql-server -y
apt install phpmyadmin -y
ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

clear

echo "Website available at : http://localhost/"
echo "phpMyAdmin available at : http://localhost/phpmyadmin"
echo "Website files here : /var/www/html"

sleep 5

############################
#                          #
#           END            #
#                          #
############################
