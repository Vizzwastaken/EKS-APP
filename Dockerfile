# Use a lightweight web server image
FROM nginx:alpine

# Copy the HTML file to the web server directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 8080
EXPOSE 80
