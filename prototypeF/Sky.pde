class Sky {
  //declaring PVector for location
  PVector location;
  //declaring variables for width and height of rectangles constituting the sky
  int sizeX;
  int sizeY;
  //declaring offset for spacing between each rectangle
  int offset;
  //declaring sColor for color of the rectangles
  color sColor;

  Sky(PVector newLoc, int newSizeX, int newSizeY, color newColor) {
    //assigning variables to temporary ones taken from constructor 
    location = newLoc;
    sizeX = newSizeX;
    sizeY = newSizeY;
    sColor = newColor;
    offset = sizeY;
  }

  void display() {
    //sColor for fill taken from constructor
    fill(sColor);
    noStroke();
    pushMatrix();
    translate(0, 600, -700);
    rotateX(PI);
    //draw rectangle
    rect(location.x, location.y, sizeX, sizeY);
    popMatrix();
  }
}