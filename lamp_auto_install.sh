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
echo '<!DOCTYPE html><html lang="en"><head> <meta charset="UTF-8"> <meta name="viewport" content="width=device-width, initial-scale=1.0"> <title>Lamp Auto Install</title></head><body> <style>*{padding: 0; margin: 0;}body{background-color: rgb(40, 31, 90); color: #fff; font-family: Arial, Helvetica, sans-serif;}a{text-decoration: none; color: #fff;}header{background-color: rgb(23, 16, 63); height: 8vh; display: flex; align-items: center;}header h1{font-size: 3vh; display: flex;}#logo{display: inline-flex; align-items: center; margin-left: 2vw;}#github{height: 7vh;}section{text-align: center;}section h1{margin-top: 2.5vh; font-size: 4vw;}.link{color: rgb(70, 156, 255);}p{font-size: 1.5vw; margin-top: 1vh;}#starter{margin-top: 4vh;}footer{text-align: center; position: fixed; display: flex; width: 100vw; height: 6vh; bottom: 0; background-color: rgb(28, 23, 44); align-items: center; justify-content: center;}footer h2{display: flex;}#about{margin-top: 10vh;}#about img{width: 15vw; border-radius: 50%; margin-top: 4vh; filter: grayscale(1); transition: filter .3s ease, border-radius .3s ease, transform .3s ease;}#about img:hover{filter: grayscale(0); border-radius: 25%; transform: scale(1.1);}#about a:active img{transform: scale(0);}</style> <header> <div id="logo"> <a href="https://github.com/MaeveLaOuf/lamp_auto_install"> <h1>Lamp Auto Install</h1> </a> <img src="https://joshuapenalba.files.wordpress.com/2014/12/github-icon.png?w=1200" id="github" alt=""> </div></header> <section> <h1>Thanks for using Lamp Auto Install !</h1> <div id="starter"> <p>You can now access to your Databases Manager <a href="./phpmyadmin" class="link">here</a></p><p>To edit your website, go to /var/www/html</p></div><div id="about"> <p>Take 2 minutes to take a look at my Github</p><a href="https://github.com/MaeveLaOuf"><img src="https://avatars1.githubusercontent.com/u/67877774?s=460&u=f7517c9aa99f7f8a64b7c9d74228b148902c0d1a&v=4" alt=""></a> </div></section> <footer> <a href="https://github.com/MaeveLaOuf"><h2>©Maeve Industries</h2></a> </footer></body></html>' > /var/www/html/index.html

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
