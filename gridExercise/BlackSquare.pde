class BlackSquare {

  int x;
  int y;
  int size;
  int col;
  float food;



  BlackSquare(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;

    this.food = random(500, 1000);

    if (white) {
      this.col = 255;
    } else {
      this.col = 0;
    }
  }

  void draw() {


      // reflect the amount of food
      col = (int)map(this.food, 0, 1000, 0, 220);

      // we need to kind of invert this number, since black is 0 which in this case means healthy
      col = 220 - col;


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
      println(this.food);
    }
  }
}