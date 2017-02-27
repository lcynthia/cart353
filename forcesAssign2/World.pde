//creating class responsible for the background, the world in which object is rolling in
class World{
  //declaring PVector for location of infrastructure in the world
  PVector location;
  PVector velocity;
  PVector acceleration;
  PImage lou;
  //declaring wid & hei responsible for the width and height of infrastructure 
  float wid, hei;
  //declaring colorW for the color of infrastructure
  color colorW;
  
  //creating constructor 
  World(PVector newLoc, String file){
    location = newLoc;
    velocity = new PVector(0, 0);
    acceleration = new PVector(-1, 0);
    //load image specified in constructor
    lou = loadImage(file);
    wid = width/12;
    hei = height/1.7;
    colorW = color(200, 170, 230);
  }
  
  //creating function responsible for displaying the world
  void display(){
     image(lou, location.x+lou.width, height/1.7-lou.height, lou.width*2, lou.height*2);
     //float r = red(lou.pixels);
     //float g = green(lou.pixels);
     //float b = blue(lou.pixels);
     
     //if (location.x < width/2 - lou.width){
     //  color c = color(r);
     //  lou.pixels = c; 
     //}
     noStroke();
     fill(200, 150, 110);
     rect(0, height/1.4, width, height/1.7);
    }

  
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    if (location.x < -lou.width*4){
      location.x = width + lou.width;
    }
  }
}