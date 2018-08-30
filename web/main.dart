library life;

import 'dart:html';
import 'dart:async';
import 'dart:math';

part 'cell.dart';
part 'grid.dart';

Timer timer;
Grid grid;

void clickHappened(MouseEvent me) {
  int clickX = me.offset.x;
  int clickY = me.offset.y;
  grid.flip(clickX, clickY);
}

void startStopTimer(MouseEvent me) {
  if (timer == null) {
    timer = new Timer.periodic(const Duration(seconds: 1), grid.update);
    querySelector("#startStop").text = "Stop";
  } else {
    timer.cancel();
    timer = null;
    querySelector("#startStop").text = "start";
  }
}

void main() {
  CanvasElement lifeCanvas = querySelector("#lifeCanvas");
  grid = new Grid(lifeCanvas);
  grid.drawOnce();
  lifeCanvas.onClick.listen(clickHappened);
  querySelector("#startStop").onClick.listen(startStopTimer);
}
