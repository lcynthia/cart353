class Pearl {
  //declaring PVectors for Pearl's location, velocity & acceleration
  PVector location;
  PVector velocity;
  PVector acceleration;
  //declaring sizeP for the size of the pearl (related to mass)
  float sizeP;
  //declaring colorP for the color of the pearl
  color colorP;
  //declaring boolean stayP for pearl to stay at its position when encountering Core object
  boolean stayP = false;
  float aroundC = 0;

  //creating constructor initiating location, velocity, acceleration, size & color
  Pearl(PVector newLoc, float newSize, color newCol) {
    location = newLoc;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    sizeP = newSize;
    colorP = newCol;
  }

  //function responsible for applying force on Pearl object
  void applyForce(PVector force) {
    PVector f = PVector.div(force, sizeP);
    acceleration.add(f);
  }

  //function responsible for updating the position of Pearl object
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    //if Pearl goes off the screen, set it back to the right of the screen
    if (location.x < -sizeP) {
      location.x = width*2;
    }
  }

  //creating function to display the pearl
  void display() {
    noStroke();
    fill(colorP);
    ellipse(location.x, location.y, sizeP, sizeP);
  }
}