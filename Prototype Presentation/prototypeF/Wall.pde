class Wall{
  //declaring location and size of Wall
  PVector location;
  float sizeX;
  float sizeY;
  //declaring size of windows on Wall
  float winX;
  float winY;
  float offset;
  
  Wall(PVector newLoc, float newSizeX, float newSizeY){
    location = newLoc;
    sizeX = newSizeX;
    sizeY = newSizeY;
    
    winX = 5;
    winY = 3;
    offset = 10;
  }
  
  void display(){
    pushMatrix();
    translate(location.x, location.y, location.z);
    fill(125);
    stroke(255);
    rectMode(CORNER);
    rect(0, 0, sizeX, sizeY);
    window();
    popMatrix();
  }
  
  void window(){
    pushMatrix();
    //translate(location.x, location.y, location.z);
    fill(255);
    noStroke();
    rectMode(CORNER);
    for (int y = 0 ; y < sizeY/(winY+offset) - 1; y++){
      for (int x = 0; x < sizeX/(winX+offset) - 1; x++){
        rect(x*(winX + offset) + offset, y*(winY + offset) + offset, winX, winY);
      }
    }
    popMatrix();
  }
  
}