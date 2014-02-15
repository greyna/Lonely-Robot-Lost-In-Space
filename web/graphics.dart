/*
    This file is part of actionman.

    actionman is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    actionman is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with actionman.  If not, see <http://www.gnu.org/licenses/>.
*/
/**
 * graphics.dart v0.2.0
 * 
 * Code hosted at github.com/greyna/actionman.dart. Made by greyna. Under GPL licence.
 */
part of actionman;


void draw() {
  context.clearRect(0, 0, canvas.width, canvas.height);
  drawLevel(level);
  drawPlayer(players[0]);
}

void drawLevel(Level level) {
  _drawImageWithScale(level.background, 0, 0, 0.6);
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