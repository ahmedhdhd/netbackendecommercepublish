FROM mcr.microsoft.com/dotnet/aspnet:8.0

# Install nginx
RUN apt-get update \
    && apt-get install -y nginx \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy your published .NET files
COPY . /app

# Remove the Dockerfile/nginx config from the application area if desired
COPY nginx.conf /etc/nginx/nginx.conf

# Start both nginx and .NET
CMD ["sh", "-c", "dotnet store.dll & nginx -g 'daemon off;'"]