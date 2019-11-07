'use strict'
var x;
var y;
var num;
var total=0;
var clicked = 1;
var avg=0;
var y2 = 0;
var r2;
var x4;


function setup() {
    noLoop();
    createCanvas(600, 600);
}

function draw() {
    textSize(40);
    background(0);
    for (var i = 225; i < 375; i += 55) {
        for (var j = 225; j < 375; j += 55) {
            var d = new Die(i, j);
            d.roll();
            d.show();
        }
    }
    avg += total;
    fill((Math.random() * 255) + 50, (Math.random() * 255), (Math.random() * 255));
   // parseInt(total);
   //Math.trunc(total);
   // Math.round(total);
    text("Total= " + parseInt(total), 230, 100);
    text("Average= " + parseInt(avg / clicked), 200 , 150);
    console.log(clicked, avg);
    for (var i = 0; i < 100; i++) {
        if (i > 0 && i < 25) {}
        if (i > 25 && i < 50) {}
        if (i > 50 && i < 75) {}

        i++;
    }
}

//println(avg);
//println(clicked);

function mousePressed() {
    redraw();
    total = 0;
    clicked += 1;
}

function polygon(x, y, radius, npoints) {
    var angle = TWO_PI / npoints;
    beginShape();
    for (var a = 0; a < TWO_PI; a += angle) {
        var sx = x + cos(a) * radius;
        var sy = y + sin(a) * radius;
        vertex(sx, sy);
    }
    endShape(CLOSE);
}

class Die //models one single dice cube
{
    //variable declarations here
    constructor(x2, y2) //constructor
    {
        this.x = x2;
        this.y = y2; //variable initializations here
        this.num = 0;
    }

    roll() {
        num = Math.random() * 6 + 1;
        Math.floor();
        total += num;
    }

    show() {
        noStroke();
        fill(255);
        rect(this.x, this.y, 50, 50, 10);
        fill(0);
        if (num > 1 && num<2) {
            fill(181, 16, 88);
            ellipse(this.x + 25, this.y + 25, 8, 8);
            push();
            noFill();
            stroke(181, 16, 88);
            strokeWeight(2);
            line(275, (375 + 225 / 2), 325, (375 + 225 / 2));
            pop();
        }
        if (num > 2 && num<3) {
            fill(204, 22, 224);
            ellipse(this.x + 15, this.y + 15, 8, 8);
            ellipse(this.x + 35, this.y + 35, 8, 8);
            push();
            noFill();
            stroke(204, 22, 224);
            strokeWeight(2);
            line(275, (375 + 225 / 2) - 25, 325, (375 + 225 / 2) + 25);
            line(275, (375 + 225 / 2) + 25, 325, (375 + 225 / 2) - 25);
            pop();
        }
        if (num > 3 && num<4) {
            fill(89, 10, 207);
            ellipse(this.x + 12, this.y + 12, 8, 8);
            ellipse(this.x + 25, this.y + 25, 8, 8);
            ellipse(this.x + 38, this.y + 38, 8, 8);
            push();
            //translate(width*0.5, height*0.5);
            //rotate(frameCount / 50.0);
            noFill();
            stroke(89, 10, 207);
            strokeWeight(2);
            polygon(300, (375 + 225 / 2), 50, 3);
            pop();
        }
        if (num > 4 && num<5) {
            fill(19, 16, 227);
            ellipse(this.x + 15, this.y + 15, 8, 8);
            ellipse(this.x + 35, this.y + 35, 8, 8);
            ellipse(this.x + 35, this.y + 15, 8, 8);
            ellipse(this.x + 15, this.y + 35, 8, 8);
            push();
            //translate(width*0.5, height*0.5);
            //rotate(frameCount / 50.0);
            noFill();
            stroke(19, 16, 227);
            strokeWeight(2);
            polygon(300, (375 + 225 / 2), 55, 4);
            pop();
        }
        if (num > 5 && num<6) {
            fill(4, 87, 97);
            ellipse(this.x + 13, this.y + 13, 8, 8);
            ellipse(this.x + 38, this.y + 38, 8, 8);
            ellipse(this.x + 38, this.y + 13, 8, 8);
            ellipse(this.x + 13, this.y + 38, 8, 8);
            ellipse(this.x + 25, this.y + 25, 8, 8);
            push();
            //translate(width*0.5, height*0.5);
            //rotate(frameCount / 50.0);
            noFill();
            stroke(4, 87, 97);
            strokeWeight(2);
            polygon(300, (375 + 225 / 2), 60, 5);
            pop();
        }
        if (num > 6 && num<7) {
            fill(52, 216, 235);
            ellipse(this.x + 13, this.y + 13, 8, 8);
            ellipse(this.x + 38, this.y + 38, 8, 8);
            ellipse(this.x + 38, this.y + 13, 8, 8);
            ellipse(this.x + 13, this.y + 38, 8, 8);
            ellipse(this.x + 38, this.y + 25.5, 8, 8);
            ellipse(this.x + 13, this.y + 25.5, 8, 8);
            push();
            //translate(width*0.5, height*0.5);
            //rotate(frameCount / 50.0);
            noFill();
            stroke(52, 216, 235);
            strokeWeight(2);
            polygon(300, (375 + 225 / 2), 65, 6);
            pop();
        }
    }
}
