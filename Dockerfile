# Use the official Ubuntu base image
FROM ubuntu:latest

# Set non-interactive mode for package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache, unzip, and other necessary packages
RUN apt-get update && apt-get install -y \
    apache2 \
    unzip \
    wget

# Download the zip file from the specified URL and extract it
WORKDIR /var/www/html
RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip && \
    unzip photogenic.zip && \
    rm photogenic.zip

# Start the Apache service
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

# Expose port 80 for HTTP traffic
EXPOSE 80
