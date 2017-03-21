class Food extends MainParticle {
  float solidityF = super.solidity;
  color colFo;
  
  Food(){
    super(random(width), 0);

    colFo = color(200, 190, 130);
  }
  
  void display(){
    fill(colFo, solidityF);
    super.display();
  }
}