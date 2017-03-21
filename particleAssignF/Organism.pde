class Organism extends MainParticle {
  float solidityO = super.solidity;
  color colOr;

  Organism() {
    super(random(width), random(370, 680));
    colOr = color(100, 220, 150);
  }

  void display() {
    fill(colOr, solidityO);
    super.display();
  }
}