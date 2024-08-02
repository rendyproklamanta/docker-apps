# Use the official Python image as base image
FROM python:3-slim

# Install build dependencies
RUN apt-get update && apt-get install -y \
   build-essential \
   libssl-dev \
   libffi-dev \
   supervisor \
   tzdata \
   nginx \
   curl \
   ntp \
   && apt-get clean

# Set timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# Set the working directory in the container
WORKDIR /app

# Install the required dependencies
COPY ./source/requirements.txt /app/requirements.txt

# install the dependencies and packages in the requirements file
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the requirements file into the container
COPY ./source /app
COPY ./conf/production/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/production/default.conf /etc/nginx/conf.d/default.conf 

# Set ENV to the current working directory
ENV PYTHONPATH=/app
ENV FLASK_APP=app.py

# Make the entrypoint script executable
COPY ./conf/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose the port that the Flask app runs on
EXPOSE 80

# Health check to test if the Flask app is running
HEALTHCHECK --interval=5m --start-period=3m --start-interval=30s \
   CMD curl -f http://localhost:5000/healthz || exit 1