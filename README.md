# Tribett

App features request tracking web app with Python and KnockoutJS

## Deployment with Apache2 and MOD_WSGI
1. Install LAMP 
2. Install Python3, Pip and Virtual Environment
3. Install Flask, VirtualEnv, MySQL Connector Client for 
3. Install Git and set up hook to push to server from your local machine. This would be in the post-receive file in the .git folder
```
git --work-tree=/var/www/tribett --git-dir=/var/repo/site.git checkout -f
```
4. Setup MOD_WSGI, let it activate the virtual environment
```
#!/usr/bin/python
import sys
import logging

activate_this = '/var/www/Tribett/Tribett/venv/bin/activate_this.py'
#execfile(activate_this, dict(__file__=activate_this))
exec(compile(open(activate_this).read(), activate_this, 'exec'), dict(__file__=activate_this))

logging.basicConfig(stream=sys.stderr)
sys.path.insert(0,"/var/www/Tribett/Tribett")

from app import app as application
```
5. Setup Apache2 virtual hosts
```
<VirtualHost *:80>
                ServerName 142.93.35.53
                ServerAdmin knightbenax@gmail.com
                WSGIScriptAlias / /var/www/Tribett/tribett.wsgi
                <Directory /var/www/Tribett/Tribett/>
                        Order allow,deny
                        Allow from all
                </Directory>
                Alias /static /var/www/Tribett/Tribett/static
                <Directory /var/www/Tribett/Tribett/static/>
                        Order allow,deny
                        Allow from all
                </Directory>
                ErrorLog ${APACHE_LOG_DIR}/error.log
                LogLevel warn
                CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```
