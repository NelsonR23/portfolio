'use strict';

var hand;
var yoda;
var wmid=width/2;
var hmid=height/2;
var xcord=800;
var startX=80;
var botY=mouseY;
var topY=300;
var startY=400;
var endX=80;
var endY=400;
var grey=169;
var startTime;


function preload(){
  yoda=loadImage("data/yoda.png");
  hand=loadImage("data/hand.png");
}

function setup() {
  createCanvas(1200, 800);
  strokeWeight(4);
  background(0);
  preload();
  yoda.resize(500, 500);
  mouseX=500;
  mouseY=100;
}


function draw() {
 background(0);
 yoda.resize(500, 500);
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
    
 function saber() {
    stroke(0, 255, 0);
    line(mouseX, mouseY-50, mouseX, mouseY+150);
    stroke(192,192,192);
    line(mouseX, mouseY+150, mouseX, mouseY+200);
    image(yoda, mouseX-75, mouseY+0);
  }

function reset() {
   startX=80;
   startY=400;
   endX=80;
   endY=400;
}