class PunchDeck {

  private int health, attack, defense, mana, score, player;

  private boolean ultimate;

  PunchDeck() {

    score=0;
    attack=0;
    defense=0;
    mana=0;
    health=100;
    ultimate=false;
    player=1;
  }

  int getScore() {
    return score;
  }

  int getAttack() {
    return attack;
  }

  int getDefense() {
    return defense;
  }

  int getMana() {
    return mana;
  }

  int getHealth() {
    return health;
  }

  int getPlayer() {
    return player;
  }

  boolean getUltimate() {
    return ultimate;
  }

  void setScore(int n) {
    score=n;
  }

  void setHealth(int n) {
    health=n;
  }

  void setAttack(int n) {
    attack=n;
  }

  void setDefense(int n) {
    defense=n;
  }

  void setMana(int n) {
    mana=n;
  }

  void setUltimate(boolean n) {
    ultimate=n;
  }

  void setPlayer(int n) {
    player=n;
  }

  int rolly() {
    return (int)(Math.random()*6)+1;
  }
}
