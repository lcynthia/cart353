class Organism extends Particle {
  float solidityO = super.solidity;
  color colOr;

  Organism() {
    super(random(width), random(370, 680), color(100, 220, 150));

  }
}