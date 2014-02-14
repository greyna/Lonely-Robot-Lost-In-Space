part of actionman;


void draw() {
  context.clearRect(0, 0, canvas.width, canvas.height);
  drawLevel(game.level);
  drawPlayer(players[0]);
}

void drawLevel(Level level) {
  _drawImageWithScale(level.background, 0, 0, 2);
  context
    ..rect(0, 0, level.width, level.height)
    ..strokeStyle = 'black'
    ..stroke();
}

void drawPlayer(Player player) {
  _drawImageWithScale(player.img, player.x, player.y, 0.1);
}

void _drawImageWithScale(ImageElement img, int x, int y, num scale) {
  context.drawImageScaled(img, x, y, scale*img.width, scale*img.height);
}


//  context
//    ..beginPath()
//    ..rect(100,100,100,100)
//    ..strokeStyle = 'red'
//    ..fillStyle = 'blue'
//    ..fill()
//    ..stroke()
//    ..closePath();