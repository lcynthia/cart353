class Pearl{
  //declaring PVectors for Pearl's location, velocity & acceleration
  PVector location;
  PVector velocity;
  PVector acceleration;
  //declaring sizeP for the size of the pearl (related to mass)
  float sizeP;
  //declaring colorP for the color of the pearl
  color colorP;
  
  //creating constructor 
  Pearl(float newSize, color newCol){
    location = new PVector(900, height/1.1);
    velocity = new PVector(0, 0);
    acceleration = new PVector(1, 0);
    sizeP = newSize;
    colorP = newCol;
  }
  
  //creating function to display the pearl
  void display(){
    noStroke();
    fill(colorP);
    ellipse(location.x, location.y, sizeP, sizeP);
  }
}