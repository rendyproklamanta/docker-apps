import os
from redis.sentinel import Sentinel
from redis import Redis
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Configuration from .env
SENTINEL_MASTER = os.getenv("SENTINEL_MASTER", "mymaster")
SENTINEL_HOST = os.getenv("SENTINEL_HOST")
SENTINEL_PORT = int(os.getenv("SENTINEL_PORT", 26379))
REDIS_DIRECT_HOST = os.getenv("REDIS_DIRECT_HOST")
REDIS_DIRECT_PORT = int(os.getenv("REDIS_DIRECT_PORT", 6379))
REDIS_PASSWORD = os.getenv("REDIS_PASSWORD")

# Connect to Redis Sentinel
sentinel = Sentinel(
    [(SENTINEL_HOST, SENTINEL_PORT)],
    decode_responses=True,
    password=REDIS_PASSWORD,
)

# Get a connection to Redis, using Sentinel if available, or falling back to direct connection
def get_redis_connection():
  if(SENTINEL_HOST):
    master = sentinel.master_for(SENTINEL_MASTER)
    return master
  
  if(REDIS_DIRECT_HOST):
    try:
      # Fallback: Direct connection to Redis
      direct_redis = Redis(
          host=REDIS_DIRECT_HOST,
          port=REDIS_DIRECT_PORT,
          password=REDIS_PASSWORD,
          decode_responses=True,
      )
      # Test direct connection
      direct_redis.ping()
      return direct_redis
    except Exception as direct_error:
      return None