class Rock extends Particle {
  
  Rock(){
    super(random(width), 0, color(125));
  }
  
  //function responsible for applying fluid force on Rock
  void drag(Water r){
    float speed = velocity.mag();
    float dragMagnitude = r.coe * speed * speed;
    
    PVector drag = velocity.get();
    drag.mult(-1);
    drag.normalize();
    
    drag.mult(dragMagnitude);
    
    applyForce(drag);
  }
  
  boolean isInWater(Water r){
    if(location.x > r.x && location.x < r.x+r.w && location.y > r.y && location.y < r.y+r.h){
      return true;
    } else {
      return false;
  }
}
}