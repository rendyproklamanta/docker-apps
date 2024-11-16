import os
from redis.sentinel import Sentinel
from redis import Redis
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# Configuration from .env
REDIS_PASSWORD = os.getenv("REDIS_PASSWORD")
REDIS_MASTER_NAME = os.getenv("REDIS_MASTER_NAME", "mymaster")
SENTINEL_HOST = os.getenv("SENTINEL_HOST", "127.0.0.1")
SENTINEL_PORT = int(os.getenv("SENTINEL_PORT", 26379))
REDIS_DIRECT_HOST = os.getenv("REDIS_DIRECT_HOST", "127.0.0.1")
REDIS_DIRECT_PORT = int(os.getenv("REDIS_DIRECT_PORT", 6379))

# Connect to Redis Sentinel
sentinel = Sentinel(
    [(SENTINEL_HOST, SENTINEL_PORT)],
    socket_timeout=0.1,
    decode_responses=True,
    password=REDIS_PASSWORD,
)

# Get a connection to Redis, using Sentinel if available, or falling back to direct connection
def get_redis_connection():
  try:
    # Try connecting via Sentinel
    master = sentinel.master_for(REDIS_MASTER_NAME, socket_timeout=0.1)
    return master
  except Exception as e:
    try:
      # Fallback: Direct connection to Redis
      direct_redis = Redis(
          host=REDIS_DIRECT_HOST,
          port=REDIS_DIRECT_PORT,
          password=REDIS_PASSWORD,
          decode_responses=True,
          socket_timeout=0.1,
      )
      # Test direct connection
      direct_redis.ping()
      return direct_redis
    except Exception as direct_error:
      return None
