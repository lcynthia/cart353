class MainParticle {
  //creating arraylist of Particle to access any kind of particle
  ArrayList<Particle> aquarium;
  //declaring wind to apply on Particle when not in water
  PVector wind;



  MainParticle(PVector location) {
    aquarium = new ArrayList<Particle>();
    wind = new PVector(random(-0.004, 0.004), random(0.001));
  }

  void addFallingPart() {
    //if left mouse button is pressed, create Food particles in arraylist
    if (mousePressed && mouseButton == LEFT) {
      for (int i = 0; i < 10; i++) {
        aquarium.add(new Food());
      }
      //else if right mouse button is pressed, create Rock particles in arraylist
    } else if (mousePressed && mouseButton == RIGHT) {
      for (int i = 0; i < 10; i++) {
        aquarium.add(new Rock());
      }
    }
  }



  void run() {
    Iterator<Particle> it = aquarium.iterator();
    while (it.hasNext()) {
      Particle aquarium = it.next(); //[bold]
      aquarium.run();
      if (aquarium.isOut()) {
        it.remove();
      }
      //if Particle in the air, apply wind
      if (aquarium.isInWater(fluid) == false) {
        aquarium.applyForce(wind);
        aquarium.update();
      }
      //if Particle in Water, apply drag, decrease opacity of Food and keep Rock at bottom when it arrives
      if (aquarium.isInWater(fluid)) {
        aquarium.drag(fluid);
        aquarium.solidity -= 0.3;
        aquarium.bottom(fluid);
        //if spacebar is pressed, stir elements in Water
        if (keyPressed) {
          if (key == 32) {
            aquarium.applyForce(stir);
            aquarium.acceleration.add(0, 0);
          }
        }
      }
    }
  }
}