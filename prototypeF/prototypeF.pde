//declaring Building objects
Building test;
Building test2;
Building test3;
Street terrain;
//creating skyCount variable for array length of Sky
int skyCount = 20;
//creating starCount variable for array length of Star
int starCount = 3000;
//creating array of Sky objects
Sky[] layer = new Sky[skyCount];
//creating array of Star objects
Star[] shine = new Star[starCount];
//creating opaSky for opacity of Sky objects
int opaSky = 30;
//creating opaStar for opacity of Star objects
float opaStar;
//creating m for millis 
float m;


void setup() {
  size(800, 500, P3D);
  //Dark blue background
  background(10, 5, 12);
  //making instances of Star objects
  for (int i = 0; i < starCount; i ++) {
    shine[i] = new Star(new PVector(random(7500), random(5000)), int(random(1, 5)));
  }
  //making instances of Sky objects
  for (int i = 0; i < skyCount; i ++) {
    layer[i] = new Sky(new PVector(0, 60*i, -200), width*4, 60, color(9*i, opaSky));
  }
  //making instance of terrain object
  terrain = new Street(width/2, 400, -250, 500, 800);
  //making instances of Building object
  test = new Building(50, 100, 50, width/2, height/2, 0);
  test2 = new Building(100, 200, 50, width/2, height/4, -600);
  test3 = new Building(25, 150, 30, width/4, 250, 75);
}

void draw() {
  //display Star objects
  for (int i = 0; i < starCount; i ++) {
    shine[i].display();
  }
  //display the terrain
  terrain.display();
  //display Building object
  test.display();
  test2.display();
  test3.display();
  //display Sky objects
  for (int i = 0; i < skyCount; i ++) {
    layer[i].display();
  }
}

void keyPressed() {
  //if up arrow is pressed, increase light of buildings and light shield in sky
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
      opaSky += 0.5;
      // if down arrow is pressed, decrease light of buildings and light shield in sky
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
      opaSky -= 0.5;
    }
  }
}