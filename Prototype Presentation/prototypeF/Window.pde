//HOW TO TARGET EACH SIDE OF BUILDING TO DRAW WINDOWS ON
class Window{
  PVector location;
  int sizeWin;
  color colWin;
  
  
  Window(){
    sizeWin = 10;
    colWin = color(155);
  }
  
  void display(Building b){
    pushMatrix();
    translate(b.locationOr.x, b.locationOr.y, b.locationOr.z);
    //rotateY(PI/8);
    
    rotateX(PI/4);
    rotateY(PI/2);
    rotateZ(-PI/4);
    //location = new PVector(b.locationOr.x, b.locationOr.y, b.locationOr.z);
    noStroke();
    fill(colWin);
    //rect(location.x, location.y, sizeWin, sizeWin);
    rect(0, 0, sizeWin, sizeWin);
    popMatrix();
  }
}