
Water fluid;
int bubLength = 50;
Bubble[] ball = new Bubble[bubLength];

void setup(){
  size(700, 700);
  background(150, 80, 130);
  fluid = new Water(0, height/2, width, height/2, 0.1);
  for (int i = 0; i < ball.length; i++){
    ball[i] = new Bubble(new PVector(random(width), random(370, 680)));
  }
}

void draw(){
  fluid.display();
  for (int i = 0; i < ball.length; i++){
    ball[i].update();
    ball[i].display();
  }
  
  
  
}