//creating class responsible for primary rolling object
class Core{
  //declaring PVectors for the object's location, velocity & acceleration
  PVector location;
  PVector velocity;
  PVector acceleration;
  //declaring coreSize for the size of object
  float coreSize;
  float dotSize;
  //declaring coreC for the color of object
  color coreC;
  color dotC;
  
  //creating constructor initiating location, velocity & acceleration
  Core(){
    location = new PVector(width/2, height/1.3);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0.2, 0);
  }
  
  //creating function responsible for updating the location of object
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  //creating function responsible for displaying object on screen
  void display(){
    fill(125, 30, 250);
    noStroke();
    ellipse(location.x, location.y, 50, 50);
  }
}