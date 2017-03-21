class MainParticle{
  ArrayList<MainParticle> aquarium;
  //declaring variables for particle's location, velocity and acceleration
  PVector location;
  PVector velocity;
  PVector acceleration;
  //declaring variable for degradation of particle
  float solidity;
  //declaring variable for size of particle
  float mass;

  
  MainParticle(float x, float y){
    //location assigned to temp variable from constructor
    location = new PVector(x, y);
    acceleration = new PVector(0, 1);
    velocity = new PVector(0, 0);
    solidity = 255;
    mass = 5;
    aquarium = new ArrayList<MainParticle>();
  }
  
  void addFallingPart(){
    float r = random(1);
    if(r < 0.25){
      aquarium.add(new Food());
    } else if (r < 0.5) {
      aquarium.add(new Rock());
    } else if (r < 0.75){
      aquarium.add(new Organism());
    } else {
      aquarium.add(new Bubble());
    }
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void run(){
    update();
    display();
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
  }
  
  void display(){
    ellipse(location.x, location.y, mass, mass); 
  }
  
  boolean isOut(){
    if (solidity < 0.0){
      return true;
    } else {
      return false;
    }
  }
  
}