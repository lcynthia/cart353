boolean white = true;
GridSquare[][] grid;
BlackSquare[][] grid2;
int rows;
int cols;
int gridSquareSize;

void setup() {

  size(400, 400);
  noStroke();
  rows = 8;
  cols = 8;
  gridSquareSize = 50;

  grid = new GridSquare[cols][rows];
  grid2 = new BlackSquare[cols][rows];

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (white){
      grid[i][j] = new GridSquare(i, j, gridSquareSize);
      } else {
        grid2[i][j] = new BlackSquare(i, j, gridSquareSize);
      }
      white = !white;
    }
    
    white = !white;
  }
}

void draw() {
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (white){
      grid[i][j].draw();
      } else {
      grid2[i][j].update();  
      grid2[i][j].draw();
      //grid2[i][j].feed();
      }
      white = !white;
    }
    white = !white;
  }
  
  grid2[1][1].feed();
  
   //do a mouseOver effect

  //int currentHorizSquare = mouseX / 50;
  //int currentVertSquare = mouseY / 50;

  //if (currentHorizSquare >= 0 && currentHorizSquare <= 7 && currentVertSquare >= 0 && currentVertSquare <= 7) {
  //    println(currentHorizSquare);
  //    println(currentVertSquare);
  //    grid2[currentHorizSquare][currentVertSquare].feed();
      
  //}
}