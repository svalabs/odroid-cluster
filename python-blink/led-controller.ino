#include <Adafruit_NeoPixel.h>

// Which pin on the Arduino is connected to the NeoPixels?
#define PIN1            3 
#define PIN2            6
#define NUMPIXELS       3
// How many NeoPixels are attached to the Arduino?

Adafruit_NeoPixel pixels = Adafruit_NeoPixel(NUMPIXELS, PIN1, NEO_GRB + NEO_KHZ800);
Adafruit_NeoPixel pixels1 = Adafruit_NeoPixel(NUMPIXELS, PIN2, NEO_GRB + NEO_KHZ800);

void setup() {
// initialize serial
Serial.begin(9600);
// This initializes the NeoPixel library.
pixels.begin(); 
pixels1.begin(); 
}

void loop() {

// For a set of NeoPixels the first NeoPixel is 0, second is 1, all the way up to the count of pixels minus one.
// if there's any serial available, read it:
  while (Serial.available() > 0) {

    // look for the next valid integer in the incoming serial stream:
    int pos = Serial.parseInt();
    int red = Serial.parseInt();
    // do it again:
    int green = Serial.parseInt();
    // do it again:
    int blue = Serial.parseInt();

    // look for the newline. That's the end of your sentence:
    if (Serial.read() == '\n') {
      pos = constrain(pos, 0, 5);
      red = constrain(red, 0, 255);
      green = constrain(green, 0, 255);
      blue = constrain(blue, 0, 255);

      if (pos < 3){
        // pixels.Color takes RGB values, from 0,0,0 up to 255,255,255
        pixels.setPixelColor(pos, pixels.Color(red,green,blue));
        pixels.show(); // This sends the updated pixel color to the hardware.
        Serial.print(pos);
      } else {
        pos = pos - 3;
        pixels1.setPixelColor(pos, pixels1.Color(red,green,blue));
        pixels1.show(); // This sends the updated pixel color to the hardware.
        Serial.print(pos);
      }

      }
    }
}
