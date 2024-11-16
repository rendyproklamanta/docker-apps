import os
import time
from flask import Flask, jsonify
from redis import Redis
from dotenv import load_dotenv
from redis_helper import init_redis, get_redis

# Load environment variables from .env file
load_dotenv()

# Initialize Flask app
app = Flask(__name__)

# Initialize Redis on app startup
init_redis(app)

@app.route('/')
def index():
    return jsonify({"message": "Flask app with Redis integration!"})

@app.route('/redis-test')
def redis_test():
    # Perform operations with the redis --------------
    redis_client = get_redis()
    if redis_client:
        try:
            # Perform Redis operations
            redis_client.set('test_key', 'Hello Redis!')  # Test set
            value = redis_client.get('test_key')  # Test get
            return jsonify({"message": f"Redis test: {value}"}), 200
        except Exception as e:
            return jsonify({"error": f"Redis operation failed: {e}"}), 500
    else:
      return jsonify({"error": "Redis not initialized"}), 500
    # END OF operations ----------------------------------------

if __name__ == "__main__":
  app.run(host="0.0.0.0", port=5000)