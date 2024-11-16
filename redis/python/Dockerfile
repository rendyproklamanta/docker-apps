# Use the official Python image as base image
FROM python:3-slim

# Install build dependencies
RUN apt-get update && apt-get install -y \
   build-essential \
   libssl-dev \
   libffi-dev \
   tzdata \
   curl \
   ntp \
   && apt-get clean

# Set timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# Set the working directory in the container
WORKDIR /app

# Install the required dependencies
COPY ./requirements.txt /app/requirements.txt

# install the dependencies and packages in the requirements file
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy all files into the container
COPY . /app

# Set ENV to the current working directory
ENV PYTHONPATH=/app
ENV FLASK_APP=main.py

# Expose the port that the Flask app runs on
EXPOSE 5000