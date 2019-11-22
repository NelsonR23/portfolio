'use strict'
//ArrayList<Particle> stars= new ArrayList<Particle>();
var stars;
var r, g, b;
var pause;
var a;
var x, y, angle, s, speed
var pause = false;

function setup() {
    stars = [];
    pause = false;
    //noStroke();
    //    colorMode(HSB);
    smooth();
    background(0);
    createCanvas(800, 800);
    //r=(int)(Math.random()*100);
    r = Math.random() * 255;
    //g=(int)(Math.random()*101+50);
    g = Math.random() * 255;
    b = Math.random() * 255;

    stars[1] = new OddballParticle();
    stars[2] = new JumboParticle();

    for (var i = 3; i < 2500; i++) {

        stars[i] = new NormalParticle();
    }
    /*if (pause) {
      noLoop();
    } else {
      loop();
    }*/
    background(0);
}

function draw() {
    //background(0);
    for (var a in stars) {
        stars[a].move(2);
        stars[a].show();
    }
    //a.move();  (float)Math.random()*2

}

function mousePressed() {

    for (var i = 0; i < 2500; i++) {
        stars[i].reverse();
    }

}


function keyPressed() {
    if (keyCode == 32) {
        background(0);
        stroke(0);
    }
    if (key == 'r') {
        //        stars.splice(0,0);
        stars.shift();

    }
    if (key == 'p') {
        noLoop();

    }
    if (key == 'o') {
        loop();
        //pause=false;
    }
    if (key == 'c') {
        //r clear();
        r = Math.random() * 255;
        g = Math.random() * 255;
        b = Math.random() * 255;
    }
    if (key == 's') {
        stroke(Math.random() * 255, Math.random() * 255, Math.random() * 255);
    }
}
/*
interface Particle {
    function show();

    function move(float s);

    function setAngle(float d);
    var getAngle();
}
*/

class NormalParticle /*implements Particle */ {

    constructor() {
        this.x = 400;
        this.y = 400;
        this.angle = Math.random() * 2 * PI;
        this.speed = 2;
    }

    move(s) {
        this.speed = s;
        this.x += cos(this.angle) * this.speed;
        this.y += sin(this.angle) * this.speed;
        this.angle += .01;
        //println(angle, x, y);
    }

    show() {
        fill(this.r, this.g, this.b);
        ellipse(this.x, this.y, 3, 3);
    }
    setAngle(a) {
        this.angle = this.a;
    }
    getAngle() {
        return this.angle;
    }
    reverse() {
        this.angle += PI;
    }
}

class OddballParticle /*implements Particle*/ {

    constructor() {
        this.x = 400;
        this.y = 400;
        this.angle = Math.random() * 2 * PI;
        this.speed = 2;
    }
    show() {
        fill(r, g, b);
        ellipse(this.x + Math.random() * 2, this.y - Math.random() * 2, 3, 3);
    }
    move(s) {
        this.speed = Math.random() * 10;
        this.x -= cos(this.angle) * this.speed;
        this.y -= sin(this.angle) * this.speed;
        this.angle += .01;
    }
    setAngle(a) {
        this.angle = this.a;
    }
    getAngle() {
        return this.angle;
    }
}

class JumboParticle /*extends OddballParticle implements Particle */ {

    constructor() {
        this.x = 400;
        this.y = 400;
        this.angle = Math.random() * 2 * PI;
        this.speed = 2;
    }
    //super.move(2);
    //super.setAngle(PI*.5);
    //super.getAngle();
    move(s) {
        this.speed = this.s;
        this.x += cos(this.angle) * this.speed;
        this.y += sin(this.angle) * this.speed;
        this.angle += .01;
        //println(angle, x, y);
    }


    setAngle(a) {
        this.angle = this.a;
    }
    getAngle() {
        return this.angle;
    }
    show() {
        //fill(r+100, g+50, b-100);
        fill(r + 50, g, b);
        ellipse(this.x, this.y, 15, 15);
    }
}
