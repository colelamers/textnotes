sudo systemctl restart nginx # restart nginx
etc/nginx/nginx.conf # location of config file
/*
server {
    listen 80;
    server_name colelamers.com www.colelamers.com; # handles both domains including subdomains
    root /var/www/html;
    index index.html;

    location / { # don't bother with this on the server because you don't need to point to a new port server side. that is only for local development. no specification points to the the "listen port"
        try_files $uri $uri/ /index.html;
    }

    # Route API requests to the Spring Boot backend
    location /api/blogs {
        proxy_pass http:#localhost:1234/api/blogs;  # Replace with your Spring Boot app's address
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }

    location /api/quotes {
        proxy_pass http:#localhost:1234/api/quotes;  # Replace with your Spring Boot app's address
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}

*/
sudo ufw allow 80/tcp # allow traffic on port 80
sudo ufw allow from 127.0.0.1 to any port 8080 # allows access locally too

# Test nginx config compiles/works
sudo nginx -t
