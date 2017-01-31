IntersectionOfEllipseAndLine Intersection;
XyzVector xyz;

float theta=0.0;
float d=100;
float h=20;
float sr;

float psi=0;

float x1, y1, x2, y2;

PFont font;
int textSize=20;

float baseMouseX,baseMouseY;
float startPsi;

void setup() {
  size(1000, 500);
xyz=new XyzVector(100);
  font =loadFont("OCRAExtended-48.vlw");
  textFont(font);
}

void draw() {
  background(0);
  translate(width/2, height/2);

  sr=sq(d)/(8.0*h)+h/2.0;

  Intersection=new IntersectionOfEllipseAndLine(
    d/2.0*cos(radians(theta)), d/2.0, 
    (sr-h)*sin(radians(theta)), 0, 
    tan(radians(psi)), 0);
  Intersection.calculation();

  if (Intersection.isRealNumber()) {
    x1=Intersection.x1();
    y1=Intersection.y1();
    x2=Intersection.x2();
    y2=Intersection.y2();
  }
stroke(255);
noFill();
  ellipse(0, 0, 2.0*sr, 2.0*sr);
  ellipse((sr-h)*sin(radians(theta)), 0, d*cos(radians(theta)), d);
  strokeWeight(5);
  point(x1, y1);
  point(x2, y2);
  strokeWeight(1);

  Intersection.display();
  xyz.display();
  
    textSize(textSize);
  textAlign(LEFT, TOP);
  fill(0,0,255);
  text("1", x1, y1);
  text("2", x2, y2);
  text("theta="+nf(theta,2,2), 0, textSize*1);
    text("psi="+nf(psi,2,2), 0, textSize*2);
    text("startPsi="+nf(startPsi,2,2), 0, textSize*3);

fill(255);
}

void mousePressed(){
if (mouseButton==LEFT){
  baseMouseX=mouseX;
}
if (mouseButton==RIGHT){
  startPsi=degrees(atan((mouseY-height/2.0)/(mouseX-width/2.0)));
}
}

void mouseDragged(){
if (mouseButton==LEFT){
  theta=mouseX-baseMouseX;
}
if (mouseButton==RIGHT){
  psi=degrees(atan((mouseY-height/2.0)/(mouseX-width/2.0)))-startPsi;
}


}