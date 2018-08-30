part of life;

class Grid {
  static const int NUM_ROW = 25;
  static const int NUM_COL = 25;
  CanvasElement lifeCanvas;
  Map<Point, Cell> cells = new Map();

  Grid(this.lifeCanvas) {
    for (int x = 0; x < NUM_COL; x++) {
      for (int y = 0; y < NUM_ROW; y++) {
        Point location = new Point(x, y); // smys
        cells[location] = new Cell(location); //smys
      }
    }
  }
  Cell getCell(int x, int y) {
    if (x < 0) {
      x = NUM_ROW - 1;
    } else if (x >= NUM_ROW) {
      x = 0;
    }
    if (y < 0) {
      y = NUM_COL - 1;
    } else if (y >= NUM_COL) {
      y = 0;
    }
    return cells[new Point(x, y)];
  }

  void flip(int x, int y) {
    Cell cell = cells[new Point(x ~/ Cell.WIDTH, y ~/ Cell.HEIGHT)];
    cell.alive = !cell.alive;
    cell.draw(lifeCanvas.context2D);
  }

  int aliveNeighbors(Cell cell) {
    int x = cell.location.x, y = cell.location.y;
    int newX, newY;
    int numAlive = 0;
    newX = x - 1;
    newY = y - 1;
    if (getCell(newX, newY).alive) {
      numAlive++;
    }
    newX = x;
    newY = y - 1;
    if (getCell(newX, newY).alive) {
      numAlive++;
    }

    newX = x + 1;
    newY = y - 1;
    if (getCell(newX, newY).alive) {
      numAlive++;
    }
    newX = x - 1;
    newY = y;
    if (getCell(newX, newY).alive) {
      numAlive++;
    }
    newX = x + 1;
    newY = y;
    if (getCell(newX, newY).alive) {
      numAlive++;
    }
    newX = x - 1;
    newY = y + 1;
    if (getCell(newX, newY).alive) {
      numAlive++;
    }
    newX = x;
    newY = y + 1;
    if (getCell(newX, newY).alive) {
      numAlive++;
    }
    newX = x + 1;
    newY = y + 1;
    if (getCell(newX, newY).alive) {
      numAlive++;
    }
    return numAlive;
  }

  void drawOnce() {
    CanvasRenderingContext2D c2d = lifeCanvas.context2D;
    for (Cell cell in cells.values) {
      cell.draw(c2d);
    }
  }

  void update(Timer t) {
    for (Cell cell in cells.values) {
      int livingNeighbors = aliveNeighbors(cell);
      cell.aliveNextGeneration = false;

      if (cell.alive) {
        if (livingNeighbors == 3 || livingNeighbors == 2) {
          cell.aliveNextGeneration = true;
        }
      } else {
        if (livingNeighbors == 3) {
          cell.aliveNextGeneration = true;
        }
      }
    }
    CanvasRenderingContext2D c2d = lifeCanvas.context2D;
    for (Cell cell in cells.values) {
      cell.alive = cell.aliveNextGeneration;
      cell.draw(c2d);
    }
  }
}
