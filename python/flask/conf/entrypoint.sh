#!/bin/sh
# Function to handle graceful shutdown
graceful_shutdown() {
  echo "Waiting for 1 minute before shutting down..."
  sleep 60
}
# Trap the SIGTERM signal and call the graceful_shutdown function
trap 'graceful_shutdown' SIGTERM
# Start the application in the background
/usr/sbin/ntpd -g && /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf -n &
# Wait for all background processes to finish
wait