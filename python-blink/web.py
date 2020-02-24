#!flask/bin/python
import serial
import binascii
from flask import request, abort, Flask

ser = serial.Serial('/dev/ttyACM0', write_timeout=1.0)  # open serial port
app = Flask(__name__)

print(ser.name)  # check which port was really used


@app.route('/blink', methods=['GET', 'POST'])
def blink():
    value = request.args.get('value') + '\n'
    values = value.split(".")

    if len(values) != 4:
        abort(400)  # Bad request
        return
    try:
        # Parse as int
        values = list(map(lambda x: int(x, 10), values))
    except ValueError:
	print("bad ints")
        abort(400)  # Bad request
        return

    if values[0] < 0 or values[0] > 5:
	print("invalid led")
        abort(400)  # Bad request
        return

    if not all([0 <= x <= 255 for x in values[1:]]):
        abort(400)
        return

    # print(len(bytearray(values)))
    # ser.write(bytearray(values))
    ser.write(bytearray(values))
    # print("sent")
    print(binascii.hexlify(bytearray(values)))
    # ser.flush()
    return 'ok', 200


app.run(host='0.0.0.0', port=5000)
ser.close()  # close port
