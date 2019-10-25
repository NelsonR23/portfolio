import java.util.Timer;

float x;
float y;
float num;
int total;
int clicked=1;
int avg;
int y2=0;
int r2;
int x4;


void setup()
{
  noLoop();
  size(600, 600);
}
void draw()
{
  textSize(40);
  background(0);
  for (int i=225; i<375; i+=55) {
    for (int j=225; j<375; j+=55) {
      Die d=new Die(i, j);
      d.roll();
      d.show();
    }
  }
  avg+=total;
  fill((int)(Math.random()*255)+50,(int)(Math.random()*255),(int)(Math.random()*255));

  text("Total= "+total, 200, 100);
  text("Average= "+avg/clicked, 175, 150);
  for (int i=0; i<100; i++) {
    if (i>0 && i<25) {
    }
    if (i>25 && i<50) {
    }
    if (i>50 && i<75) {
    }

    i++;
  }
}

//println(avg);
//println(clicked);

void mousePressed()
{
  redraw();
  total=0;
  clicked+=1;
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

class Die //models one single dice cube
{
  //variable declarations here
  Die(int x2, int y2) //constructor
  {
    x=x2;
    y=y2;//variable initializations here
  }
  void roll()
  {
    num=((int)(Math.random()*6)+1);
    //num=3;
    total+=num;
  }
  void show()

  {     
    noStroke();
    fill(255);
    rect(x, y, 50, 50, 10);
    fill(0);
    if (num==1) {
      fill(181, 16, 88);
      ellipse(x+25, y+25, 8, 8);
      pushMatrix();
      noFill();
      stroke(181, 16, 88);
      strokeWeight(2);
      line(275, (375+225/2), 325, (375+225/2));
      popMatrix();
    }
    if (num==2) {
      fill(204, 22, 224);
      ellipse(x+15, y+15, 8, 8);
      ellipse(x+35, y+35, 8, 8);
      pushMatrix();
      noFill();
      stroke(204, 22, 224);
      strokeWeight(2);
      line(275, (375+225/2)-25, 325, (375+225/2)+25);
      line(275, (375+225/2)+25, 325, (375+225/2)-25);
      popMatrix();
    }
    if (num==3) {
      fill(89, 10, 207);
      ellipse(x+12, y+12, 8, 8);
      ellipse(x+25, y+25, 8, 8);
      ellipse(x+38, y+38, 8, 8);
      pushMatrix();
      //translate(width*0.5, height*0.5);
      //rotate(frameCount / 50.0);
      noFill();
      stroke(89, 10, 207);
      strokeWeight(2);
      polygon(300, (375+225/2), 50, 3);
      popMatrix();
    }
    if (num==4) {
      fill(19, 16, 227);
      ellipse(x+15, y+15, 8, 8);
      ellipse(x+35, y+35, 8, 8);
      ellipse(x+35, y+15, 8, 8);
      ellipse(x+15, y+35, 8, 8);
        pushMatrix();
      //translate(width*0.5, height*0.5);
      //rotate(frameCount / 50.0);
      noFill();
      stroke(19, 16, 227);
      strokeWeight(2);
      polygon(300, (375+225/2), 55, 4);
      popMatrix();
    }
    if (num==5) {
      fill(4, 87, 97);
      ellipse(x+13, y+13, 8, 8);
      ellipse(x+38, y+38, 8, 8);
      ellipse(x+38, y+13, 8, 8);
      ellipse(x+13, y+38, 8, 8);
      ellipse(x+25, y+25, 8, 8);
      pushMatrix();
      //translate(width*0.5, height*0.5);
      //rotate(frameCount / 50.0);
      noFill();
      stroke(4, 87, 97);
      strokeWeight(2);
      polygon(300, (375+225/2), 60, 5);
      popMatrix();
    }
    if (num==6) {
      fill(52, 216, 235);
      ellipse(x+13, y+13, 8, 8);
      ellipse(x+38, y+38, 8, 8);
      ellipse(x+38, y+13, 8, 8);
      ellipse(x+13, y+38, 8, 8);
      ellipse(x+38, y+25.5, 8, 8);
      ellipse(x+13, y+25.5, 8, 8);
       pushMatrix();
      //translate(width*0.5, height*0.5);
      //rotate(frameCount / 50.0);
      noFill();
      stroke(52, 216, 235);
      strokeWeight(2);
      polygon(300, (375+225/2), 65, 6);
      popMatrix();
    }
  }
}
