class GridSquare {

  int x;
  int y;
  int size;
  int col;
  float food;


  GridSquare(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;

    this.food = random(500, 1000);

      this.col = 255;
     
    }
  

  void draw() {



    fill(col, 10);
    rect(this.x * size, this.y * size, size, size);
  }

  void update() {
    if(this.food > 0) {
      this.food--;
    }
  }

  void feed() {
    if (this.food < 1000) {
      this.food += 5;
      
    }
  }
}