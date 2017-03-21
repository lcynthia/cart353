class Bubble extends MainParticle{
  color strokeB;
  color fillB;

  
  Bubble(){
    super(350, 350);
    strokeB = color(180, 230, 250);
    fillB = color(170, 200, 225);

  }
  
  void display(){
    stroke(strokeB);
    fill(fillB);
    super.display();

    
  }
  
}