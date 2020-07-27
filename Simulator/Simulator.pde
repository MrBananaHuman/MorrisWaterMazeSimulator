import processing.net.*;
Client myClient;

Rat rat;
Maze maze;
Platform platform;

void setup(){
  size(600, 600);
  //myClient = new Client(this, "127.0.0.1", 3030);
  rat = new Rat(20);
  maze = new Maze(width);
  platform = new Platform(50, width/2, 100);
}

void draw(){
  background(0);
  maze.display();
  platform.display();
  rat.display();
  if(rat.innerGoal(platform)){
    rat.ratReset(maze, true);
  }
  rat.action(int(random(0, 4)), maze);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      rat.action(0, maze);
    } else if (keyCode == RIGHT) {
      rat.action(1, maze);
    } else if (keyCode == UP) {
      rat.action(2, maze);
    } else if (keyCode == DOWN) {
      rat.action(3, maze);
    }
  }
}
