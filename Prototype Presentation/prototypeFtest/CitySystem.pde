class CitySystem {
  //creating skyCount variable for array length of Sky
  int skyCount = 20;

  ArrayList<Sky> shield;
  float colShield;

  CitySystem() {
    shield = new ArrayList<Sky>();
    
  }

  void shieldOpacity() {

    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == UP) {
          for (int i = 0; i < 6; i++) {
            shield.add(new Sky(new PVector(-1300, 700, -1300), width*3.3, 60, i));
          }
        }
      }
    }
  }

  void display() {
    Iterator<Sky> it = shield.iterator();
    while (it.hasNext()) {
      Sky shield = it.next();
      shield.display();
    }
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == DOWN) {
          it.remove();
        }
      }
    }
  }
}