# Use the official Ubuntu base image
FROM ubuntu:latest

# Set non-interactive mode for package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache, unzip, and other necessary packages
RUN apt-get update && apt-get install -y \
    apache2 \
    zip \
    unzip

# Add your website files to the container (place them in the same directory as the Dockerfile)
COPY ./your-website-files /var/www/html/

# Start the Apache service
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

# Expose port 80 for HTTP traffic
EXPOSE 80
