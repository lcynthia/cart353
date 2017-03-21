class Bubble extends Particle{
  color strokeB;
  color fillB;

  
  Bubble(PVector newLoc){
    super(newLoc.x, newLoc.y, color(170, 200, 225));
    strokeB = color(180, 230, 250);


  }
  
  void display(){
    stroke(strokeB);
    fill(super.colPart);
    ellipse(location.x, location.y, super.mass, super.mass);
  }
  
}