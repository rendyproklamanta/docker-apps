from flask import Flask
import os

app = Flask(__name__)

# Index route
@app.route("/")
def hello():
    env_value = os.environ.get('ENV')
    return f"<h2 style='color:black'>Ready [{env_value}]</h2>"

if __name__ == "__main__":

   app.run(host='0.0.0.0')