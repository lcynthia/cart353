class Street {
  //declaring x, y and z for coordinates of the rectangle making the terrain
  PVector location;
  //declaring variables for length and width of terrain
  int tLength;
  int tWidth;
  int cols, rows;
  int scale = 20;
  float flying = 0;
  float[][] terrain;

  Street(PVector newLoc, int newLength, int newWidth) {
    //assigning variables to temporary ones taken from constructor
    location = newLoc;
    tLength = newLength;
    tWidth = newWidth;
    cols = tWidth / scale;
    rows = tLength / scale;
    terrain = new float[cols][rows];
    
  }

  void display() {
    //draw gray terrain (with the use of a rectangle) on canvas
    noFill();
    stroke(125);
    pushMatrix();
    translate(location.x, location.y, location.z);
    rotateX(PI/2);
    rectMode(CENTER);
    translate(-tWidth/2, -tLength/2);
    flying -= 0.01;
    float yoff = flying;
    for (int y= 0; y < rows; y++) {
      float xoff = 0;
      for (int x = 0; x < cols; x++) {
        terrain[x][y] = map(noise(xoff, yoff), 0, 1, -20, 20);
        xoff += 0.5;
      }
      yoff += 0.5;
    }
    for (int y= 0; y < rows - 1; y++) {
      beginShape(TRIANGLE_STRIP);
      for (int x = 0; x < cols; x++) {
        vertex(x*scale, y*scale, terrain[x][y]);
        vertex(x*scale, (y+1)*scale, terrain[x][y+1]);
        //rect(x*scale, y*scale, scale, scale);
      }
      endShape();
    }
    popMatrix();
  }
}