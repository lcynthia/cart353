//importing video library
import processing.video.*;
//assigning countW variable to 5 for array length of lou
int countW = 5;
//assigning countP variable to 1000 for array length of pearls
int countP = 100;
//creating array for World objects
World[] lou = new World[countW];
//declaring Core object as main entity
Core one;
//creating array for Pearl objects
Pearl[] pearls = new Pearl[countP];
//declaring Movie object for video in background
Movie background;
//creating PVector for wind
PVector windX = new PVector(0.0001, random(-0.00005, 0.00005));
//variable for coefficient of friction
float c = 0.02;
//variable for normal force
float normal = 1;
//variable for magnitude of friction
float frictionMag = c*normal;
//variables for increment of rotate value of Core object
float rot = 0.09;
float rotEnd = 0.0;
float incrementR;




void setup() {
  //creating instance of Movie object 
  background = new Movie(this, "backGv.MP4");
  size(600, 338);
  //loop the video
  background.loop();
  //creating for loop to instanciate World objects
  for (int i = 0; i < lou.length; i++) {
    lou[i] = new World(new PVector(300+50*(i*5), height/1.5), "lou" + i + ".JPG");
  }
  //instanciating Core object
  one = new Core();
  //creating for loop to instanciate Pearl objects
  for (int i = 0; i < pearls.length; i++) {
    pearls[i] = new Pearl(new PVector(700+700*i, random(height/1.5, height/1.3)), random(10, 20), color(int(random(255)), int(random(255)), int(random(255)), 140));
  }
}

//function to read the video
void movieEvent(Movie background) {
  background.read();
}

void draw() {
  //display the video on canvas
  image(background, 0, 0, background.width*2, background.height);
  for (int i = 0; i < lou.length; i++) {
    //display World objects
    lou[i].display();
    //get friction from World objects
    PVector friction = lou[i].velocity.get();
    //Compute friction
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMag);
    //display Core object
    one.update();
    one.display();
    for (int j = 0; j < pearls.length; j++) {
      //if little pearl touches the Core object, pearls stop moving (velocity set to 0)
      //slow down the background with friction
      if (one.encounter(pearls[j])) {
        pearls[j].stayP = true;
        pearls[j].velocity = new PVector(0, 0);
        lou[i].applyForce(friction);
      } else {
        //else apply force of attraction of Core object to pearls
        PVector force = one.attract(pearls[j]);
        pearls[j].applyForce(force);
      }
      //on every pearl, apply wind force, display & update position
      pearls[j].applyForce(windX);
      pearls[j].update();

      pearls[j].display();
    }
  }
}

void keyPressed() {
  //creating for loop to go through array of World objects and apply functions to them
  for (int i = 0; i < lou.length; i++) {
    //if right arrow is pressed, make the Core object rotate and update the World objects
    //to make them move to the left
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == RIGHT) {
          one.rotate += rot;
          lou[i].update();
          for (int j = 0; j < pearls.length; j++) {
            //if pearls touch the Core object, decrement the value added to rotate value to slow down rotation
            if (one.encounter(pearls[j])) {
              float rotMid = lerp(rot, rotEnd, j*100/100.0);
              incrementR = rotMid/((j+1)*40);
              one.rotate += incrementR;
              //if value added to rotate reaches zero, leave it to zero (so it doesn't go in negative values)
              if (incrementR < 0) {
                incrementR = 0;
                one.rotate += 0.0;
              }
            }
          }
        }
      }
      //else, stop the rotation and do not make World objects move
    } else {
      one.rotate += 0.0;
    }
  }
}