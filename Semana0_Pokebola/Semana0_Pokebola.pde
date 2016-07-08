void setup(){ 
size(600,600); 
} 
void draw(){ 
background(230); //la diferencia esta en esta linea
//pushMatrix();
translate(mouseX-200,mouseY-200);
stroke(0,0,0);
fill(230,13,13);
arc(200, 200, 300, 300, -PI, 0);

stroke(0,0,0);
fill(255,255,255);
arc(200, 200, 300, 300, 0, PI);

stroke(0,0,0);
fill(52,52,52);
rect(50, 195, 300, 10);

stroke(0,0,0);
fill(52,52,52);
ellipse(200, 200, 70, 70);

stroke(0,0,0);
fill(255,255,255);
ellipse(200, 200, 50, 50);

stroke(0,0,0);
fill(255,255,255);
ellipse(200, 200, 40, 40);
//popMatrix();
}