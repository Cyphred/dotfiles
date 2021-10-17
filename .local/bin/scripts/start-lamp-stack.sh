# !/bin/sh
# Starts all components of the LAMP stack for web development

if [ "$EUID" -ne 0 ]; then
	echo "This script can only be run with the root user."
	exit 1
fi

# Start apache web server
systemctl start httpd
systemctl start mariadb
