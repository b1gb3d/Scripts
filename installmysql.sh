#!/bin/bash
sudo apt update
sudo apt install --assume-yes mysql-server
sudo apt install --assume-yes expect

# SET THIS! Avoid quotes/apostrophes in the password, but do use lowercase + uppercase + numbers + special chars
# MYSQL_ROOT_PASSWORD='LaboCloud123()' 

# Build Expect script
# tee ~/secure_our_mysql.sh > /dev/null << EOF
#spawn $(which mysql_secure_installation)
#expect "Enter password for user root:"
#send "$MYSQL_ROOT_PASSWORD\r"

# Would you like to setup VALIDATE PASSWORD plugin?
#expect "Press y|Y for Yes, any other key for No:"
#send "y\r"




#expect "Please enter 0 = LOW, 1 = MEDIUM and 2 = STRONG:"
#send "2\r"

#expect "Change the password for root ? ((Press y|Y for Yes, any other key for No) :"
#send "n\r"

#expect "Remove anonymous users? (Press y|Y for Yes, any other key for No) :"
#send "y\r"

#expect "Disallow root login remotely? (Press y|Y for Yes, any other key for No) :"
#send "y\r"

#expect "Remove test database and access to it? (Press y|Y for Yes, any other key for No) :"
#send "y\r"

#expect "Reload privilege tables now? (Press y|Y for Yes, any other key for No) :"
#send "y\r"

#EOF

# Run Expect script.
# This runs the "mysql_secure_installation" script which removes insecure defaults.
#sudo expect ~/secure_our_mysql.sh

# Cleanup
#rm -v ~/secure_our_mysql.sh # Remove the generated Expect script
#sudo apt-get -qq purge expect > /dev/null # Uninstall Expect, commented out in case you need Expect

#echo "MySQL setup completed. Insecure defaults are gone. Please remove this script manually when you are done with it (or at least remove the MySQL root password that you put inside it."

    
        "commandToExecute": "sudo apt update"
        "commandToExecute": "sudo apt install mysql-server"
        "commandToExecute": "sudo mysql -e 'UPDATE mysql.user SET Password=PASSWORD('LaboCloud123()') WHERE User='adminuser';'"
        "commandToExecute": "sudo mysql -e 'DELETE FROM mysql.user WHERE User='';'"
        "commandToExecute": "sudo mysql -e 'DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');'"
        "commandToExecute": "sudo mysql -e 'DROP DATABASE IF EXISTS test;'"
        "commandToExecute": "sudo mysql -e 'DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';'"
        "commandToExecute": "sudo mysql -e 'FLUSH PRIVILEGES;'"
        "commandToExecute": "sudo mysqld --initialize"