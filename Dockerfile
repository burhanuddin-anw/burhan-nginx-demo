# Use the official Nginx image as a base
FROM nginx:latest

# Set the working directory to /usr/share/nginx/html
WORKDIR /usr/share/nginx/html

# Copy the HTML file to the Nginx directory
COPY index.html /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Create a new group and user
RUN groupadd shaik && useradd -m -g shaik -d /home/shaik shaik

# Change ownership of necessary directories
RUN chown -R shaik:shaik /var/log/nginx /var/cache/nginx /run

# Define a volume for the HTML content
VOLUME /var/www/html

# Switch to the new user
USER shaik

# Run Nginx in the foreground
ENTRYPOINT ["nginx", "-g", "daemon off;"]
