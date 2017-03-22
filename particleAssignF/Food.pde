class Food extends Particle {

  Food() {
    //constructor from parent class taking position, fill color and acceleration
    super(random(width/2-15, width/2+15), 0, color(230, 200, 130), new PVector(random(-0.01, 0.01), random(0.2, 0.5)));
  }

  void display() {
    noStroke();
    fill(colPart, solidity);
    triangle(location.x, location.y, location.x - mass, location.y + mass, location.x + mass, location.y + mass);
  }
}