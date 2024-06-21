# docks_services
Confguration and Services that run at the docks on docks.pfadfinderei.de.
The Server docks.pfadfinderei.de provide several Services. 
The Services are configure in this Repo.

All Services are explained in the next part.

## wordpress

Wordpress is a Content Management System for hosting Homepages.
The System is based php, which is part of the container.
All actual content is stored in the directory wordpress, which is containing also HTML and files.
This directory is not tracked by git and will safed by general backups.

## pretix

Pretix a software for hosting ticket shops. We have using this Shop for a Registration of our LaPfiLa24. 
The Data of all container are stored on the filesystem and not a docker volume. 

## mailcow

Mailcow is a postfix stack for handle E-Mails, provides IMAP and Webmailer.
The Server is configure in 'mailcow.conf'.
The Stack is configure with the manual: https://mailcow.github.io/mailcow-dockerized-docs/i_u_m_install/

The Mailsever runs on the Domain 'mailcow.pfadfinderei.de'. This is not the E-Mail Address Domain.
The mail server configuration can be accessed at the Hostname mailcow.pfadfinderei.de.
On this Homepage the Maildomains can be configure. 
Every Maildomains needs a MX Record on 'mailcow.pfadfinderei.de'

## Pfaditag Linktree

For the Pfaditag we needed a Linktree.
Therefore a Simple HTML Website is located here. 
In the folder ```./pfaditag24```you can find it. 
With the script install.sh the website can be installed or updated.

# Systemd File

All services are created as systemd services.
The systemd services start and stop the docker environments.  
The service files are located here under 'systemd_services'. To activate a service create a symlink to the appropriate file:

'''
ln -s -v /opt/docks_services/systemd_services/<service>.service /etc/systemd/system/<service>.service
sudo systemctl daemon-reload
'''

# Nginx configs

If nginx configuration is required for the services in the docks, they are defived in nginx_conf. 
To define them at nginx create a link:
'''
 link -s -v /opt/docks_services/nginx_conf/<name>.conf /etc/nginx/sites-available/<name>.conf

'''
Now the site can be activated.
