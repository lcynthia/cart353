class Street {
  //declaring x, y and z for coordinates of the rectangle making the terrain
  PVector location;
  //declaring variables for length and width of terrain
  int tLength;
  int tWidth;

  Street(PVector newLoc, int newLength, int newWidth) {
    //assigning variables to temporary ones taken from constructor
    location = newLoc;
    tLength = newLength;
    tWidth = newWidth;
  }

  void display() {
    //draw gray terrain (with the use of a rectangle) on canvas
    fill(155);
    noStroke();
    pushMatrix();
    translate(location.x, location.y, location.z);
    rotateX(PI/2);
    rectMode(CENTER);
    rect(0, 0, tLength, tWidth);
    popMatrix();
  }
}