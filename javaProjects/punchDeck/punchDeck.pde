int xp, step, pturn;
int roll;
int count=0;
int start;
int metst;
boolean met=false;
int spacepress=0;
int tempframe=0;
int whatever=0;

PunchDeck punch1 = new PunchDeck();

PunchDeck punch2 = new PunchDeck();

Graphic g = new Graphic();

int rol;

void setup() {

  size(1000, 800);

  rol = punch1.rolly();
  xp=275;
  step=10;
  start=0;
  metst=0;
  pturn=1;
}

void draw() {
  textAlign(LEFT);
  background(0, 0, 0);
  fill(255);
  noStroke();

  rect(80, 340, 90, 140);
  rect(830, 340, 90, 140);

  if (mousePressed) {
    start++;
  }
  if (start<=3) {
    textSize(80);
    text("PunchDeck", 280, 100);
    rect(350, 300, 300, 150);
    fill(0);
    text("Start", 410, 400);
  } else if
    (start>3) {
    fill(0);
    textSize(40);
    textSize(30);
    fill(55, 255, 255);

    //left
    fill(0);
    text(punch1.getHealth(), 95, 420);

    fill(55, 255, 255);
    text("Attack: " + punch1.getAttack(), 55, 550);
    text("Defense: " + punch1.getDefense(), 55, 600); 
    text("Mana: " + punch1.getMana(), 55, 650); 

    //right
    fill(0);
    text(punch2.getHealth(), 845, 420);

    fill(55, 255, 255);
    text("Attack: " + punch2.getAttack(), 810, 550);
    text("Defense: " + punch2.getDefense(), 810, 600); 
    text("Mana: " + punch2.getMana(), 810, 650);

    //middle
    text("Player " + pturn, 440, 80);

    if (frameCount<tempframe) {
      textAlign(CENTER, CENTER);
      if (whatever==0) {
        text("+5 Attack", 495, 530);
      }
      if (whatever==1) {
        text("-5 Attack", 495, 530);
      }
    }
    textAlign(LEFT);
    if (pturn==1) {
      turn(punch1);
    } else {
      turn(punch2);
    }
    gover();
  }
}

void turn(PunchDeck punch) {

  this.roll(punch);

  if (metst>=1) {

    fill(0);
    rect(300, 100, 800, 180);
    fill(55, 255, 255);
    textSize(40);
    text("Press Space", 400, 320);

    fill(130, 0, 0);
    rect(275, 350, 450, 50);
    fill(245, 179, 35);
    rect(425, 350, 150, 50);
    fill(52, 234, 40);
    rect(490, 350, 20, 50);
    fill(40, 45, 234);

    rect(xp, 340, 10, 70);
    xp+=step;
    if (xp>725) {
      xp=725;
      step=-10;
    }
    if (xp<275) {
      xp=275;
      step=10;
    }
  }
}

void keyReleased() {
  if (key=='g') {
    if (rol<=2) {
      punch(pturn).setMana(punch(pturn).getMana()+5);
    } else if (rol==3 || rol==4) {
      punch(pturn).setMana(punch(pturn).getMana()+10);
    } else {
      punch(pturn).setMana(punch(pturn).getMana()+15);
    }
  }
  if (metst>=1) {

    if (key==32) {

      fill(255);
      if (xp+5>=485 && xp+5<=525) {
        punch(pturn).setAttack(punch(pturn).getAttack()+5);
        tempframe=frameCount+60;
        whatever=0;
      }
      if ((xp+5>425&&xp+5<485) || (xp+5>525&&xp+5<575)) {
        punch(pturn).setAttack(punch(pturn).getAttack());
        text("", 495, 530);
      } 
      if ((xp+5>=275&&xp+5<=425) || (xp+5>=575 && xp+5<=725)) {
        punch(pturn).setAttack(punch(pturn).getAttack()==0?0:punch(pturn).getAttack()-5);      
        tempframe=frameCount+60;
        whatever=1;
      }
      count++;
      metst=0;
      if (pturn==2) {
        execute(1);
        execute(2);
      }
      pturn = pturn==1?2:1;
      rol = punch1.rolly();
    }
  }
} 

