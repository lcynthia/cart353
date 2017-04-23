class CitySystem {
  //creating arraylist of Sky objects
  ArrayList<Sky> shield;
  

  CitySystem() {
    shield = new ArrayList<Sky>();
    
  }

  void shieldOpacity() {
//if arrow up is pressed, add layer of Sky object
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == UP) {
          for (int i = 0; i < 5; i++) {
            shield.add(new Sky(new PVector(-900, 700, -1300), width*3.3, 60, i));
          }
        }
      }
    }
  }

//function to display Sky objects
  void display() {
    Iterator<Sky> it = shield.iterator();
    while (it.hasNext()) {
      Sky shield = it.next();
      shield.display();
    }
    //if arrow down is pressed, remove layer of Sky objects
    if (keyPressed) {
      if (key == CODED) {
        if (keyCode == DOWN) {
          it.remove();
        }
      }
    }
  }
}