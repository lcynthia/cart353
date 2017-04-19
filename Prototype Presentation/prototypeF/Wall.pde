class Wall {
  //declaring location and size of Wall
  PVector location;
  float sizeX;
  float sizeY;
  //declaring size of windows on Wall
  float winX;
  float winY;
  float offset;
  int iD;
  float colWin;

  Wall(PVector newLoc, float newSizeX, float newSizeY, int newID, float newCol) {
    //assigning location, size of wall and id to temporary variables from constructor
    location = newLoc;
    sizeX = newSizeX;
    sizeY = newSizeY;
    iD = newID;
    //setting size of window and offset to specific values
    winX = 5;
    winY = 3;
    offset = 10;
    colWin = newCol;
  }

  //function to draw Wall objects on the four sides of Building and afterwards draw windows on Walls
  void display() {
    pushMatrix();
    
    rectMode(CORNER);
    if (iD == 0) {
      translate(location.x, location.y, location.z);
    } else if (iD == 1) {
      translate(location.x + sizeX, location.y, location.z);
      rotateY(PI/2);
    } else if (iD == 2) {
      translate(location.x + sizeX, location.y, location.z - sizeX);
      rotateY(PI);
    } else if (iD == 3) {
      translate(location.x, location.y, location.z - sizeX);
      rotateY(PI+PI/2);
    }
    noFill();
    stroke(colWin);
    rect(0, 0, sizeX, sizeY);
    window();
    popMatrix();
  }

  //function to draw the windows
  void window() {
    pushMatrix();
    //translate(location.x, location.y, location.z);
    fill(colWin);
    
    noStroke();
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == UP) {
          colWin += 1;
        } else if (keyCode == DOWN) {
          colWin -= 1;
        } 
        println(colWin);
      }
    }
    rectMode(CORNER);
    for (int y = 0; y < sizeY/(winY+offset) - 1; y++) {
      for (int x = 0; x < sizeX/(winX+offset) - 1; x++) {
        rect(x*(winX + offset) + offset, y*(winY + offset) + offset, winX, winY);
      }
    }
    popMatrix();
  }
}