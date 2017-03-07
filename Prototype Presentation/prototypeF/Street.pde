class Street {
  //declaring x, y and z for coordinates of the rectangle making the terrain
  int x;
  int y; 
  int z;
  //declaring variables for length and width of terrain
  int tLength;
  int tWidth;

  Street(int newX, int newY, int newZ, int newLength, int newWidth) {
    //assigning variables to temporary ones taken from constructor
    x = newX;
    y = newY;
    z = newZ;
    tLength = newLength;
    tWidth = newWidth;
  }

  void display() {
    //draw gray terrain (with the use of a rectangle) on canvas
    fill(155);
    noStroke();
    pushMatrix();
    translate(x, y, z);
    rotateX(PI/2);
    rectMode(CENTER);
    rect(0, 0, tLength, tWidth);
    popMatrix();
  }
}