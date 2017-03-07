class Star {
  //declaring PVector variable for location of star
  PVector location;
  //declaring variables for size and color
  int sizeS;
  color colorS;

  Star(PVector newLoc, int newSize) {
    //assigning variables to temporary ones taken from constructor 
    location = newLoc;
    sizeS = newSize;
  }

  void display() {
    //draw stars on canvas
    noStroke();
    fill(210, millis()%random(500, 700), 230, millis()%random(200, 1500));
    pushMatrix();
    translate(-3500, -2500, -3000);
    ellipse(location.x, location.y, sizeS, sizeS);
    popMatrix();
  }
}