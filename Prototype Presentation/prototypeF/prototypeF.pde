//declaring Building objects
Building test;
Building test2;
Building test3;
//declaring Street object
Street terrain;
//declaring Space object
Space one;
Wall mur;

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
float yCount = 0;


void setup() {
  //fullScreen(P3D, SPAN);
  size(800, 500, P3D);
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
  terrain = new Street(new PVector(width/2, 4*(height/5), -250), 1000, 1000);
  //making instance of Space object
  one = new Space(-600, -8000, -1700);
  //making instances of Building object

  test = new Building(new PVector(width/2, height/4, 0), 50, 200, 100);

  test2 = new Building(new PVector(width/1.5, height/4, -600), 100, 100, 200);
  test3 = new Building(new PVector(width/4, 150, 75), 150, 300, 50);
  mur = new Wall(new PVector(width-100, height/2, 0), 100, 200);
}

void draw() {
  //Dark blue background
  background(10, 5, 12);
  //camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  //display Star objects
  //yCount += 0.005;
  //rotateY(yCount);
  //rotateX(yCount);
  for (int i = 0; i < starCount; i ++) {
    shine[i].display();
  }
  //display Sky objects
  for (int i = 0; i < skyCount; i ++) {
    layer[i].display();
  }
  //display the terrain
  terrain.display();
  //display Space
  //one.display();
  //display Building object

  test.display();

  test2.display();
  test3.display();
  mur.display();
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