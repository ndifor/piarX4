Introduction
------------

PiarX4 is a web based point of sale system written in the PHP language.
It uses MySQL as the data storage back-end and has a simple user interface.

This is the latest version 3.0.0 and it's based on Bootstrap 3 using Bootswatch theme Flatly as default, and CodeIgniter 3.0.6.


Server Requirements
-------------------
PHP version 5.5 or newer is recommended but PHP 7.x is not fully supported yet.

=======

1. OS name and version running your Web Server (e.g. Linux Ubuntu 15.0)
2. Web Server name and version (e.g. Apache 2.4)
3. Database name and version (e.g. =< MySQL 5.6)
4. PHP version (e.g. PHP 5.5)
5. Language selected in PiarX4 (e.g. English, Spanish)
6. Any configuration of PiarX4 that you changed
7. Exact steps to reproduce the issue (test case)
8. Optionally some screenshots to illustrate each step

If above information is not provided in full, your issue will be tagged as pending.
If missing information is not provided within a week we will close your issue.


Local install
-------------
1. Create/locate a new mysql database to install piarX4 into
2. Execute the file database/database.sql to create the tables needed
3. unzip and upload piarX4 files to web server
4. Copy application/config/database.php.tmpl to application/config/database.php
5. Modify application/config/database.php to connect to your database
6. Modify application/config/config.php encryption key with your own
7. Go to your point of sale install via the browser
8. LOGIN using
username: admin 
password:pointofsale
9. Enjoy

