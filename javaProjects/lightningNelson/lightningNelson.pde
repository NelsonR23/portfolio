PImage yoda;
PImage hand;
float wmid=width/2;
float hmid=height/2;
float xcord=800;
float startX=80;
float botY=mouseY;
float topY=300;
float startY=400;
float endX=80;
float endY=400;
float grey=169;
int startTime;


void setup()
{
  size(1200, 800);
  strokeWeight(4);
  background(0);
  yoda=loadImage("yoda.png");
  hand=loadImage("hand.png");
  yoda.resize(500, 500);
  mouseX=500;
  mouseY=100;
}
void draw()
{
  background(0);

  stroke((int)((Math.random()*50)), (int)((Math.random()*195)+150), (int)((Math.random()*256)+245));
  while (endX<mouseX-5 && endY>mouseY-200&&endX<mouseX) {
    endX=startX +(int)((Math.random()*10));
    if(endY<mouseY-50){
      endY=startY+(int)((Math.random()*19));
    }
    else if(endY>mouseY+200){
      endY=startY+(int)(-(Math.random()*19));
    }
    else {
      endY=startY+(int)((Math.random()*19)-9);
    }
    line(startX, startY, endX, endY);
    startX=endX;
    startY=endY;
  }
    startX=80;
    startY=mouseY;
    endX=80;
    endY=400;

  saber();
  image(hand, -20, mouseY-120);
    if(mouseX<1200&&mouseY==100){
    mouseX+=5;
    }
    if(mouseX>900&&mouseY<400){
     mouseY+=5; 
    }
    if(mouseY==400){
     mouseX-=5; 
    }
    if(mouseX==500){
     mouseY-=5; 
    }
  }
    
  void saber() {
    stroke(0, 255, 0);
    line(mouseX, mouseY-50, mouseX, mouseY+150);
    stroke(grey, grey, grey);
    line(mouseX, mouseY+150, mouseX, mouseY+200);
    image(yoda, mouseX-75, mouseY+0);
  }

void reset() {
   startX=80;
   startY=400;
   endX=80;
   endY=400;
}
