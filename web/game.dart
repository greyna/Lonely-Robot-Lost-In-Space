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
 * game.dart v0.2.0
 * 
 * Code hosted at github.com/greyna/actionman.dart. Made by greyna. Under GPL licence.
 */
part of actionman;

class Game {
  bool looping = false;
  Level level;
  
  void init() {
    Assets.init();
    Input.init();
    
    level = new Level(canvas.width, canvas.height, Assets.imgs['game_assets/img/background.jpg']);
    
    players.add(new Player(0,0, Assets.imgs['game_assets/img/zelda.png']));
  }
  void start() {
    if (!looping) {
      looping = true;
      window.animationFrame.then(_gameLoop);
    }
  }
  void stop() {
    looping = false;
  }

  void _gameLoop(num delta) {
    if (!looping) return;
    players[0].logic();
    draw();
    window.animationFrame.then(_gameLoop);
  }
}