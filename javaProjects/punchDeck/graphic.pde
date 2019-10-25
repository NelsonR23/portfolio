class Graphic {

  int xcord, ycord, height, width,xp, step;



  Graphic() {
    height=0;
    width=0;
    xcord=0;
    ycord=0;
    xp=275;
    step=1;
  }

  void drawRect(int x, int y, int h, int w) {

    rect(x, y, h, w);
  }

  void meter() {
    fill(0);
    rect(350,200,720,80);
    fill(55,255,255);
    textSize(40);
    text("Press Space", 450,200);
    
    fill(130, 0, 0);
    rect(275, 350, 450, 50);
    fill(245, 179, 35);
    rect(425, 350, 150, 50);
    fill(52,234,40);
    rect(490, 350, 20, 50);
    fill(40,45,234);
    
    rect(xp,340,10,70);
    xp+=step;
    if(xp>725){
     xp=725;
     step=-1;
    }
    if(xp<225){
     xp=225;
     step=1;
    }
    
  }
}
