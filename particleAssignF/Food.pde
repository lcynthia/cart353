class Food extends Particle {
  float solidityF = super.solidity;
  color colFo;
  
  Food(){
    super(random(width), 0, color(200, 190, 130));

  }
  
  void display(){
    fill(super.colPart, solidityF);
    super.display();
  }
}