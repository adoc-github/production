#!/usr/bin/env bash


set -e      # Stop Script on Error


# For Debugging (print env. variables into a file)
printenv > /var/log/colony-vars-"$(basename "$BASH_SOURCE" .sh)".txt

echo "Updating System"
apt-get update -y


echo "Installing Apache"
if cd $ ARTIFACTS_PATH; 
    tar -xvf advanced-app.tar.gz;
else
    apt-get install apache2 apache2-utils -y
fi
systemctl enable apache2


echo "Configuring the listening port"
sed -i "s/Listen 80/Listen $port_number/g" /etc/apache2/ports.conf
sed -i "s/80/$port_number /g" /etc/apache2/sites-enabled/000-default.conf
systemctl start apache2
