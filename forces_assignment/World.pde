//creating class responsible for the background, the world in which object is rolling in
class World{
  //declaring PVector for location of infrastructure in the world
  PVector location;
  //declaring wid & hei responsible for the width and height of infrastructure 
  float wid, hei;
  //declaring colorW for the color of infrastructure
  color colorW;
  
  //creating constructor 
  World(PVector newLoc){
    location = newLoc;
    wid = width/12;
    hei = height/1.7;
    colorW = color(200, 170, 230);
  }
  
  //creating function responsible for displaying the world
  void display(){
    building();
  }
  
  //creating function responsible for making buildings
  void building(){
    fill(colorW);
    noStroke();
    rect(location.x, location.y, wid, hei);
    
  }
}