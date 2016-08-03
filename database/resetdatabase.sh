#!/bin/bash
read -s -p "Enter Password: " mypassword
mysql -u root -p"$mypassword" -e "DROP DATABASE IF EXISTS PiarX4; CREATE DATABASE PiarX4;"
[ ! -z $1 ] && script=migrate_phppos || script=database
mysql -u root -p"$mypassword" -e "USE PiarX4; source $script.sql;"
