/*Tomas de Camino
  Hackeado por Allan Rodríguez
 */
int nBolas =30;
float [][] bolas = new float[nBolas][2];
boolean capturado = false;
float noiseScale = 0.02;
PImage fantasma, mario, gameover;
 
void setup() {
  size(600, 600);
  noCursor();
  smooth();
  colorMode(HSB, 255, 255, 255);
  for (int i=0;i<nBolas;i++) {
    bolas[i][0]=random(width);
    bolas[i][1]=random(height);
  }
  fantasma = loadImage("fantasma.jpg");
  fantasma.resize(25, 25);
  mario = loadImage("hongo.jpg");
  mario.resize(25, 25);
  gameover = loadImage("gameover.jpg");
}
 
void draw() {
  noStroke();
  background(255);
  fill(116, 255, 255);
  image(mario, mouseX, mouseY);//dibuja la elipse del mouse
  fill(100, 200, 255, 100);
  for (int i=0;i<nBolas;i++) {
    float distancia = sqrt(sq(mouseX-bolas[i][0])+sq(mouseY-bolas[i][1]));
    noStroke();
    image(fantasma, bolas[i][0], bolas[i][1]);
    if(abs(bolas[i][0]-mouseX) < 25 && abs(bolas[i][1]-mouseY) < 25)
    {
      capturado = true;
    }
    if(!capturado)
    {
      if(distancia<200){
       //calcula la nueva posicion de la bola
       strokeWeight(2);
       stroke(131,200,255,100);
       bolas[i][0]+=(mouseX-bolas[i][0])/(i*nBolas);
       bolas[i][1]+=(mouseY-bolas[i][1])/(i*nBolas);
      }
    }
    else
    {
      float noiseVal = noise(mouseX*noiseScale, mouseY*noiseScale);
      background(noiseVal*255,noiseVal*255,noiseVal*255);
      fill(0, 102, 153, 204);
      fill(0);
      imageMode(CENTER);
      image(gameover, mouseX,mouseY);
    }
    
  }
}

void mousePressed() {
  capturado = false;
  for (int i=0;i<nBolas;i++) {
    bolas[i][0]=random(width);
    bolas[i][1]=random(height);
  }
}