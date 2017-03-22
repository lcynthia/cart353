class Particle {
  //declaring variables for particle's location, velocity and acceleration
  PVector location;
  PVector velocity;
  PVector acceleration;
  //declaring variable for degradation of particle (opacity)
  float solidity;
  //declaring variable for size of particle
  float mass;
  //declaring variable for color of particle
  color colPart;

  Particle(float x, float y, color newCol, PVector newAcc) {
    //color, location and acceleration assigned to temp variable from constructor
    colPart = newCol;
    location = new PVector(x, y);
    acceleration = newAcc;
    velocity = new PVector(0, 0);
    //start off with full opacity
    solidity = 255;
    mass = 5;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  //function calling function to update position and display particle
  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);

    acceleration.mult(0);
  }

  void display() {
    fill(colPart);
    ellipse(location.x, location.y, mass, mass);
  }

  //function to contain particle within water on canvas
  void checkEdges(Water r) {
    if (location.x > r.x + r.w - mass) {
      velocity.x *= -1;
    } else if (location.x < r.x + mass) {
      velocity.x *= -1;
    }

    if (location.y > r.y + r.h - mass) {
      velocity.y *= -1;
    } else if (location.y < r.y + mass) {
      velocity.y *= -1;
    }
  }

  //function to keep particle (Rock) at bottom when it arrives there
  void bottom(Water r) {
    if (location.x > r.x + r.w - mass*3) {
      velocity.x *= 0;
    } else if (location.x < r.x + mass*3) {
      velocity.x *= 0;
    }
    if (location.y > r.y + r.h - mass*3) {
      velocity.y *= 0;
    }
  }

  //function to drag particle (Food and Rock) when in Water
  void drag(Water r) {
    float speed = velocity.mag();
    float dragMagnitude = r.coe * speed * speed;

    PVector drag = velocity.get();
    drag.mult(-1);
    drag.normalize();

    drag.mult(dragMagnitude);

    applyForce(drag);
  }

  //function to check if particle is in Water 
  boolean isInWater(Water r) {
    if (location.x > r.x && location.x < r.x+r.w && location.y > r.y && location.y < r.y+r.h) {
      return true;
    } else {
      return false;
    }
  }

  //function to check if particle (Food) has dissolved
  boolean isOut() {
    if (solidity < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}