import processing.video.*;
//Declaring cameraLight for video input
Capture cameraLight;
//declaring CitySystem 
CitySystem main;
//creating cityCount variable for array length of Building
int cityCount = 10;
//declaring Building objects
Building test;
Building[] city = new Building[cityCount];
//declaring Street object
Street terrain;
//declaring Space object
Space one;
////creating skyCount variable for array length of Sky
//int skyCount = 20;
////creating starCount variable for array length of Star
//int starCount = 1000;
////creating array of Sky objects
//Sky[] layer = new Sky[skyCount];
//Sky[] layer2 = new Sky[skyCount];
//Sky[] layer3 = new Sky[skyCount];
//Sky[] layer4 = new Sky[skyCount];
//Sky[] layer5 = new Sky[skyCount];
////creating array of Star objects
//Star[] shine = new Star[starCount];
//Star[] shine2 = new Star[starCount];
//Star[] shine3 = new Star[starCount];
//Star[] shine4 = new Star[starCount];
//Star[] shine5 = new Star[starCount+starCount/2];
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
  //constructing video structure
  //cameraLight = new Capture(this);
  //cameraLight.start();
  //making instances of Star objects
  main = new CitySystem();
  //for (int i = 0; i < starCount; i ++) {
  //  shine[i] = new Star(new PVector(random(8000), random(5000)), int(random(1, 5)));
  //}

  //for (int i = 0; i < starCount; i ++) {
  //  shine2[i] = new Star(new PVector(random(8000), random(5000)), int(random(1, 5)));
  //}
  //for (int i = 0; i < starCount; i ++) {
  //  shine3[i] = new Star(new PVector(random(8000), random(5000)), int(random(1, 5)));
  //}
  //for (int i = 0; i < starCount; i ++) {
  //  shine4[i] = new Star(new PVector(random(8000), random(5000)), int(random(1, 5)));
  //}
  //for (int i = 0; i < starCount; i ++) {
  //  shine5[i] = new Star(new PVector(random(8000), random(8000)), int(random(1, 5)));
  //}

  ////making instances of Sky objects
  //for (int i = 0; i < skyCount; i ++) {
  //  layer[i] = new Sky(new PVector(-1300, 60*i, -1300), width*3.3, 60, color(255-9*i, opaSky));
  //}
  //for (int i = 0; i < skyCount; i ++) {
  //  layer2[i] = new Sky(new PVector(-1300, 60*i, -1300), width*3.3, 60, color(255-9*i, opaSky));
  //}
  //for (int i = 0; i < skyCount; i ++) {
  //  layer3[i] = new Sky(new PVector(-1300, 60*i, -1300), width*3.3, 60, color(255-9*i, opaSky));
  //}
  //for (int i = 0; i < skyCount; i ++) {
  //  layer4[i] = new Sky(new PVector(-1300, 60*i, -1300), width*3.3, 60, color(255-9*i, opaSky));
  //}
  //for (int i = 0; i < skyCount; i ++) {
  //  layer5[i] = new Sky(new PVector(-1300, 60*i, -1300), width*3.3, 60, color(9*i, opaSky));
  //}
  //making instance of terrain object
  terrain = new Street(new PVector(width/2, 4*(height/5), -250), 1000, 1000);
  //making instance of Space object
  one = new Space(-1000, -5000, -2500);
  //making instances of Building object
  for (int i = 0; i < city.length; i++) {
    int sizeCity = int(random(25, 200));
    city[i] = new Building(new PVector(random(-terrain.location.x, terrain.tWidth-300), random(100, 300), 
      random(-700, 100)), sizeCity, sizeCity);
  }
  test = new Building(new PVector(width/2, height/4, 0), 50, 50);
}

//void captureEvent(Capture cameraLight) {
//  cameraLight.read();
//}

void draw() {
  //Dark blue background
  background(10, 5, 12);
  
  
  //camera(mouseX, height/2, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  //translate(-50, 300, -500);
  yCount += 0.005;
  rotateY(yCount);
  //rotateX(yCount);
  main.display();
  //display Star objects
  //for (int i = 0; i < starCount; i ++) {
  //  shine[i].update();
  //  shine[i].display();
  //}
  //for (int i = 0; i < starCount; i ++) {
  //  pushMatrix();
  //  rotateY(PI/2);
  //  shine2[i].update();
  //  shine2[i].display();
  //  popMatrix();
  //}
  //for (int i = 0; i < starCount; i ++) {
  //  pushMatrix();
  //  rotateY(PI);
  //  shine3[i].update();
  //  shine3[i].display();
  //  popMatrix();
  //}
  //for (int i = 0; i < starCount; i ++) {
  //  pushMatrix();
  //  rotateY(PI+PI/2);
  //  shine4[i].update();
  //  shine4[i].display();
  //  popMatrix();
  //}
  //for (int i = 0; i < starCount; i ++) {
  //  pushMatrix();
  //  rotateX(PI+PI/2);
  //  shine5[i].update();
  //  shine5[i].display();
  //  popMatrix();
  //}
  ////display Sky objects
  //for (int i = 0; i < skyCount; i ++) {
  //  layer[i].display();
  //}
  //for (int i = 0; i < skyCount; i ++) {
  //  pushMatrix();
  //  rotateY(PI/2);
  //  layer2[i].display();
  //  popMatrix();
  //}
  //for (int i = 0; i < skyCount; i ++) {
  //  pushMatrix();
  //  rotateY(PI);
  //  layer3[i].display();
  //  popMatrix();
  //}
  //for (int i = 0; i < skyCount; i ++) {
  //  pushMatrix();
  //  rotateY(PI+PI/2);
  //  layer4[i].display();
  //  popMatrix();
  //}

  //display the terrain
  terrain.display();

  //display Space
  //one.display();

  //display Building object
  for (int i = 0; i < city.length; i++) {
    city[i].display();
  }

  test.display();
}

void keyPressed() {
  //if up arrow is pressed, increase light of buildings and light shield in sky
  if (key == CODED) {
    if (keyCode == UP) {


      opaSky += 0.5;
      // if down arrow is pressed, decrease light of buildings and light shield in sky
    } else if (keyCode == DOWN) {


      opaSky -= 0.5;
    }
  }
}

void lightCamera() {
  
}