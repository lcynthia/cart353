World stand;
Core one;


void setup(){
  size(700, 400);
  background(0);
  stand = new World(new PVector(width/6, height/4));
  one = new Core();
}

void draw(){
  background(0);
  stand.display();
  one.update();
  one.display();
}