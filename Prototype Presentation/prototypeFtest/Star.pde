class Star {
  //declaring PVector variable for location of star
  PVector location;
  PVector velocity;
  PVector acceleration;
  //declaring variables for size and color
  int sizeS;
  color colorS;
  float n;
  float change;
  float opa;
  float opaCha;

  
  Star(PVector newLoc, int newSize) {
    //assigning variables to temporary ones taken from constructor 
    location = newLoc;
    velocity = new PVector(0, 0, 0);
    acceleration = new PVector(0, 0, 1);
    sizeS = newSize;
    change = 0;
    opaCha = 0;
  }

  void update(){
    change += 0.1;
    n = map(noise(change), 0, 1, 10, 30);
    acceleration.z = n;
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
  
    //draw stars on canvas
    opaCha += 1;
    opa = map(noise(opaCha), 0, 1, random(200), random(1500));
    noStroke();
    //fill(210, millis()%random(500, 700), 230, millis()%random(200, 1500));
    fill(millis()%opa*100, 210, 230, (millis()%opa*200));
    pushMatrix();
    translate(-3500, -2500, -3000);
    ellipse(location.x, location.y, sizeS*(opa/200), sizeS*(n/5));
    popMatrix();
    //}
  }
//  }
}