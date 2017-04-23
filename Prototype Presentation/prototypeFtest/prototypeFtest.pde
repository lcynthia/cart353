import processing.video.*;
import java.util.Iterator;
//Declaring cameraLight for video input
Capture cameraLight;
//creating cityCount variable for array length of Building
int cityCount = 10;
//declaring Building objects
Building test;
Building[] city = new Building[cityCount];
//declaring Street object
Street terrain;
//declaring Space object
Space one;
//creating skyCount variable for array length of Sky
int skyCount = 20;
//creating starCount variable for array length of Star
int starCount = 1000;
//declaring whiteVal for color of Sky objects
float whiteVal = 1;
//declaring CitySystem
CitySystem light;
//creating array of Star objects
Star[] shine = new Star[starCount];
Star[] shine2 = new Star[starCount];
Star[] shine3 = new Star[starCount];
Star[] shine4 = new Star[starCount];
Star[] shine5 = new Star[starCount+starCount/2];
//creating opaSky for opacity of Sky objects
float opaSky = 20;
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

  for (int i = 0; i < starCount; i ++) {
    shine[i] = new Star(new PVector(random(8000), random(5000)), int(random(1, 5)));
  }

  for (int i = 0; i < starCount; i ++) {
    shine2[i] = new Star(new PVector(random(8000), random(5000)), int(random(1, 5)));
  }
  for (int i = 0; i < starCount; i ++) {
    shine3[i] = new Star(new PVector(random(8000), random(5000)), int(random(1, 5)));
  }
  for (int i = 0; i < starCount; i ++) {
    shine4[i] = new Star(new PVector(random(8000), random(5000)), int(random(1, 5)));
  }
  for (int i = 0; i < starCount; i ++) {
    shine5[i] = new Star(new PVector(random(8000), random(8000)), int(random(1, 5)));
  }
  //making instance of CitySystem
  light = new CitySystem();
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
  translate(test.locationOr.x, test.locationOr.y, test.locationOr.z);
  yCount += 0.005;
  rotateY(yCount);
  //rotateX(yCount);
  //display Star objects
  for (int i = 0; i < starCount; i ++) {
    shine[i].update();
    shine[i].display();
  }
  for (int i = 0; i < starCount; i ++) {
    pushMatrix();
    rotateY(PI/2);
    shine2[i].update();
    shine2[i].display();
    popMatrix();
  }
  for (int i = 0; i < starCount; i ++) {
    pushMatrix();
    rotateY(PI);
    shine3[i].update();
    shine3[i].display();
    popMatrix();
  }
  for (int i = 0; i < starCount; i ++) {
    pushMatrix();
    rotateY(PI+PI/2);
    shine4[i].update();
    shine4[i].display();
    popMatrix();
  }
  for (int i = 0; i < starCount; i ++) {
    pushMatrix();
    rotateX(PI+PI/2);
    shine5[i].update();
    shine5[i].display();
    popMatrix();
  }
  
  //display CitySystem
  light.shieldOpacity();
  light.display();

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
      if(whiteVal<255)
      opaSky += 0.25;
      whiteVal += 0.25;
      // if down arrow is pressed, decrease light of buildings and light shield in sky
    } else if (keyCode == DOWN) {
      opaSky -= 0.25;
      whiteVal -= 0.25;
    }
  }
}

void lightCamera() {
  
}