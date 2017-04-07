class Building {
  //declaring location.xOr, location.yOr and location.zOr for the coordinates of the origin of prism
  PVector locationOr;
  float sizeX;
  float sizeY;
  float sizeZ;
  //declaring lR, lG and lB for RGB values of the functions for light
  int lR;
  int lG;
  int lB;
  Wall[] w = new Wall[4];


  Building(PVector newLocOr, float newX, float newY, float newZ) {
    //setting location.x, location.y, location.z, location.xOr, location.yOr and location.zOr to variable taken in the constructor
    locationOr = newLocOr;
    sizeX = newX;
    sizeY = newY;
    sizeZ = newZ;
    //setting lR, lG and lB to 50
    lR = 50;
    lG = 50;
    lB = 50;
    for (int i = 0; i < 4; i++){
    w[i] = new Wall(locationOr, sizeX, sizeY, i);
    }
  }

  void display() {
    //insert ambient light and point light for buildings
    ambientLight(lR, lG, lB);
    pointLight(lR, lG, lB, locationOr.x, locationOr.y, locationOr.z);
    //draw the prism
    prismBuild();
    for (int i = 0; i < 4; i++){
      w[i].display();
    }
  }


  //function responsible for making the prism
  void prismBuild() {
    pushMatrix();
    translate(locationOr.x, locationOr.y, locationOr.z);
    stroke(255);
    rotateX(PI/4);
    rotateY(PI/2);
    rotateZ(-PI/4);
    //fill(lR, lR);
    fill(255, lR);
    //how to make glowing (blur) effect onllocation.y on buildings?
    //filter(BLUR, 2);
    //fill(255);

    beginShape();
    vertex(0, 0, sizeZ);
    vertex( sizeX, 0, sizeZ);
    vertex( sizeX, sizeY, sizeZ);
    vertex(0, sizeY, sizeZ);
    vertex(0, 0, sizeZ);

    //rect(-location.x, -location.y, 10, 10);

    endShape();
    
    beginShape();

    vertex(sizeX, 0, sizeZ);
    vertex(sizeX, 0, 0);
    vertex(sizeX, sizeY, 0);
    vertex(sizeX, sizeY, sizeZ);
    vertex(sizeX, 0, sizeZ);

    endShape();
    beginShape();

    vertex(sizeX, 0, 0);
    vertex( 0, 0, 0);
    vertex( 0, sizeY, 0);
    vertex(sizeX, sizeY, 0);
    vertex(sizeX, 0, 0);

    endShape();
    beginShape();

    vertex( 0, 0, 0);
    vertex( 0, 0, sizeZ);
    vertex( 0, sizeY, sizeZ);
    vertex( 0, sizeY, 0);
    vertex( 0, 0, 0);

    endShape();
    beginShape();

    vertex(0, 0, sizeZ);
    vertex(sizeX, 0, sizeZ);
    vertex(sizeX, 0, 0);
    vertex(0, 0, 0);
    vertex(0, 0, sizeZ);

    endShape();
    beginShape();

    vertex(0, sizeY, sizeZ);
    vertex(sizeX, sizeY, sizeZ);
    vertex(sizeX, sizeY, 0);
    vertex(0, sizeY, 0);
    vertex(0, sizeY, sizeZ);

    endShape();

    popMatrix();
  }
  
}