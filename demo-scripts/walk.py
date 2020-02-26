import requests
import random
import time

led = 0
state = 0

while True:
  print(f"Writing to LED {led}")
  col = [0,0,0]
  col[state] = 255
  url = f"http://localhost:5000/blink?value={led}.{col[0]}.{col[1]}.{col[2]}"
  requests.get(url)
  time.sleep(1)
  url = f"http://localhost:5000/blink?value={led}.0.0.0"
  requests.get(url)
  led += 1
  led %= 6
