Mafia-Game-Script
=================
Upload script folder to your web server. 


Copy the files from script folder to the directory you want the game to be in (should be in a root directory).

If on a Unix server, change permissions on the game directory and files to 777. (You can change file permission after completing installation)


Navigate to http://your_website_/install.php (can be installed on subdomain aswell). Follow the instruction and complete the installation.


Copy Down the Cron Info from the installation page.


Login as administrator and Change the settings to your likings.



Setting Up Cron


Go to your control panel and if it’s a Cpanel, log in and scroll down the first page that you come to and click on the “Cron Jobs” link. Choose “Advanced Unix Style.” From there you need to set up cron jobs for the 4 cron files located on your server.The cron info is generated from the installation complete page .


Eg:

*/5 * * * * curl http://yousite.com/cron_run_five.php

* * * * * curl http://yousite.com/cron_run_minute.php

0 * * * * curl http://yousite.com/cron_run_hour.php

0 0 * * * curl http://yousite.com/cron_run_day.php

The values that you should put in each box are seperated by spaces, eg put all the text before the first space in the Minute box, then Hour, then Day, then Month, then Weekday, then finally Command. You will have to Commit Changes and select Advanced (Unix Style) after entering each one to make a new box appear for the next one. (If no cPanel and on a linux server with shell access, use the cron program to import these crons manually. If no cPanel and no linux with shell, you're a bit screwed and should consider changing servers) 

Time based things will work only if the cron jobs has properly set up .

Time based things depends upon cron-jobs such as recovery time , jail function etc ,energy refill etc .

Jail and Hospital - every 1 minute

Users stats such as enery , health refill - every 5 minutes

If you want to refill enery and stats every minutes , do as * * * * * curl http://yousite.com/cron_run_fivemins.php and similarly.

Please note if you have many players its recommend to change the hosting to dedicated server as cron uses extreme resources.



Steps for creating a MySQL Databases with cPanel:

1. Click on the MySQL Databases icon in cPanel.

2. Then, you'll need to create a database and choose a name.
  - Click Create Database
	- Click go back
3. Next, you create a username and password for the database.
	- Create User
	- Click go back
4. Last, you'll want to add the new user to the database.
	- Click Add User To Database with full permissions
	- Click go back
