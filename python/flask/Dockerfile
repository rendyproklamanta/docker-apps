# Use the official Python image as base image
FROM python:3-alpine

# Install necessary system packages and build dependencies
RUN apk update && apk add --no-cache \
   curl \
   build-base \
   libffi-dev \
   openssl-dev

# Set the working directory in the container
WORKDIR /app

# Install the required dependencies
COPY ./source/requirements.txt /app/requirements.txt

# install the dependencies and packages in the requirements file
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the requirements file into the container
COPY ./source /app

# Set ENV to the current working directory
ENV PYTHONPATH=/app
ENV FLASK_APP=app.py

# Expose the port that the Flask app runs on
EXPOSE 5000

# Health check to test if app is running
HEALTHCHECK --interval=5m --start-period=3m --start-interval=30s \
   CMD curl -f http://localhost:5000/ || exit 1