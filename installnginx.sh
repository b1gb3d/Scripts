sudo apt update
# Install nginx
sudo apt install --assume-yes nginx
# Install php
sudo apt install --assume-yes php libapache2-mod-php php-mysql
# Install Additional PHP extensions for WordPress using the command
sudo apt install --assume-yes php-curl php-gd php-xml php-mbstring  php-xmlrpc php-zip php-soap php-intl
sudo ufw allow in "Nginx Full"
exit 0