IntersectionOfEllipseAndLine Intersection;

float theta=0.0;
float d=100;
float h=20;
float sr;

float psi=10;

float x1, y1, x2, y2;

void setup() {
  size(1000, 500);
}

void draw() {
  background(255);
  translate(width/2, height/2);

  theta=-mouseX/2;
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

  ellipse(0, 0, 2.0*sr, 2.0*sr);
  ellipse((sr-h)*sin(radians(theta)), 0, d*cos(radians(theta)), d);
strokeWeight(5);
point(x1,y1);
point(x2,y2);
strokeWeight(1);

Intersection.display();

}