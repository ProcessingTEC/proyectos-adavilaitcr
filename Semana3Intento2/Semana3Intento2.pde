ArrayList<PLine> lines; 

void setup ()
{
  size(600, 600);
}


void draw()
{
  background(255);
  stroke(204, 102, 0);
  strokeWeight(3);
  
  lines = new ArrayList<PLine>(); 
  
  float a = (mouseX / (float) 150) * 45f;
  float radians = radians(a);
  
  PVector vector1 = new PVector(width/2, height-120);
  PVector vector2 = new PVector(width/2, height-220);
  CreateTree(vector1, vector2, radians);
  
  for(PLine line:lines) {
        line.DrawLine();
    }
 
}

void CreateTree(PVector vector1,PVector vector2, float radians)
{
  lines.add(new PLine(vector1, vector2));
  float distance = vector1.dist(vector2);
  
  if(distance > 10)
  {
    PVector newVector2 = new PVector(vector2.x, vector2.y);
    newVector2.add(cos(radians)*distance*0.7, sin(radians)*(distance*0.7));
    CreateTree(vector2, newVector2,radians);
    
    newVector2 = new PVector(vector2.x, vector2.y);
    newVector2.add(cos(-radians)*distance*0.7, sin(-radians)*(distance*0.7));
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