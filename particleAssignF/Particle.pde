class Particle{
  //declaring variables for particle's location, velocity and acceleration
  PVector location;
  PVector velocity;
  PVector acceleration;
  //declaring variable for degradation of particle
  float solidity;
  //declaring variable for size of particle
  float mass;
  color colPart;
  
  Particle(float x, float y, color newCol){
    //location assigned to temp variable from constructor
    location = new PVector(x, y);
    acceleration = new PVector(0, 0.1);
    velocity = new PVector(0, 0);
    solidity = 255;
    mass = 5;
    colPart = newCol;
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
    fill(colPart);
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