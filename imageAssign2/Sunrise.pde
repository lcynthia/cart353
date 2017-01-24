//creating class responsible for drawing squares with the color of the image
class Sunrise {
  //declaring sunrise for the first image
  PImage sunrise;
  //declaring dest1 for the first destination image
  PImage dest1;
  //declaring x coordinate for the image
  float xS;
  //declaring y coordinate for the image
  float yS;
  //declaring sizeS for size of square)
  float sizeS;
  //declaring colS for the color of square
  color colS;

  Sunrise(String file) {
    //assigning sunrise to image in project folder
    sunrise = loadImage(file);
    //assigning dest1 to new image
    dest1 = createImage(sunrise.width, sunrise.height, ARGB);
  }
  //function responsible for adjust opacity of image
  void display() {
    //load pixels for source image and destination image
    sunrise.loadPixels();
    dest1.loadPixels();
    //for loop targeting each pixel's x and y coordinate 
    for (int x = 0; x < sunrise.width; x++) {
      for (int y = 0; y < sunrise.height; y++) {
        //assigning locP to the location of the pixels
        int locP = x + y * sunrise.width;
        //retrieving RGB value of source image
        float r = red(sunrise.pixels[locP]);
        float g = green(sunrise.pixels[locP]);
        float b = blue(sunrise.pixels[locP]);
        //mapping variable responsible for opacity of destination image (influenced by mouseX)
        float adjustOpace = map(mouseX, 0, sunrise.width, 0, 300);
        color c = color(r, g, b, adjustOpace);
        //apply opacity change to each pixel
        dest1.pixels[locP] = c;
      }
    }
    dest1.updatePixels();
    //display destination image
    image(dest1, 0, 0, 500, 500);
  }

  //function responsible for adjusting R and B value brightness
  void bright() {
    //load pixels for source image and destination image
    sunrise.loadPixels();
    dest1.loadPixels();
    //for loop targeting each pixel's x and y coordinate 
    for (int x = 0; x < sunrise.width; x++) {
      for (int y = 0; y < sunrise.height; y++) {
        //assigning locP to the location of the pixels
        int locP = x + y * sunrise.width;
        //retrieving RGB value of source image
        float r = red(sunrise.pixels[locP]);
        float g = green(sunrise.pixels[locP]);
        float b = blue(sunrise.pixels[locP]);
        //mapping variable responsible for brightness of destination image (influenced by mouseY)
        float adjustBrightR = map(mouseY, 0, sunrise.height, 1, 12); 
        //float adjustBrightG = map(mouseY, 0, sunrise.height, 1, 10); 
        float adjustBrightB = map(mouseY, 0, sunrise.height, 1, 8);
        //applying brightness to RGB value
        r *= adjustBrightR;
        //g *= adjustBrightG;
        b *= adjustBrightB;
        color c = color(r, g, b);
        //apply opacity change to each pixel
        dest1.pixels[locP] = c;
      }
    }
    dest1.updatePixels();
    //display destination image
    image(dest1, 0, 0, 500, 500);
  }

  //function responsible for making image black and white
  void bAw() {
    //load pixels for source image and destination image
    sunrise.loadPixels();
    dest1.loadPixels();
    //for loop targeting each pixel's x and y coordinate 
    for (int x = 0; x < sunrise.width; x++) {
      for (int y = 0; y < sunrise.height; y++) {
        //assigning locP to the location of the pixels
        int locP = x + y * sunrise.width;
        //retrieving B value of source image
        float b = blue(sunrise.pixels[locP]);
        color c = color(b);
        //apply opacity change to each pixel
        dest1.pixels[locP] = c;
      }
    }
    dest1.updatePixels();
    //display destination image
    image(dest1, 0, 0, 500, 500);
  }
}