#!flask/bin/python
from flask import Flask
import serial
ser = serial.Serial('/dev/ttyUSB0')  # open serial port
app = Flask(__name__)
from flask import Flask
from flask import request

app = Flask(__name__)
print(ser.name)         # check which port was really used
@app.route('/blink', methods=['GET', 'POST'])
def blink():
    value = request.args.get('value') + '\n'
    ser.write(value.encode())     # write a string
    return('ok')
app.run(host='0.0.0.0', port=5000)
ser.close()             # close port
