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
 * player.dart v0.1.2
 * 
 * Code hosted at github.com/greyna/actionman.dart. Made by greyna. Under GPL licence.
 */
part of actionman;

class Player {
  ImageElement img;
  int x, y;
  bool movingRight = false, movingUp = false,
      movingLeft = false, movingDown = false;

  Map<String, ActionOverTime> actions = new Map<String, ActionOverTime>();

  
  static const num dx = 1;
  static const num dy = 1;
  
  Player(this.x, this.y, this.img) {
    ActionOverTime moveRight = new ActionOverTime(null,
        const Duration(milliseconds:20), () => moveStepX(5));
    ActionOverTime moveLeft = new ActionOverTime(null,
        const Duration(milliseconds:20), () => moveStepX(-5));
    ActionOverTime moveDown = new ActionOverTime(null,
        const Duration(milliseconds:20), () => moveStepY(5));
    ActionOverTime moveUp = new ActionOverTime(null,
        const Duration(milliseconds:20), () => moveStepY(-5));

    actions['moveLeft'] = moveLeft;
    actions['moveRight'] = moveRight;
    actions['moveUp'] = moveUp;
    actions['moveDown'] = moveDown;

    Input.addCallback(Input.RIGHT, Input.KeyDown, () => movingRight = true);
    Input.addCallback(Input.RIGHT, Input.KeyUp, () => movingRight = false);
    Input.addCallback(Input.LEFT, Input.KeyDown, () => movingLeft = true);
    Input.addCallback(Input.LEFT, Input.KeyUp, () => movingLeft = false);
    Input.addCallback(Input.UP, Input.KeyDown, () => movingUp = true);
    Input.addCallback(Input.UP, Input.KeyUp, () => movingUp = false);
    Input.addCallback(Input.DOWN, Input.KeyDown, () => movingDown = true);
    Input.addCallback(Input.DOWN, Input.KeyUp, () => movingDown = false);
    
//    new Timer(new Duration(seconds: 3), () => ic1.remove());
//    new Timer(new Duration(seconds: 6), () { ic1.add(); ic2.remove(); } );
//    new Timer(new Duration(seconds: 9), () => ic1.remove());
    
  }
  
  void moveStepX(num xSpeed) {
    if (movingRight && movingLeft) return;
    x += (dx*xSpeed).ceil();
  }
  void moveStepY(num ySpeed) {
    if (movingUp && movingDown) return;
    y += (dy*ySpeed).ceil();
  }
  
  void logic() {
    if (movingRight) actions['moveRight'].start();
    else actions['moveRight'].stop();
    
    if (movingLeft) actions['moveLeft'].start();
    else actions['moveLeft'].stop();
    
    if (movingUp) actions['moveUp'].start();
    else actions['moveUp'].stop();
    
    if (movingDown) actions['moveDown'].start();
    else actions['moveDown'].stop();
  }
}