class MainParticle{
  ArrayList<Particle> aquarium;
  PVector origin;

  
  MainParticle(PVector location){
    origin = location.get();
    aquarium = new ArrayList<Particle>();
  }
  
  void addFallingPart(){
    float r = random(1);
    if(r < 0.5){
      aquarium.add(new Food());
    } else {
      aquarium.add(new Rock());
    }
  }
  
  
  
  
  
}