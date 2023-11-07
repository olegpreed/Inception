FROM alpine:3.16

# --no-cache to delete packages after they are installed
RUN apk update && apk --no-cache add nginx openssl

# Generate a self-signed SSL certificate
RUN mkdir -p /etc/nginx/ssl
# req: This tells OpenSSL that a certificate signing request (CSR) is being created.
# -x509: This option specifies that a self-signed certificate should be created.
# -nodes: This option means "no des," indicating that the private key should not be encrypted with a passphrase. In production, you might want to add a passphrase for security.
# -days 365: This specifies that the certificate will be valid for 365 days.
# -newkey rsa:4096: This generates a new RSA private key with a length of 4096 bits.
# -keyout /etc/ssl/private/nginx.key: This specifies the path and filename where the private key will be saved.
# -out /etc/ssl/certs/nginx.crt: This specifies the path and filename where the self-signed certificate will be saved.
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
