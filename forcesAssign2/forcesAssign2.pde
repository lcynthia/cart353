//importing video library
import processing.video.*;
//assigning count variable to 5 for array length
int count = 5;
//creating array for World objects
World[] lou = new World[count];
//declaring Core object as main entity
Core one;
//declaring Movie object for video in background
Movie background;
PVector wind = new PVector(0.01, 0);


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
}

//function to read the video
void movieEvent(Movie background) {
  background.read();
}

void draw() {
  //display the video on canvas
  image(background, 0, 0, background.width*2, background.height);
  //creating for loop to go through array of World objects and apply functions to them
  for (int i = 0; i < lou.length; i++) {
    lou[i].display();
    if (key == CODED) {
      if (keyCode == RIGHT) {
        one.rotate += 0.02;
        lou[i].update();
      } else {
        one.rotate += 0.0;
      }
    }
  }
  //display Core object
  one.display();
}