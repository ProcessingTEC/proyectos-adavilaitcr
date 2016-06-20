void setup ()
{
  size(600, 600);
  stroke(204, 102, 0);
  strokeWeight(3);
}

void draw()
{
  background(255);
  translate(width/2, height-20);
  float a = (mouseX / (float) width) * 90f;
  // Convert it to radians
  float theta = radians(a);
  branch(120,theta);
  smooth();
}

void branch(float len, float radianes)
{
  line(0, 0, 0, -len);
  if (len>10) {
    pushMatrix();
    translate(0, -len);
    rotate(radianes);
    branch(len*0.7,radianes);
    popMatrix();
    
    pushMatrix();
    translate(0, -len);
    rotate(-radianes);
    branch(len*0.7,radianes);
    popMatrix();
  }
}