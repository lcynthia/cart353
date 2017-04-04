class Building {
  //declaring location.x, location.y and location.z for the shape of the prism (building)
  PVector location;
  //declaring location.xOr, location.yOr and location.zOr for the coordinates of the origin of prism
  PVector locationOr;
  //declaring lR, lG and lB for RGB values of the functions for light
  int lR;
  int lG;
  int lB;



  Building(PVector newLoc, PVector newLocOr) {
    //setting location.x, location.y, location.z, location.xOr, location.yOr and location.zOr to variable taken in the constructor
    location = newLoc;
    locationOr = newLocOr;
    //setting lR, lG and lB to 50
    lR = 50;
    lG = 50;
    lB = 50;
  }

  void display() {
    //insert ambient light and point light for buildings
    ambientLight(lR, lG, lB);
    pointLight(lR, lG, lB, location.x, location.y, location.z);
    //draw the prism
    prismBuild();
    window();
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
    vertex(-location.x, -location.y, location.z);
    vertex( location.x, -location.y, location.z);
    vertex( location.x, location.y, location.z);
    vertex(-location.x, location.y, location.z);
    vertex(-location.x, -location.y, location.z);

    //rect(-location.x, -location.y, 10, 10);

    endShape();
    
    beginShape();

    vertex(-location.x, -location.y, location.z);
    vertex(-location.x, -location.y, -location.z);
    vertex(-location.x, location.y, -location.z);
    vertex(-location.x, location.y, location.z);
    vertex(-location.x, -location.y, location.z);

    endShape();
    beginShape();

    vertex(-location.x, -location.y, -location.z);
    vertex( location.x, -location.y, -location.z);
    vertex( location.x, location.y, -location.z);
    vertex(-location.x, location.y, -location.z);
    vertex(-location.x, -location.y, -location.z);

    endShape();
    beginShape();

    vertex( location.x, -location.y, -location.z);
    vertex( location.x, -location.y, location.z);
    vertex( location.x, location.y, location.z);
    vertex( location.x, location.y, -location.z);
    vertex( location.x, -location.y, -location.z);

    endShape();
    beginShape();

    vertex(-location.x, -location.y, location.z);
    vertex(-location.x, -location.y, -location.z);
    vertex( location.x, -location.y, -location.z);
    vertex( location.x, -location.y, location.z);
    vertex(-location.x, -location.y, location.z);

    endShape();
    beginShape();

    vertex(-location.x, location.y, location.z);
    vertex(-location.x, location.y, -location.z);
    vertex( location.x, location.y, -location.z);
    vertex( location.x, location.y, location.z);
    vertex(-location.x, location.y, location.z);

    endShape();

    popMatrix();
  }
  
  void window(){
    pushMatrix();
    translate(locationOr.x, locationOr.y, locationOr.z);
    rotateX(PI/4);
    rotateY(PI/2);
    rotateZ(-PI/4);
    noStroke();
    fill(255);
    rect(-location.x/2, -location.y, 10, 10);
    popMatrix();
  }
}