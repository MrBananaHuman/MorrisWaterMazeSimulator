class Platform {
  float x, y;
  float r;
  boolean is_rect;
  
  Platform(float size, float x_, float y_){
    r = size;
    x = x_;
    y = y_;
  }
  void display(){
    pushMatrix();
    fill(255, 0, 0, 100);
    rectMode(CENTER);
    rect(x, y, r, r);
    popMatrix();
  }
}
