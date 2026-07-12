from flask import Flask
import os

app = Flask(__name__)

MESSAGE = os.getenv("APP_MESSAGE", "Default Message")

@app.route("/")
def home():
    return MESSAGE

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
