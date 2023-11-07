FROM alpine:3.16

# --no-cache to delete packages after they are installed
RUN apk update && apk --no-cache add nginx openssl

# Generate a self-signed SSL certificate
RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -newkey rsa:4096 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -days 365 -subj "/CN=localhost"

# Copy your Nginx configuration file with TLSv1.3 settings
COPY ./conf/nginx.conf /etc/nginx/http.d/

# Create a directory to store your application files inside the container
WORKDIR /usr/share/nginx/html

# Start Nginx in the foreground
# Containers are designed to run a single main process. 
# When this main process exits, the container is considered finished, and it stops. 
# This single-process design aligns with the concept of microservices, 
# where each container is focused on doing one thing well.
# if your Nginx process is running in the foreground (attached), 
# when you want to stop the container, 
# Docker can send the appropriate termination signals to Nginx.
# If Nginx is running in the background (detached),
#  Docker might not be able to manage it effectively.

CMD ["nginx", "-g", "daemon off;"]

# a way to document which ports are intended to be used for network communication.
EXPOSE 443
