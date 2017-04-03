//HOW TO POSITION MESH AS SKYBOX WITH ROTATE
class Space extends Street{
  PImage spacy;
  
  Space(int x, int y, int z){
    super(new PVector(x, y, z), 12000, 3000);
    spacy = loadImage("milky way.jpg");
  }
  void display() {   
    //draw gray terrain (with the use of a rectangle) on canvas
    //stroke(100);
    noStroke();
    pushMatrix();
    translate(location.x, location.y, location.z);
    rotateX(PI/22);
    rectMode(CENTER);
    translate(-tWidth/8, -tLength/4);
    flying -= 0.01;
    float yoff = flying;
    for (int y= 0; y < rows; y++) {
      float xoff = 0;
      for (int x = 0; x < cols; x++) {
        terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
        xoff += 0.05;
      }
      yoff += 0.05;
    }
    for (int y= 0; y < rows - 1; y++) {
      beginShape(TRIANGLE_STRIP);
      texture(spacy);
      for (int x = 0; x < cols; x++) {
        
        vertex(x*scale, y*scale, terrain[x][y], 0, 0);
        vertex(x*scale, (y+1)*scale, terrain[x][y+1], 1024, 1024);
        //rect(x*scale, y*scale, scale, scale);
      }
      endShape();
    }
    popMatrix();
  }
}