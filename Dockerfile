# Use the official NGINX image from Docker Hub
FROM nginx:alpine

# Temporary until we move the mysql server out of this repo.
RUN apk add --no-cache mariadb-client grep

# Remove the default configuration file
RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/conf.d/
RUN chmod 644 /etc/nginx/conf.d/nginx.conf

# COPY docker-compose
COPY docker-compose.yml /docker-compose.yml

COPY entrypoint /entrypoint
RUN chmod 755 /entrypoint


# Expose port 80 to the host
EXPOSE 80

# Start NGINX when the container has provisioned
COPY test.sh /test.sh
RUN chmod +x /test.sh

CMD ["/entrypoint"]