void execute(int n) {
  //punch(n==1?1:2).setAttack(punch(n==1?1:2).getAttack()<=0?0:punch(n==1?1:2).getAttack());
  if (punch(n==1?1:2).getMana()>=30) {
    punch(n==1?1:2).setAttack(punch(n==1?1:2).getAttack()+30);
    punch(n==1?1:2).setMana(0);
  }
  int defenseLeft = (punch(n==1?2:1).getDefense()<punch(n).getAttack())?0:(punch(n==1?2:1).getDefense()-punch(n).getAttack());
  punch(n==1?1:2).setAttack(punch(n==1?1:2).getAttack()<punch(n==1?2:1).getDefense()?0:punch(n==1?1:2).getAttack()-punch(n==1?2:1).getDefense());
  punch(n==1?2:1).setHealth(punch(n==1?2:1).getHealth()-punch(n==1?1:2).getAttack());
  punch(n==1?1:2).setAttack(0);
  punch(n==1?2:1).setDefense(defenseLeft);
}

PunchDeck punch(int n) {
  return n==1?punch1:punch2;
}


void roll(PunchDeck punch) {

  rect(425, 200, 150, 90);
  fill(0);
  text("Roll", 475, 255);
  String rolll=""+rol;
  if (mousePressed) {
    roll++;
  }
  if (roll>3) {

    fill(0);

    rect(425, 200, 150, 90);

    fill(55, 255, 255);

    rect(315, 200, 110, 80);
    rect(445, 200, 110, 80);
    rect(575, 200, 110, 80);
    fill(255);
    rect(470, 115, 60, 60, 10);

    if (rol<=2) {

      fill(0); 
      textSize(15);

      text("Attack: +5", 330, 230 );
      text("Press A", 335, 260 );

      text("Defense: +5", 455, 230);
      text("Press D", 470, 260);

      text("Mana: +5", 590, 230);
      text("Press G", 595, 260);
      textSize(40);
      text(rolll, 488, 160);
    } else if (rol==3 || rol==4) {

      fill(0);
      textSize(15);

      text("Attack: +10", 330, 230 );
      text("Press A", 335, 260 );

      text("Defense: +10", 452, 230 );
      text("Press D", 460, 260 );

      text("Mana: +10", 590, 230 );
      text("Press G", 595, 260 );
      textSize(40);
      text(rolll, 488, 160);
    } else {
      fill(0);
      textSize(15);

      text("Attack: +15", 330, 230 );
      text("Press A", 335, 260 );

      text("Defense: +15", 452, 230 );
      text("Press D", 460, 260);

      text("Mana: +15", 590, 230 );
      text("Press G", 595, 260 );
      textSize(40);
      text(rolll, 488, 160);
    }
  }
  if (keyPressed) {

    if (key=='a') {
      if (rol<=2) {
        punch.setAttack(5);
      } else if (rol==3 || rol==4) {
        punch.setAttack(10);
      } else {
        punch.setAttack(15);
      }
    }
    if (key=='d') {
      if (rol<=2) {
        punch.setDefense(5);
      } else if (rol==3 || rol==4) {
        punch.setDefense(10);
      } else {
        punch.setDefense(15);
      }
    }
    metst=1;
  }
}

void gover() {

  if (punch1.getHealth()<=0 && punch2.getHealth()<=0) {
    textAlign(CENTER, CENTER);
    textSize(75);
    fill(0);
    rect(0, 0, 1000, 800);
    fill(55, 255, 255);
    text("Draw", 500, 300);
    textSize(25);
    text("Press R to restart", 150, 750);
  } else if (punch1.getHealth()<=0) {
    textAlign(CENTER, CENTER);
    textSize(75);
    fill(0);
    rect(0, 0, 1000, 800);
    fill(55, 255, 255);
    text("Game Over", 500, 300);
    text("Player 2 Wins", 500, 400);
    textSize(25);
    text("Press R to restart", 150, 750);
  } else if (punch2.getHealth()<=0) {
    textAlign(CENTER, CENTER);
    textSize(75);
    fill(0);
    rect(0, 0, 1000, 800);
    fill(55, 255, 255);
    text("Game Over", 500, 300);
    text("Player 1 Wins", 500, 400);
    textSize(25);
    text("Press R to restart", 150, 750);
  }
  if (keyPressed) {
    if (key=='r' || key=='R') {
      start=0;
      roll=0;
      metst=0;
      punch1.setHealth(100);
      punch2.setHealth(100);
      punch1.setAttack(0);
      punch2.setAttack(0);
      punch1.setDefense(0);
      punch2.setDefense(0);
      punch1.setMana(0);
      punch2.setMana(0);
    }
  }
}    
