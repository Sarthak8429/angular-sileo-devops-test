# Base image with Node.js and Alpine
FROM node:18-alpine

# Install Nginx
RUN apk add --no-cache nginx

# Install http-server globally
RUN npm install -g http-server

# Create app directory
WORKDIR /app

# Copy built Angular app
COPY udsp-ui /app

# Copy custom Nginx config
RUN rm -rf /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf

# Create required directory for Nginx
RUN mkdir -p /run/nginx

# Expose both ports
EXPOSE 80 8080

# Start http-server and Nginx together
CMD sh -c "http-server /app -p 8080 & nginx -g 'daemon off;'"
