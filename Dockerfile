# Use nginx as base image
FROM nginx:alpine

# Copy the application files
COPY src/ /usr/share/nginx/html/

# Copy custom nginx configuration if needed
# COPY docker/nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Add labels for better organization
LABEL maintainer="DevOps Assignment Team"
LABEL version="1.0.0"
LABEL description="DevOps Assignment Application"

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost/ || exit 1

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
