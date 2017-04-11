class Building {
  //declaring locationOr for the coordinates of the origin of the prism
  PVector locationOr;
  //declaring variable for dimensions of the prism
  float sizeX;
  float sizeY;
  float sizeZ;
  //creating array of Wall objects to put on sides of the prism
  Wall[] w = new Wall[4];


  Building(PVector newLocOr, float newX, float newZ) {
    //setting locationOr, sizeX, sizeY & sizeZ to variable taken in the constructor
    locationOr = newLocOr;
    sizeX = newX;
    sizeY = locationOr.y;
    sizeZ = newZ;
    //making instances of Wall objects
    for (int i = 0; i < 4; i++) {
        w[i] = new Wall(locationOr, sizeX, sizeY, i, 50);
    }
  }

  void display() {    
    //draw the prism
    prismBuild();
    //display Wall objects
    for (int i = 0; i < 4; i++) {
      w[i].display();
    }
  }


  //function responsible for making the prism
  void prismBuild() {
    pushMatrix();
    //translate to coordinate of origin
    translate(locationOr.x, locationOr.y, locationOr.z);
    stroke(255);
    rotateX(PI/4);
    rotateY(PI/2);
    rotateZ(-PI/4);
    noFill();
    //fill(255, 200);
    //how to make glowing (blur) effect onllocation.y on buildings?
    //filter(BLUR, 2);
    //fill(255);

    beginShape();
    vertex(0, 0, sizeZ);
    vertex( sizeX, 0, sizeZ);
    vertex( sizeX, sizeY, sizeZ);
    vertex(0, sizeY, sizeZ);
    vertex(0, 0, sizeZ);


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