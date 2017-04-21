class Sky {
  //declaring PVector for location
  PVector location;
  //declaring variables for width and height of rectangles constituting the sky
  float sizeX;
  float sizeY;
  //declaring offset for spacing between each rectangle
  float offset;
  //declaring sColor for color of the rectangles
  color sColor;
  int iD;
  

  Sky(PVector newLoc, float newSizeX, float newSizeY, color newColor, int newId) {
    //assigning variables to temporary ones taken from constructor 
    location = newLoc;
    sizeX = newSizeX;
    sizeY = newSizeY;
    sColor = newColor;
    offset = sizeY;
    iD = newId;
  }

  void display() {
    
    //sColor for fill taken from constructor
    
   // pushMatrix();
    //translate(location.x, location.y, location.z);
   
    //draw rectangle
    if (iD == 0) {
      pushMatrix();
      translate(location.x, location.y, location.z);
      drawRects();
      popMatrix();
       //rotateX(PI);
    } else if (iD == 1) {
      pushMatrix();
      translate(location.x + sizeX, location.y, location.z);
      rotateY(-PI/2);
       drawRects();
      popMatrix();
    } else if (iD == 2) {
      pushMatrix();
      translate(location.x + sizeX, location.y, location.z + sizeX);
      rotateY(-PI);
       drawRects();
      popMatrix();
    } else if (iD == 3) {
      pushMatrix();
      translate(location.x, location.y, location.z + sizeX);
      rotateY(-(PI+PI/2));
       drawRects();
      popMatrix();
    }
    else if (iD == 4) {
      pushMatrix();
      translate(location.x + sizeX/6, -location.y, location.z);
      rotateX(-PI/2);
       drawRects();
      popMatrix();
    }
    
   
   // popMatrix();
  }
  
  void drawRects()
  {
     for (int i = 0; i < 20; i++){
    fill(sColor*i);
    noStroke();
    rect(0, -60*i, sizeX, sizeY);
    }
  }
}