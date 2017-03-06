class Building{
  int x;
  int y;
  int z;
  int xOr;
  int yOr;
  int zOr;
  int h;
  int lR;
  int lG;
  int lB;

  
  
  Building(int newX, int newY, int newZ, int newXor, int newYor, int newZor){
    x = newX;
    y = newY;
    z = newZ;
    xOr = newXor;
    yOr = newYor;
    zOr = newZor;
    lR = 50;
    lG = 50;
    lB = 50;
  }
  
  void display(){
    ambientLight(lR, lG, lB);
    pointLight(lR, lG, lB, x, y, z);
    prismBuild();
    pushMatrix();
    translate(width/4, height/4);
    box(100);
    popMatrix();
  }
  
  void prismBuild(){
    pushMatrix();
    translate(xOr, yOr, zOr);
    stroke(255);
    rotateX(PI/4);
    rotateY(PI/2);
    rotateZ(-PI/4);
    //noFill();
    fill(lR, lR);
    //how to make glowing (blur) effect only on buildings?
    filter(BLUR, 2);
    fill(255);
    
    beginShape();
    vertex(-x, -y,  z);
    vertex( x, -y,  z);
    vertex( x,  y,  z);
    vertex(-x,  y,  z);
    vertex(-x, -y,  z);
    
    endShape();
    beginShape();
    
    vertex(-x, -y,  z);
    vertex(-x, -y, -z);
    vertex(-x,  y, -z);
    vertex(-x,  y,  z);
    vertex(-x, -y,  z);
    
    endShape();
    beginShape();
    
    vertex(-x, -y, -z);
    vertex( x, -y, -z);
    vertex( x,  y, -z);
    vertex(-x,  y, -z);
    vertex(-x, -y, -z);
    
    endShape();
    beginShape();
    
    vertex( x, -y, -z);
    vertex( x, -y,  z);
    vertex( x,  y,  z);
    vertex( x,  y, -z);
    vertex( x, -y, -z);
    
    endShape();
    beginShape();
    
    vertex(-x, -y,  z);
    vertex(-x, -y, -z);
    vertex( x, -y, -z);
    vertex( x, -y,  z);
    vertex(-x, -y,  z);
    
    endShape();
    beginShape();
    
    vertex(-x,  y,  z);
    vertex(-x,  y, -z);
    vertex( x,  y, -z);
    vertex( x,  y,  z);
    vertex(-x,  y,  z);
    
    endShape();
    
    popMatrix();
  }
}