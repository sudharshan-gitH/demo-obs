from flask import Flask
import logging
import random
import time

app = Flask(__name__)

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("demo-app")

@app.route("/")
def home():
    delay = random.uniform(0.1, 0.6)
    time.sleep(delay)
    logger.info("Home endpoint called")
    return "Hello from OTel Demo App\n"

@app.route("/error")
def error():
    logger.error("Simulated error occurred")
    return "Error occurred\n", 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
