//declaring test for Building object
Building test;
Building test2;
Building test3;
Street terrain;
int skyCount = 20;
Sky[] layer = new Sky[skyCount];
int opaSky = 50;


void setup() {
  size(800, 500, P3D);
  background(10, 5, 12);
  //making instance of Building object
  test = new Building(50, 100, 50, width/2, height/2, 0);
  test2 = new Building(100, 200, 50, width/2, height/4, -600);
  test3 = new Building(25, 150, 30, width/4, 250, 75);
  terrain = new Street(width/2, 400, -250, 500, 800);
  for (int i = 0; i < skyCount; i ++) {

    layer[i] = new Sky(new PVector(0, 60*i, -200), width*4, 60, color(9*i, opaSky));
  }
}

void draw() {
  terrain.display();
  //display Building object
  test.display();
  test2.display();
  test3.display();
  for (int i = 0; i < skyCount; i ++) {
    layer[i].display();
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      test.lR += 1;
      test.lG += 1;
      test.lB += 1;
      test2.lR += 1;
      test2.lG += 1;
      test2.lB += 1;
      test3.lR += 1;
      test3.lG += 1;
      test3.lB += 1;
      opaSky += 1;
    } else if (keyCode == DOWN) {
      test.lR -= 1;
      test.lG -= 1;
      test.lB -= 1;
      test2.lR -= 1;
      test2.lG -= 1;
      test2.lB -= 1;
      test3.lR -= 1;
      test3.lG -= 1;
      test3.lB -= 1;
      opaSky -= 1;
    }
  }
}