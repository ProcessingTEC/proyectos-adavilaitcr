//Tomas de Camino Beck

import processing.serial.*;
Serial port;
int x = 1;
String data;
float[] val = new float[2];


void setup() {
  println(Serial.list());
  //Seleccionar puerto de la lista
  port = new Serial(this, "COM6", 9600);
  port.bufferUntil('\n');  //clear the buffer
  size(600, 600);
  
  smooth(2);
  background(247);
  stroke(random(255),random(255),random(255));
  translate(300,0);
}

void draw() {
  fill(val[0],val[1],255,200);
  line(x,(val[0]%300)+150,x++,(val[1]%300)+150);
  if(x==600)
  {
    stroke(random(255),random(255),random(255));
    background(247);
    x=1;
  }
}

void serialEvent(Serial port) {
  data = port.readString();
  String[] list = split(data, ',');
  val[0]=float(list[0]);
  val[1]=float(list[1]);
  
}