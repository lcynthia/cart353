class Bubble extends Particle {
  //declaring variable for color of stroke of Bubble
  color strokeB;

  Bubble(PVector newLoc) {
    //constructor from parent class taking position, fill color and acceleration
    super(newLoc.x, newLoc.y, color(170, 200, 225, 70), new PVector(random(-0.1, 0.1), random(-0.1, 0.1)));
    strokeB = color(180, 230, 250, 70);
  }

  void display() {
    stroke(strokeB);
    fill(colPart);
    ellipse(location.x, location.y, mass/2, mass/2);
  }
}