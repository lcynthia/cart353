//HOW TO POSITION MESH AS SKYBOX WITH ROTATE
class Space extends Street{
  
  Space(int x, int y, int z){
    super(new PVector(x, y, z), 3000, 3000);
  }
  void display() {
    //draw gray terrain (with the use of a rectangle) on canvas
    noFill();
    stroke(100);
    pushMatrix();
    translate(location.x, location.y, location.z);
    rotateX(PI/16);
    rectMode(CENTER);
    translate(-tWidth/8, -tLength/8);
    flying -= 0.01;
    float yoff = flying;
    for (int y= 0; y < rows; y++) {
      float xoff = 0;
      for (int x = 0; x < cols; x++) {
        terrain[x][y] = map(noise(xoff, yoff), 0, 1, -20, 20);
        xoff += 0.5;
      }
      yoff += 0.5;
    }
    for (int y= 0; y < rows - 1; y++) {
      beginShape(TRIANGLE_STRIP);
      for (int x = 0; x < cols; x++) {
        vertex(x*scale, y*scale, terrain[x][y]);
        vertex(x*scale, (y+1)*scale, terrain[x][y+1]);
        //rect(x*scale, y*scale, scale, scale);
      }
      endShape();
    }
    popMatrix();
  }
}