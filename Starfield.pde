class Particle {
  double myX, myY, myAngle, mySpeed;
  int myColor;
  Particle() {
    mySpeed = Math.random()* 10;
    myAngle = Math.random()*(2*Math.PI);
    myX = Math.cos(myAngle)*mySpeed + 500;
    myY = Math.sin(myAngle)*mySpeed + 500;
    myColor = color((int)(Math.random()*256),(int)(Math.random()*256), (int)(Math.random()*256));
  }
  void move () {
  myX = myX + Math.cos(myAngle)*mySpeed;
  myY = myY + Math.sin(myAngle)*mySpeed;
}
void show () {
  fill(myColor);
  noStroke();
  ellipse((float)myX, (float)myY, 10, 10);
}
}
class OddballParticle extends Particle {
  int mySize;
  OddballParticle() {
    myX = 500;
    myY = 500;
    mySize = 100;
  }
  void move() {
    myX = myX +(int)(Math.random()*20)-10;
    myY = myY + (int)(Math.random()*20)-10;
    //mySize = mySize + 1;
}
void show () {
  int diam = 0;
float r = 0;
noFill();
while(diam < 50){
  stroke(r,0,0);
  ellipse((float)myX,(float)myY,mySize+diam,mySize+diam);
  diam++;
  r+=255/50.0;
}
}
}
Particle [] one;
void setup () {
  frameRate(300);
  background(255);
  size(1000,1000);
  one = new Particle [500];
  for(int i = 0; i < 1; i++) {
    one[i] = new OddballParticle();
  }
  for(int i = 1; i<one.length; i++ ){
  one [i] = new Particle ();
  }
}
void draw () {
  background(0); //creates no line
  for (int i = 0; i<one.length;i++) {
  one[i].move();
  one[i].show();
  }
  fill(255);
  //ellipse(500,500,50,50);
}
void mousePressed () {
  redraw ();
}
