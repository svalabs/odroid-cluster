import requests
import random
led = 0

while True:
  print(f"Writing to LED {led}")
  r = random.randint(0, 255)
  g = random.randint(0, 255)
  b = random.randint(0, 255)
  url = f"http://localhost:5000/blink?value={led}.{r}.{g}.{b}"
  requests.get(url)
  led += 1
  led %= 6
