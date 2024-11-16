import time
import logging
from redis_conf import get_redis_connection

# Create a logger instance
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    handlers=[
        logging.StreamHandler()
    ]
)

# Initialize Redis connection on startup
def init_redis():
    try:
      get_redis()
    except Exception as e:
        logging.error(f"Error initializing Redis: {e}")

# Retrieve the Redis client
def get_redis():
    max_retries = 5
    retry_count = 0
    
    # Try to get the Redis client
    while retry_count < max_retries:
        try:
            redis_client = get_redis_connection()  # Attempt to reconnect
            if redis_client:
                return redis_client
            else:
                logging.error(f"Error with Redis connection. Retrying... Attempt {retry_count + 1}")
                retry_count += 1
                time.sleep(5)  # Wait a bit before retrying
        except Exception as e:
            logging.error(f"Error with Redis connection. Retrying... Attempt {retry_count + 1}")
            retry_count += 1
            time.sleep(5)  # Wait a bit before retrying
    
    # If the max retry count is reached, log an error and return None
    logging.error("Redis connection failed after maximum retries.")
    return None
