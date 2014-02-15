/**
    This file is part of Lonely Robot Lost In Space.

    Lonely Robot Lost In Space is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Lonely Robot Lost In Space is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with actionman.  If not, see <http://www.gnu.org/licenses/>.
*/
part of lrlis;

class Player {
  ImageElement img;
  int x, y;
  
  static const num dx = 1;
  static const num dy = 1;
  
  Player(this.x, this.y, this.img);
  
  void moveStepX(num xSpeed) {
    x += (dx*xSpeed).round();
  }
  void moveStepY(num ySpeed) {
    y += (dy*ySpeed).round();
  }
  
  void update() {
    if (keyboard.isDown(Keyboard.DOWN))   moveStepY(5);
    if (keyboard.isDown(Keyboard.UP))     moveStepY(-5);
    if (keyboard.isDown(Keyboard.LEFT))   moveStepX(-5);
    if (keyboard.isDown(Keyboard.RIGHT))  moveStepX(5);
  }
}