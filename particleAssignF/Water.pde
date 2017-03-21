class Water{
  float x, y, w, h;
  float coe;
  
  Water(float newX, float newY, float newW, float newH, float newCoe){
    x = newX;
    y = newY;
    w = newW;
    h = newH;
    coe = newCoe;
  }
  
  void display(){
    noStroke();
    fill(150, 150, 255);
    rect(x, y, w, h);
  }
}