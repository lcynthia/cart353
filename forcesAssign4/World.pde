//creating class responsible for the background, the world in which object is rolling in
class World {
  //declaring PVector for location of infrastructure in the world
  PVector location;
  PVector velocity;
  PVector acceleration;
  //declaring lou for image objects
  PImage lou;

  //creating constructor 
  World(PVector newLoc, String file) {
    location = newLoc;
    velocity = new PVector(0, 0);
    acceleration = new PVector(-2, 0);
    //load image specified in constructor
    lou = loadImage(file);
  }

  //creating function responsible for displaying the world
  void display() {
    image(lou, location.x+lou.width, height/1.7-lou.height, lou.width*2, lou.height*2);
    noStroke();
    fill(200, 150, 110);
    rect(0, height/1.4, width, height/1.7);
  }


  //function responsible for updating position of World object (images)
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    //if World object goes off the screen, set it back to the right of the screen
    if (location.x < -lou.width*4) {
      location.x = width + lou.width;
    }
  }

  //function responsible for applying force on World object
  void applyForce(PVector force) {
    PVector f = PVector.div(force, 1000);
    acceleration.add(f);
  }
}