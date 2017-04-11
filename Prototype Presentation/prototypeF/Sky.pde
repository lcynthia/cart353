class Sky {
  //declaring PVector for location
  PVector location;
  //declaring variables for width and height of rectangles constituting the sky
  float sizeX;
  float sizeY;
  //declaring offset for spacing between each rectangle
  float offset;
  //declaring sColor for color of the rectangles
  color sColor;

  Sky(PVector newLoc, float newSizeX, float newSizeY, color newColor) {
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
    translate(location.x, 500, location.z);
    rotateX(PI);
    //draw rectangle
    rect(0, location.y, sizeX, sizeY);
    popMatrix();
  }
}