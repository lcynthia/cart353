//declaring test for Building object
Building test;
Building test2;
Street terrain;


void setup(){
  size(800, 500, P3D);
  background(10, 5, 12);
  //making instance of Building object
  test = new Building(50, 100, 50, width/2, height/2, 0);
  test2 = new Building(100, 200, 50, width/2, height/4, -600);
  terrain = new Street(width/2, 400, -250, 500, 800);
}

void draw(){
  terrain.display();
  //display Building object
  test.display();
  test2.display();
  
  
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == UP){
      test.lR += 1;
      test.lG += 1;
      test.lB += 1;
    } else if(keyCode == DOWN){
      test.lR -= 1;
      test.lG -= 1;
      test.lB -= 1;
    }
  }
}