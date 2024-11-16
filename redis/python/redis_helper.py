import time
from redis_conf import get_redis_connection

# Initialize Redis connection globally
redis_client = None

# Initialize Redis connection on startup
def init_redis(app):
    global redis_client
    try:
        redis_client = get_redis_connection()
        if redis_client:
            app.logger.info("Redis connection established.")
        else:
            app.logger.error("Failed to connect to Redis.")
    except Exception as e:
        app.logger.error(f"Error initializing Redis: {e}")

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
        except Exception as e:
            print(f"Error with Redis connection. Retrying... Attempt {retry_count + 1}")
            retry_count += 1
            time.sleep(1)  # Wait a bit before retrying
    
    # If the max retry count is reached, log an error and return None
    print("Redis connection failed after maximum retries.")
    return None
