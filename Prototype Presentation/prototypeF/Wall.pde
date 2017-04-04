class Wall{
  //declaring location and size of Wall
  PVector location;
  float sizeX;
  float sizeY;
  //declaring location and size of windows on Wall
  PVector locationWin;
  float winX;
  float winY;
  float offset;
  
  Wall(PVector newLoc, float newSizeX, float newSizeY){
    location = new PVector();
    location = newLoc;
    locationWin = location.add(10, 10);
    sizeX = newSizeX;
    sizeY = newSizeY;
    
    winX = 5;
    winY = 3;
    offset = 10;
  }
  
  void display(){
    pushMatrix();
    fill(125);
    stroke(255);
    rectMode(CORNER);
    rect(location.x, location.y, sizeX, sizeY);
    window();
    popMatrix();
  }
  
  void window(){
    pushMatrix();
    translate(location.x, location.y);
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