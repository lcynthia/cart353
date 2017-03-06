class Sky{
  PVector location;
  int sizeX;
  int sizeY;
  int offset;
  color sColor;
  
  Sky(PVector newLoc, int newSizeX, int newSizeY, color newColor){
    location = newLoc;
    sizeX = newSizeX;
    sizeY = newSizeY;
    sColor = newColor;
    offset = sizeY;
  }
  
  void display(){
    fill(sColor);
    noStroke();
    pushMatrix();
    translate(0, -200, -700);
    rect(location.x, location.y, sizeX, sizeY);
    popMatrix();
    
  }
  
}