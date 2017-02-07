int T_SIZE = 32;
PVector gridSize;
ArrayList<ArrayList> map;

class Tile {
  float c;
  float state;

  Tile() {
    c = 180;
    state = 0;
  }
  void draw(int x_, int y_, int size) {
    if (state == 1) {
      int x, y;
      x = x_ * size;
      y = y_ * size;

      stroke(0);
      strokeWeight(2);
      fill(c);

      rect(x, y, size, size);
    } else if (state == 2) {
      int x, y;
      x = x_ * size;
      y = y_ * size;

      stroke(0);
      strokeWeight(2);
      fill(c);

      triangle(x, y, x, y+size, x+size, y+size);
    } else if (state == 3) {
      int x, y;
      x = x_ * size;
      y = y_ * size;

      stroke(0);
      strokeWeight(2);
      fill(c);

      triangle(x, y, x+size, y, x+size, y+size);
    } else if (state == 4) {
      int x, y;
      x = x_ * size;
      y = y_ * size;

      stroke(0);
      strokeWeight(2);
      fill(c);

      triangle(x+size, y, x, y+size, x+size, y+size);
    } else if (state == 5) {
      int x, y;
      x = x_ * size;
      y = y_ * size;

      stroke(0);
      strokeWeight(2);
      fill(c);

      triangle(x, y, x, y+size, x+size, y);
    }
  }
  void setState(float i) {
    state = i;
  }
  void clicked(int dir) {
    if ((state += dir) > 5) state = 0;
  }
};



void setup() {
  //fullScreen();
  size(640, 960);
  gridSize = new PVector(width/T_SIZE, height/T_SIZE - 2);
  map = new ArrayList<ArrayList>();

  for (int i = 0; i < gridSize.x; i++) {
    ArrayList<Tile> row = new ArrayList<Tile>();
    for (int j = 0; j < gridSize.y; j++) {
      Tile tile = new Tile();
      float chance = random(-1, 1);
      tile.setState(1);
      row.add(tile);
    }
    map.add(row);
  }
};

void draw() {
  background(10);

  for (int i = 0; i < gridSize.x; i++) {
    ArrayList<Tile> row = map.get(i);
    for (int j = 0; j < gridSize.y; j++) {
      Tile tile = row.get(j);
      tile.draw(i, j+2, T_SIZE);
    }
  }


  gui();
};

void mouseClicked() {
  int x, y;
  ArrayList<Tile> row;
  Tile tile;

  if (mouseY > 64) {
    x = mouseX/T_SIZE;
    y = (mouseY-64)/T_SIZE;
    row = map.get(x);
    tile = row.get(y);
    println(x, y);
    if (mouseButton == LEFT) tile.clicked(1);
    else tile.clicked(-1);
  }
  else {
    println("on menu");
  }
};

void gui() {
  stroke(0);
  strokeWeight(4);
  fill(140, 150, 140);
  rect(0, 0, width, 64);
};