import serial
import sys
ser = serial.Serial('/dev/ttyACM0')  # open serial port
print(ser.name)         # check which port was really used
ser.write(b"\x02\x00\xFF\x00")     # write a string
ser.close()             # close port
