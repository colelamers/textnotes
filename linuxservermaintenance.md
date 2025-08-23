```bash
# Runs jar file, the "&" keeps it running, nohup keeps it running after logout
nohup java -jar /path/to/jar-file.jar &

# Check that nohup process is running
ps -ef | grep java

# Check if a port is occupied; 4000 is the port I'm using here
lsof -i :4000

sudo nano /etc/systemd/system/myapp.service # systemd service, put the below ini content in there
# you do not need nohup and & in the systemd service because it handles it from there
# systemd service file
/*
    [Unit]
    Description=My Spring Boot Application
    After=syslog.target

    [Service]
    User=youruser
    WorkingDirectory=/path/to/your/project
    ExecStart=/usr/bin/java -jar /path/to/your/project/target/my-project-1.0-SNAPSHOT.jar &
    SuccessExitStatus=143
    Restart=always
    StandardOutput=journal
    StandardError=journal

    [Install]
    WantedBy=multi-user.target
*/

# Linux System Service setup
# Setup the system service
sudo nano /etc/systemd/system/colelamerswebsite.service

# Service info you put in on that new service file
/*
    [Unit]
    Description=Spring Boot Website Application
    After=network.target

    [Service]
    User=root
    # Replace "yourusername" with the appropriate user that should run the Spring Boot app
    ExecStart=/usr/bin/java -jar /var/opt/api/colelamerswebsite.jar
    # Replace "/path/to/website.jar" with the full path to the location where your website.jar is stored
    WorkingDirectory=/var/opt/api
    Restart=always
    Environment=JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
    # Set the JAVA_HOME to the correct location based on your system's JDK

    [Install]
    WantedBy=multi-user.target
*/
# Make sure service file is located under /etc/systemd/system/
# example is using colelamerswebsite as the service file (colelamerswebsite.service is filename)
sudo systemctl daemon-reload # start up
sudo systemctl start colelamerswebsite # initialize the service
sudo systemctl enable colelamerswebsite # make it run on boot
sudo systemctl status colelamerswebsite # see if it's running

# Admin actions
sudo systemctl stop colelamerswebsite # stop
sudo systemctl disable colelamerswebsite # stop running on boot
sudo systemctl reload colelamerswebsite # Reload the app with new config files/settings if it uses them
sudo systemctl restart colelamerswebsite # restart service

# check log of system service running.
journalctl -u colelamerswebsite

# view postgres log
sudo tail -f /var/log/postgresql/postgresql-16-main.log

# ## This is how to update the backed to get the backend updated
# Need to update postgres config file to allow access with API credentials
sudo nano /etc/postgresql/16/main/pg_hba.conf

# Add this to the File
# 1. host or local
# 2. username
# 3. database
# 4. A record domain ip address (not the domain name!)
# 5. Encryption type
host    colelamersdotcom    colelamersdotcom    01.234.567.890/80    scram-sha-256


# Upon updating the file, reload the systemctl app

# Review log file for backend app. Replace "myapp" with folder path stated in the application.properties file of the API.
# # Log to a file
# logging.file.name=/var/log/myapp/spring-boot-app.log
sudo tail -f /var/log/myapp/spring-boot-app.log

# NGINX configuration
sudo nano /etc/nginx/nginx.conf

# Example nginx.conf configuration file

user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
    worker_connections 768;
    # multi_accept on;
}

http {

    ##
    # Basic Settings
    ##
    server {
        listen 80; # 80 is generally a default of 127.0.0.1:80
        server_name colelamers.com www.colelamers.com; # handles both domains including subdomains
        root /var/www/html; # Front end location
        index index.html; # main file to point to in location

            location / {
                try_files $uri $uri/ /index.html;
            }

            # Route API requests to the Spring Boot backend
            location /api/blogs {
                proxy_pass http://localhost:1234/api/blogs;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection 'upgrade';
                proxy_set_header Host $host;
                proxy_cache_bypass $http_upgrade;
            }

            location /api/quotes {
                proxy_pass http://localhost:1234/api/quotes;
                proxy_http_version 1.1;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection 'upgrade';
                proxy_set_header Host $host;
                proxy_cache_bypass $http_upgrade;
            }
        }

    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 65;
    types_hash_max_size 2048;
    # server_tokens off;

    # server_names_hash_bucket_size 64;
    # server_name_in_redirect off;

    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    ##
    # SSL Settings
    ##

    ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE
    ssl_prefer_server_ciphers on;

    ##
    # Logging Settings
    ##

    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;

    ##
    # Gzip Settings
    ##

    gzip on;

    # gzip_vary on;
    # gzip_proxied any;
    # gzip_comp_level 6;
    # gzip_buffers 16 8k;
    # gzip_http_version 1.1;
    # gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;

    ##
    # Virtual Host Configs
    ##

    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*;
}


#mail {
#    # See sample authentication script at:
#    # http://wiki.nginx.org/ImapAuthenticateWithApachePhpScript
#
#    # auth_http localhost/auth.php;
#    # pop3_capabilities "TOP" "USER";
#    # imap_capabilities "IMAP4rev1" "UIDPLUS";
#
#    server {
#        listen     localhost:110;
#        protocol   pop3;
#        proxy      on;
#    }
#
#    server {
#        listen     localhost:143;
#        protocol   imap;
#        proxy      on;
#    }
#}
