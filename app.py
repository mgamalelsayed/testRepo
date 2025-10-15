from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello from a more advanced Docker container! CHANGED!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
