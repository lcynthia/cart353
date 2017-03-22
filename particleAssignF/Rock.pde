class Rock extends Particle {

  Rock() {
    //constructor from parent class taking position, fill color and acceleration
    super(random(width/2-15, width/2+15), -10, color(85, 115, 100), new PVector(random(-0.01, 0.01), random(0.5, 0.8)));
  }


  void display() {
    stroke(125);
    fill(colPart);
    rect(location.x, location.y, mass*3, mass*3);
  }


  //function to keep Rock at same opacity while Food is dissolving
  boolean isOut() {
    if (solidity < 0.0) {
      return false;
    } else {
      return false;
    }
  }
}