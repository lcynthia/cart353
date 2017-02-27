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
  float rotate = 0;
  
  //creating constructor initiating location, velocity & acceleration
  Core(){
    location = new PVector(width/2, height/1.4);
    velocity = new PVector(0, 0);
    acceleration = new PVector(1, 0);
  }
  
  //creating function responsible for updating the location of object
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    
  }
  
  //creating function responsible for displaying object on screen
  void display(){
    pushMatrix();
    ellipseMode(CENTER);
    //if (keyCode == RIGHT){
    //rotate += 0.02;
    //}
    translate(location.x, location.y);
    rotate(rotate);
    fill(125, 30, 250);
    noStroke();
    arc(0, 0, 50, 50, 0, PI);
    fill(250, 30, 125);
    arc(0, 0, 50, 50, PI, TWO_PI);
    popMatrix();
    
  }
}