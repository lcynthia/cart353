//creating class responsible for primary rolling object
class Core {
  //declaring PVectors for the object's location, velocity & acceleration
  PVector location;
  PVector velocity;
  PVector acceleration;
  //declaring coreSize for the size of object
  float coreSize;
  //declaring coreC for the color of object
  color coreC;
  //initializing rotate to value 0
  float rotate = 0;
  float G;

  //creating constructor initiating location, velocity, acceleration, size & G variables
  Core() {
    location = new PVector(width/2, height/1.4);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    coreSize = 50;
    G = 0.4;
  }

  //creating function responsible for updating the location of object
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  //creating function responsible for displaying object on screen
  void display() {
    pushMatrix();
    ellipseMode(CENTER);
    translate(location.x, location.y);
    rotate(rotate);
    fill(125, 30, 250);
    noStroke();
    arc(0, 0, coreSize, coreSize, 0, PI);
    fill(250, 30, 125);
    arc(0, 0, coreSize, coreSize, PI, TWO_PI);
    popMatrix();
  }

  //boolean function responsible for collision detection
  boolean encounter(Pearl build) {
    //distance takes distance between Core object and Pearl object
    float distance = dist(location.x, location.y, build.location.x, build.location.y);
    //sumRadius takes the radius of the Core object and of Pearl object
    float sumRadius = coreSize/2 + build.sizeP/2;
    //if distance is smaller than sum of radiuses, return true
    if (distance < sumRadius) {
      return true;
    }
    return false;
  }

  //PVector function responsible for attracting Pearl object to Core object
  PVector attract(Pearl p) {
    //Vector from location of Core object to location of Pearl object
    PVector force = PVector.sub(location, p.location);
    //distance takes magnitude of vector
    float distance = force.mag();

    distance = constrain(distance, 5.0, 50.0);

    force.normalize();
    float strength = (G * coreSize/50 * p.sizeP) / (distance*distance);
    force.mult(strength);
    //returns force PVector
    return force;
  }
}