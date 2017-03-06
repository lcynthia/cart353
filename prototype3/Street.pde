class Street{
  int x;
  int y; 
  int z;
  int tLength;
  int tWidth;
  
  Street(int newX, int newY, int newZ, int newLength, int newWidth){
    x = newX;
    y = newY;
    z = newZ;
    tLength = newLength;
    tWidth = newWidth;
  }
  
  void display(){
    fill(155);
    noStroke();
    pushMatrix();
    translate(x, y, z);
    rotateX(PI/2);
    rectMode(CENTER);
    rect(0, 0, tLength, tWidth);
    popMatrix();
  }
}