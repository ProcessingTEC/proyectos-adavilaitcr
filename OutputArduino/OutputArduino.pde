import processing.serial.*;

Serial port;

int lastX=0, lastY=0;

void setup() {
  size(600,600);
  port = new Serial (this, "COM6", 9600);
}

void draw() {
  int mX=mouseX;
  int mY=mouseY;
  if(lastX != mX || lastY != mY)
  {
    port.write(nf(mX)+","+nf(mY)+"\n");
    lastX = mX;
    lastY = mY;
  }
}