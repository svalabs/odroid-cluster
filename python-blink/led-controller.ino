#include <DigiCDC.h>
#include <Adafruit_NeoPixel.h>

// define pixels ans pins
#define PIN1            2
#define PIN2            0
#define NUMPIXELS       3
Adafruit_NeoPixel pixels = Adafruit_NeoPixel(NUMPIXELS, PIN1, NEO_GRB + NEO_KHZ800);
Adafruit_NeoPixel pixels1 = Adafruit_NeoPixel(NUMPIXELS, PIN2, NEO_GRB + NEO_KHZ800);

int skip = 0;

void setup() {
  // initialize the digital pin as an output.
  SerialUSB.begin();
  
  pixels.begin();
  pixels1.begin();
  pinMode(1, OUTPUT);
}


// the loop routine runs over and over again forever:
void loop() {
  if (SerialUSB.available() && skip < 3) {
    skip++;
    SerialUSB.read();
  }
  if (SerialUSB.available() >= 4) {
  
    
    uint8_t buffer[4]{};

    for(int i = 0; i < 4; i++) {
      buffer[i] = SerialUSB.read();
      SerialUSB.write(buffer[i]);
    }
    
    uint8_t position = buffer[0];

    if(position >= 6) {
      SerialUSB.write(" X");
      SerialUSB.write(position);
      SerialUSB.refresh();
      return;
    }

    const char buf[] = "012345";
    const char pos = buf[position];
    if(position < 3) {
      pixels.setPixelColor(position, pixels.Color(buffer[1], buffer[2], buffer[3]));    
      pixels.show(); // This sends the updated pixel color to the hardware.
    } else {
      position -= 3;
      pixels1.setPixelColor(position, pixels1.Color(buffer[1], buffer[2], buffer[3]));    
      pixels1.show();
    }
  }
  SerialUSB.refresh();
}
