class Maze {
  float x, y;
  float r;
  
  Maze(float size){
    r = size;
    x = width/2;
    y = height/2;
  }
  
  void display(){
    pushMatrix();
    fill(118, 255, 218);
    ellipseMode(CENTER);
    ellipse(x, y, r, r);
    popMatrix();
  }
  
}
