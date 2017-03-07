class Building {
  //declaring x, y and z for the shape of the prism (building)
  int x;
  int y;
  int z;
  //declaring xOr, yOr and zOr for the coordinates of the origin of prism
  int xOr;
  int yOr;
  int zOr;
  //declaring lR, lG and lB for RGB values of the functions for light
  int lR;
  int lG;
  int lB;



  Building(int newX, int newY, int newZ, int newXor, int newYor, int newZor) {
    //setting x, y, z, xOr, yOr and zOr to variable taken in the constructor
    x = newX;
    y = newY;
    z = newZ;
    xOr = newXor;
    yOr = newYor;
    zOr = newZor;
    //setting lR, lG and lB to 50
    lR = 50;
    lG = 50;
    lB = 50;
  }

  void display() {
    //insert ambient light and point light for buildings
    ambientLight(lR, lG, lB);
    pointLight(lR, lG, lB, x, y, z);
    //draw the prism
    prismBuild();
  }

  //function responsible for making the prism
  void prismBuild() {
    pushMatrix();
    translate(xOr, yOr, zOr);
    stroke(255);
    rotateX(PI/4);
    rotateY(PI/2);
    rotateZ(-PI/4);
    //fill(lR, lR);
    fill(255, lR);
    //how to make glowing (blur) effect only on buildings?
    //filter(BLUR, 2);
    //fill(255);

    beginShape();
    vertex(-x, -y, z);
    vertex( x, -y, z);
    vertex( x, y, z);
    vertex(-x, y, z);
    vertex(-x, -y, z);

    endShape();
    beginShape();

    vertex(-x, -y, z);
    vertex(-x, -y, -z);
    vertex(-x, y, -z);
    vertex(-x, y, z);
    vertex(-x, -y, z);

    endShape();
    beginShape();

    vertex(-x, -y, -z);
    vertex( x, -y, -z);
    vertex( x, y, -z);
    vertex(-x, y, -z);
    vertex(-x, -y, -z);

    endShape();
    beginShape();

    vertex( x, -y, -z);
    vertex( x, -y, z);
    vertex( x, y, z);
    vertex( x, y, -z);
    vertex( x, -y, -z);

    endShape();
    beginShape();

    vertex(-x, -y, z);
    vertex(-x, -y, -z);
    vertex( x, -y, -z);
    vertex( x, -y, z);
    vertex(-x, -y, z);

    endShape();
    beginShape();

    vertex(-x, y, z);
    vertex(-x, y, -z);
    vertex( x, y, -z);
    vertex( x, y, z);
    vertex(-x, y, z);

    endShape();

    popMatrix();
  }
}