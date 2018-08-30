part of life;

class Cell {
  Point location;
  bool alive = false;
  bool aliveNextGeneration = false;
  static const int WIDTH = 20;
  static const int HEIGHT = 20;

  Cell(this.location);
  void draw(CanvasRenderingContext2D c2d) {
    if (alive) {
      c2d.setFillColorRgb(0, 0, 255);
    } else {
      c2d.setFillColorRgb(255, 255, 255);
    }
    c2d.fillRect(location.x * WIDTH, location.y * HEIGHT, WIDTH, HEIGHT);
    c2d.setStrokeColorHsl(0, 0, 0);
    c2d.strokeRect(location.x * WIDTH, location.y * HEIGHT, WIDTH, HEIGHT);
  }
}
