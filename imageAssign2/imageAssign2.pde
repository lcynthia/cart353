//declaring 2 sunrise instances for the two source images
Sunrise image1;
Sunrise image2;

void setup() {
  size(500, 500);
  //instanciating the 2 sunrise objects
  image1 = new Sunrise("SAM_6552.JPG");
  image2 = new Sunrise("SAM_6645.JPG");
}

void draw() {
  //setting background to black
  background(0);
  //if left mouse button is pressed, shift to second image (hold on to stay on image)
  if (mousePressed && mouseButton == LEFT) {
    image2.display();
    //if 'c' is pressed, adjust brightness
    if (key == 99) {
      image2.bright();
    }
    //if 'b' is pressed, put image to black and white
    if (key == 98) {
      image2.bAw();
    }
    //else if left mouse button not pressed, display first image
  } else {
    image1.display();
    //if 'c' is pressed, adjust brightness
    if (key == 99) {
      image1.bright();
    }
    //if 'b' is pressed, put image to black and white
    if (key == 98) {
      image1.bAw();
    }
  }
}

//function keypressed for saving image when spacebar is pressed
void keyPressed() {
  if (key == 32) {
    save("modif.jpg");
  }
}