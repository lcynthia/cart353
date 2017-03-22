import java.util.Iterator;
//declaring MainParticle object (particle system)
MainParticle system;
//declaring Water object
Water fluid;
//declaring variables for array length
int bubLength = 100;
int orgLength = 20;
//creating arrays for Bubble objects and Organism objects
Bubble[] ball = new Bubble[bubLength];
Organism[] living = new Organism[orgLength];
//creating force to stir elements in water
PVector stir = new PVector(random(-0.05, 0.05), random(-0.5, 0.5));

void setup() {
  size(700, 700);
  //constructing Water object
  fluid = new Water(0, height/2, width, height/2, 0.01);
  //constructing Bubble and Organism objects
  for (int i = 0; i < ball.length; i++) {
    ball[i] = new Bubble(new PVector(random(width), random(370, 680)));
  }
  for (int i = 0; i < living.length; i++) {
    living[i] = new Organism();
  }
  //constructing MainParticle object
  system = new MainParticle(new PVector(random(50, 650), -10));
}

void draw() {
  background(120, 100, 110, 150);
  //display Water object
  fluid.display();
  for (int i = 0; i < ball.length; i++) { 
    //maintaining Bubble in Water 
    ball[i].checkEdges(fluid);
    //updating Bubble position
    ball[i].update();
    //display Bubble
    ball[i].display();
    //if spacebar pressed stir Bubble in Water
    if (keyPressed) {
      if (key == 32) {        
        ball[i].applyForce(stir);
        ball[i].acceleration.add(0, 0);
      }
    }
  }

  for (int i = 0; i < living.length; i++) {
    //maintaining Organism in Water 
    living[i].checkEdges(fluid);
    //updating Organism position
    living[i].update();
    //display Organism
    living[i].display();
    //if spacebar pressed stir Organism in Water
    if (keyPressed) {
      if (key == 32) {        
        living[i].applyForce(stir);
        living[i].acceleration.add(0, 0);
      }
    }
  }
  //add Food and Rock from arraylist in MainParticle class
  system.addFallingPart();
  //Iteration in arraylist
  system.run();
}