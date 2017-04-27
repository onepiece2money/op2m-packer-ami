#!/bin/bash

sudo DEBIAN_FRONTEND=noninteractive apt-get install apache2 php7.0 php7.0-mysql libapache2-mod-php7.0 -y
sudo mkdir -p /var/www/htdocs/public
sudo tee /var/www/htdocs/public/index.html <<EOF
This is template from php7.0
EOF

sudo tee /etc/apache2/sites-available/000-default.conf <<EOF
<VirtualHost *:80>
  DocumentRoot /var/www/htdocs/public

  <Directory /var/www/htdocs/public>
    AllowOverride All
    Order allow,deny
    allow from all
  </Directory>

  ErrorLog \${APACHE_LOG_DIR}/error.log
  CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF

sudo systemctl enable apache2
