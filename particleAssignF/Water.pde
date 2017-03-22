class Water {
  //declaring variable for position and size of Water rectangle
  float x, y, w, h;
  //declaring coefficient for drag function
  float coe;

  Water(float newX, float newY, float newW, float newH, float newCoe) {
    //variables assigned to temp variable from constructor
    x = newX;
    y = newY;
    w = newW;
    h = newH;
    coe = newCoe;
  }

  void display() {
    noStroke();
    fill(150, 150, 255, 100);
    rect(x, y, w, h);
  }
}