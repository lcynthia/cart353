//import video library
import processing.video.*;
//library to use random class
import java.util.*;
//declare movie object
Movie skating;
//declare random object
Random generator;

void setup(){
  //size of video
  size(352, 288);
  background(0);
  generator = new Random();
  //retrieve video file
  skating = new Movie(this, "skating.3gp");
  skating.loop();
  
}

void movieEvent(Movie skating){
  skating.read();
}

void draw(){
  //randomization according to gaussian distribution
  float gaus = (float) generator.nextGaussian();
  //scale random value to times 10 (since gaussian return values between 0 and 1)
  float scale  = gaus * 10;
  noiseDetail(8, 0.50);
  //use noise function
  float n = noise(scale);
  float off = noise(gaus)*6;
  //load pixels of video
  loadPixels();
  skating.loadPixels();
  //display video
  image(skating, 0, 0, width, height);
  //for loops to go through every pixel
  for (int x = 0; x < skating.width; x++){
    for (int y = 0; y < skating.height; y++){
      //position of pixels 
      int loc = x + y * skating.width;
      //retrieve RGB value from video
      color cSkating = skating.pixels[loc];
      //map value of noise to the range 0-255
      int bright = int(map(n, 0, 1, 0, 255));
      float r = red(cSkating);
      float g = green(cSkating);
      float b = blue(cSkating);
      //increment RGB value with mapped noise value
      r += bright/off;
      g += bright/(off/3);
      b += bright; 
      //take updated RGB value for each pixel and increment with noise-based value
      skating.pixels[loc] = int(color(r, g, b)+off);
    }
  }
  //update each pixel of video
  skating.updatePixels();
}