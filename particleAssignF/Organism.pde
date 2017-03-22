class Organism extends Particle {

  Organism() {
    //constructor from parent class taking position, fill color and acceleration
    super(random(width), random(370, 680), color(190, 210, 160, 150), new PVector(random(-0.4, 0.4), random(-0.05, 0.05)));
  }

  void display() {
    fill(colPart);
    ellipse(location.x, location.y, mass*6, mass*4);
  }
}