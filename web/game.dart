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
  num _lastFrameTime = null;
  Queue<num> _lastFrameTimes = new Queue<num>();
  int targetUps = 60; // updates per second
  int get period => 1000~/targetUps;
  int _frameId = null;
  
  Game() {
    Assets.init();
    init();
    new Timer.periodic(new Duration(seconds: 1), _showFps);
  }
  
  void start() {
    if (!looping) {
      looping = true;
      _frameId = window.requestAnimationFrame(_animateFrame);
      new Timer.periodic(new Duration(milliseconds: period), _update);
    }
  }
  
  void stop() {
    looping = false;
    if (_frameId != null) { 
      window.cancelAnimationFrame(_frameId);
      _frameId = null;
    }
    _lastFrameTime = null;
    _lastFrameTimes.clear();
  }
  
  void _update(Timer timer) {
    if (!looping){
      timer.cancel();
      return;
    }
    
    update();
  }
  
  void _animateFrame(num time) {
    _frameTime(time);
    draw();
    _frameId = window.requestAnimationFrame(_animateFrame);
  }
  
  void _frameTime(num time) {
    if (_lastFrameTime != null) {
      _lastFrameTimes.addFirst(time - _lastFrameTime);
      if (_lastFrameTimes.length >= 100) _lastFrameTimes.removeLast();
    }
    
    _lastFrameTime = time;
  }
  
  void _showFps(Timer timer) {
    var fps;
    if (_lastFrameTimes.isNotEmpty)
      fps = ((_lastFrameTimes.length*1000) / _lastFrameTimes.reduce((a,b) => a+b)).round();
    else fps = 'null';

    querySelector("#FPS").innerHtml = "$fps";
  }
}