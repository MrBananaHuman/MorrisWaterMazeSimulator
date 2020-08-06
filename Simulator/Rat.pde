class Rat {
  float r;
  float x, y;
  int reward;
  float d;
  float[] distances = new float[4]; 

  Rat(float size) {
    r = size;
    x = width/2;
    y = height - 20;
  }

  float[] action(int action, Maze m) {
    float centered_x = x - width/2;
    float centered_y = y - height/2;
    d = (sqrt(centered_x*centered_x + centered_y*centered_y) - m.r/2 + r/2);
    if(d < 0){
      reward = 0;
      if (action == 0) {  // move to left
        x -= r/2;
      } else if (action == 1) {  // move to right
        x += r/2;
      } else if (action == 2) {  // move to up
        y -= r/2;
      } else if (action == 3) {  // move to down
        y += r/2;
      }
    } else{
      reward = -1;
      if(x > width/2){
        x -= r/2;
      } else{
        x += r/2;
      }
      if(y < height/2){
        y += r/2;
      } else{
        y -= r/2;
      }
    }
    // x^2 + y^2 = r^2
    distances[3] = sqrt((m.r/2 * m.r/2) - (centered_x * centered_x)) + centered_y - r/2;  // distance from north
    distances[2] = sqrt((m.r/2 * m.r/2) - (centered_x * centered_x)) - centered_y + r/2;  // distance from south
    distances[1] = sqrt((m.r/2 * m.r/2) - (centered_y * centered_y)) + centered_x - r/2;  // distance from west
    distances[0] = sqrt((m.r/2 * m.r/2) - (centered_y * centered_y)) - centered_x + r/2;  // distance from east
    for(int i = 0; i < distances.length; i++){
      if(distances[i] < 0){
        distances[i] = 0;
      }
    }
    return distances;
  }

  void display() {
    pushMatrix();
    noStroke();
    fill(80);
    ellipseMode(CENTER);
    ellipse(x, y, r, r);
    popMatrix();
  }

  void ratReset(Maze m, boolean isRandom) {
    if (isRandom) {
      float rand = (m.r/2 - r/2) * sqrt(random(0, 1));
      float theta = random(0, 1) * 2 * PI;

      x = width/2 + rand * cos(theta);
      y = width/2 + rand * sin(theta);
    } else {
      x = width/2;
      y = height - 20;
    }
  }

  int getReward() {
    return reward;
  }

  boolean innerGoal(Platform pl) {
    if (pl.x - (pl.r/2) <= x + r/2 && pl.x + (pl.r/2) >= x - r/2) {
      if (pl.y + (pl.r/2) >= y - r/2 && pl.y - (pl.r/2) <= y + r/2) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
