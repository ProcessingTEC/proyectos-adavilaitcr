import controlP5.*;

ControlP5 cp5, cp5_2, cp5_Background, cp5_ColorR, cp5_ColorG, cp5_ColorB;
ControlP5 cp5Co, cp5_2Co, cp5_BackgroundCo, cp5_ColorRCo, cp5_ColorGCo, cp5_ColorBCo;

int TextSize = 100, LineSize = 100, BackGround = 100;
int TextSizeCo = 100, LineSizeCo = 100, BackGroundCo = 100;
int ColorR = 100, ColorG = 100, ColorB = 100;
int ColorRCo = 100, ColorGCo = 100, ColorBCo = 100;

String[] data;
PFont font;
float angleVo, angleCo;

void setup() {
  SetControl();

  size(1200, 800);
  //font = loadFont("Perpetua-BoldItalic-48.vlw");
  font = loadFont("AmericanTypewriter-64.vlw");
  data = loadStrings("Datos.txt");
  
  //angle = data.length;
  angleVo = getTotalVo();
  angleCo = data.length - angleVo;
  smooth();
}

void draw() {
  background(BackGround);

  float offsetVo= map(mouseY, 0, width, 0, PI);
  float offsetCo= map(mouseY, 0, width, 0, -PI);
  int countVo=0, countCo=0;
  for (int i=0; i<data.length; i++) {
    char letterStart = data[i].toLowerCase().charAt(0);
    if(letterStart== 'a' || letterStart== 'e' || letterStart== 'i' || letterStart== 'o' || letterStart== 'u')
    {
      fill(ColorR, ColorG, ColorB);
      stroke(ColorR, ColorG, ColorB);
      textFont(font, TextSize);
      pushMatrix();
      translate(width/2-300, height/2);
      rotate((angleVo*countVo)+offsetVo);
      line(0, 0, LineSize, LineSize);
      text(data[i], LineSize, LineSize);
      popMatrix();
      countVo++;
    }
    else
    {
      fill(ColorRCo, ColorGCo, ColorBCo);
      stroke(ColorRCo, ColorGCo, ColorBCo);
      textFont(font, TextSizeCo);
      pushMatrix();
      translate(width/2+300, height/2);
      rotate(angleCo*countCo+offsetCo);
      line(0, 0, LineSizeCo, LineSizeCo);
      text(data[i], LineSizeCo, LineSizeCo);
      popMatrix();
      countCo++;
    }
  }
}

int getTotalVo()
{
  int total=0;
  for (int i=0; i<data.length; i++)
  {
    char letterStart = data[i].toLowerCase().charAt(0);
    if(letterStart== 'a' || letterStart== 'e' || letterStart== 'i' || letterStart== 'o' || letterStart== 'u')
    total++;
  }
  return total;
}


void SetControl()
{
    
  cp5_Background = new ControlP5(this);
  cp5_Background.addSlider("BackGround")
    .setPosition(1000, 10)
    .setRange(0, 255)
    .setValue(50)
    .setLabel("BackGround")
    ;
    
  cp5 = new ControlP5(this);
  cp5.addSlider("TextSize")
    .setPosition(10, 25)
    .setRange(6, 32)
    .setValue(12)
    .setLabel("Text Size")
    ;
    
    cp5_2 = new ControlP5(this);
  cp5_2.addSlider("LineSize")
    .setPosition(10, 40)
    .setRange(100, 200)
    .setValue(100)
    .setLabel("Line Size")
    ;

  cp5_ColorR = new ControlP5(this);
  cp5_ColorR.addSlider("ColorR")
    .setPosition(10, 10)
    .setRange(0, 255)
    .setValue(150)
    .setLabel("Color R")
    ;
    
  cp5_ColorG = new ControlP5(this);
  cp5_ColorG.addSlider("ColorG")
    .setPosition(150, 10)
    .setRange(0, 255)
    .setValue(150)
    .setLabel("Color G")
    ;
    
  cp5_ColorB = new ControlP5(this);
  cp5_ColorB.addSlider("ColorB")
    .setPosition(285, 10)
    .setRange(0, 255)
    .setValue(150)
    .setLabel("Color B")
    ;
    
/***/

  cp5Co = new ControlP5(this);
  cp5Co.addSlider("TextSizeCo")
    .setPosition(10, 750)
    .setRange(6, 32)
    .setValue(12)
    .setLabel("Text Size")
    ;
    
    cp5_2Co = new ControlP5(this);
  cp5_2Co.addSlider("LineSizeCo")
    .setPosition(10, 765)
    .setRange(100, 200)
    .setValue(100)
    .setLabel("Line Size")
    ;

  cp5_ColorRCo = new ControlP5(this);
  cp5_ColorRCo.addSlider("ColorRCo")
    .setPosition(10, 735)
    .setRange(0, 255)
    .setValue(150)
    .setLabel("Color R")
    ;
    
  cp5_ColorGCo = new ControlP5(this);
  cp5_ColorGCo.addSlider("ColorGCo")
    .setPosition(150, 735)
    .setRange(0, 255)
    .setValue(150)
    .setLabel("Color G")
    ;
    
  cp5_ColorBCo = new ControlP5(this);
  cp5_ColorBCo.addSlider("ColorBCo")
    .setPosition(285, 735)
    .setRange(0, 255)
    .setValue(150)
    .setLabel("Color B")
    ;
}
