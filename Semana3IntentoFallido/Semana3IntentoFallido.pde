ArrayList<PLine> lines = new ArrayList<PLine>(); 

void setup ()
{
  size(600, 600);  
  
  float a = (mouseX / (float) width) * 90f;
  float radians = radians(a);
  
  PVector vector1 = new PVector(width/2, height-20);
  PVector vector2 = new PVector(width/2, height-120);
  CreateTree(vector1, vector2, radians);
}


void draw()
{
  background(255);
  smooth();
  //rotar segun mouseX, mouseY
  
  for(PLine line:lines) {
        line.DrawLine();
    }
}

void CreateTree(PVector vector1,PVector vector2, float radians)
{
  lines.add(new PLine(vector1, vector2));
  float distance = vector1.dist(vector2);
  println(distance);
  if(distance > 10)
  {
    translate(vector2.x, vector2.y);
    PVector newVector2 = vector2.add(new PVector((distance*0.7), (distance*0.7)));
    newVector2.rotate(radians);
    //newVector2 = newVector2.mult(radians);
    //PVector newVector2 = PVector.fromAngle(radians);
    //newVector2 = newVector2.add(new PVector(100, 100));
    CreateTree(vector2, newVector2,radians);
    
    newVector2 = vector2.add(new PVector((distance*0.7), (distance*0.7)));
    newVector2.rotate(-radians);
    //newVector2 = newVector2.mult(-radians);
    //newVector2 = PVector.fromAngle(-radians);
    //newVector2 = newVector2.add(new PVector(100, 100));
    CreateTree(vector2, newVector2,radians);
  }
}


public class PLine{
  PVector vector1, vector2;
   
  
  public PLine(PVector vector1,PVector vector2)
  {
    this.vector1 = vector1;
    this.vector2 = vector2;
  }
  
  public void DrawLine()
  {
    line(vector1.x, vector1.y,vector2.x, vector2.y);
  }
}