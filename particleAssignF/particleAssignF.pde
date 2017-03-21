MainParticle system;
Water fluid;
void setup(){
  size(700, 700);
  background(150, 80, 130);
  fluid = new Water(0, height/2, width, height/2, 0.1);
  system = new MainParticle(random(width), 0);
}

void draw(){
  fluid.display();
  system.addFallingPart();
  system.run();
}