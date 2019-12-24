from flask import Flask, render_template
import datetime
import socket
app = Flask(__name__)

@app.route("/<name>")
def hello(name):
   sys=socket.gethostname()
   now=datetime.datetime.now()
   stime=now.strftime('%A %B, %d %Y %H:%M:%S')
   return render_template('hello.html', name = name, time = stime, system = sys )

if __name__ == "__main__":
 app.run('0.0.0.0',debug=True)

