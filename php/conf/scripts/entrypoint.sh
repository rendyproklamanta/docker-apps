#!/bin/sh

# Function to handle graceful shutdown
graceful_shutdown() {
  echo "Waiting for 30 sec before shutting down..."
  sleep 30
}

# Trap the SIGTERM signal and call the graceful_shutdown function
trap 'graceful_shutdown' SIGTERM

# Start the application in the background
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf -n &

# Wait for all background processes to finish
wait