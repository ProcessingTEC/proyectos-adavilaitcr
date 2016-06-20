#include <Servo.h>

Servo servo1, servo2;

int posX = 0, posY = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  servo1.attach(3);
  servo1.detach();
}

void loop() {
  // put your main code here, to run repeatedly:
  int val = map(posX, 0, 600, 0, 180);
  servo1.write(val);
  //delay(50);
}

void serialEvent() {
  if (Serial.available())
  {
    posX = Serial.parseInt();
    posY = Serial.parseInt();

  }
}
