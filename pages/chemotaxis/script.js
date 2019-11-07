'use strict'
var good;
var bad;
var bac;
var ran, gspeed, bspeed;
var col, die;
//declare bacteria variables here   
 function setup()   
{     
  //initialize bacteria variables here
  col=false;
  die=false;
  ran=(int)((Math.random()*10));
  gspeed=4;
  bspeed=3;
  createCanvas(800, 800);
  good=[];
  for (var i=0; i<20; i++) {
    good[i]=new Bacteria(750, 750);
  }
  bad=[];
  for (var i=0; i<100; i++) {
    bad[i]=new Bacteria(50, 50);
  }
}   
function draw()   
{    
  frameRate(60);
  //move and show the bacteria
  background(0);
  for (var i=0; i<good.length; i++) {
    //  b=new ArrayList <Bacteria>();
    fill(255, 0, 0);
    if (!col) {
      fill(0, 150, 0);
    }
    good[i].show();
    good[i].move(gspeed);
    good[i].die();
  }
  for (var i=0; i<bad.length; i++) {
    //  b=new ArrayList <Bacteria>();
    if (!col) {
      fill(255, 0, 0);
    }
    bad[i].show();
    bad[i].move(bspeed);
    bad[i].die();
  }
  console.log(gspeed, bspeed);
  fill(255);
  rect(20, 700, 140, 80);
  fill(0);
  textSize(15);
  text("S=slow cells", 30, 715);
  text("Space=fast virus", 30, 735);
  text("D=slow virus", 30, 755);
  text("Click=fast cells", 30, 775);
}  
function mousePressed() {
  gspeed+=1;
  //println(gspeed);
}
function keyPressed() {
  if (keyCode==32) {
    bspeed+=1;
  }
  if (key=='s') {
    gspeed-=1;
  }
  if (key=='d') {
    bspeed-=1;
  }
  if (key=='h' && col==true) {
    col=false;
    gspeed=12 ;
    bspeed=4;
    die=false;
  }
}
class Bacteria    
{     
  //lots of java! 
  
  constructor(x, y) {
    this.x=x;
    this.y=y;
  }
  move(speed) {
    //x+=(int)(Math.random()*8);
    //y+=(int)(Math.random()*8);

    //boundries
    /*if(x<20){
     x+=(int)(Math.random()*20);
     }
     if(y<20){
     y+=(int)(Math.random()*20);
     }
     if(x>780){
     x+=(int)(Math.random()*-20);
     }
     if(y>780){
     y+=(int)(Math.random()*-20);
     }*/

    //follow mouse
    if (this.x<mouseX) {
      this.x+=floor(Math.random()*speed);
    }
    if (this.x>mouseX) {
      this.x-=floor(Math.random()*speed);
    }
    if (this.y<mouseY) {
      this.y+=floor(Math.random()*speed);
    }
    if (this.y>mouseY) {
      this.y-=floor(Math.random()*speed);
    }
  }
show() {
    stroke(0);

    ellipse(this.x+ran, this.y+ran, 23, 23);
    //ellipse(mouseX+(int)(Math.random()*50-25), mouseY+(int)(Math.random()*50-25), 23, 23);
  }
   die() {

    for (var i=0; i<good.length; i++) {
      //print(good[i].x);
      if (good[i].x==bad[i].x && good[i].y==bad[i].y) {
        die=true;
        gspeed=bspeed;
        //
        good[i].move(bspeed);
        
      }
    }
    if (gspeed==bspeed && die==true) {
      col=true;
      push();
      fill(255, 0, 0);
      textSize(50);
      text("INFECTED", 300, 100);
      pop();
      //pushMatrix();
      //fill(0, 155, 0);
      textSize(30);
      text("Press H to Heal", 550, 770);
      //popMatrix();
    }
  }
}    
