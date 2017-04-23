class Building {
  //declaring locationOr for the coordinates of the origin of the prism
  PVector locationOr;
  //declaring variable for dimensions of the prism
  float sizeX;
  float sizeY;
  float sizeZ;
  //creating array of Wall objects to put on sides of the prism
  ArrayList<Wall> w;
  


  Building(PVector newLocOr, float newX, float newZ) {
    //setting locationOr, sizeX, sizeY & sizeZ to variable taken in the constructor
    locationOr = newLocOr;
    sizeX = newX;
    sizeY = locationOr.y;
    sizeZ = newZ;

    w = new ArrayList<Wall>();
    //making instances of Wall objects

  }

  void display() {    
    //draw the prism
    prismBuild();
    //display Wall objects
    windowUp();
    windowDown();
     
  }
  
  void windowUp(){
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == UP) {
          for (int i = 0; i < 4; i++) {
            w.add(new Wall(locationOr, sizeX, sizeY, i));
          }
        }
      }
    }
  }
  
  void windowDown(){
    Iterator<Wall> it = w.iterator();
    while (it.hasNext()) {
      Wall w = it.next();
      w.display();
    }
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == DOWN) {
          it.remove();
        }
      }
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