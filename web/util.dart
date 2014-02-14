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
 * util.dart v0.1.2
 * 
 * Code hosted at github.com/greyna/actionman.dart. Made by greyna. Under GPL licence.
 */
part of actionman;

class ActionOverTime {
  final Stopwatch _elapsedTime = new Stopwatch();
  final Duration _step;
  Function _stepF;
  Timer _periodicTimer;
  bool get isRunning => _elapsedTime.isRunning;
  Duration get timeElapsed => _elapsedTime.elapsed;
  
  // if duration set to null, will run until stop called
  ActionOverTime(final Duration duration, final Duration step, final Function actionStep):
    _step = step {
    // closure with constructor parameters
    _stepF = (Timer timer) {
      if (duration != null && timeElapsed >= duration) stop();
      if (!isRunning) timer.cancel();
      else actionStep();
    };
  }
  
  // call start() while already running does nothing
  void start() {
    if (!isRunning) {
      _elapsedTime.start();
      _periodicTimer = new Timer.periodic(_step, _stepF);
    }
  }
  
  // call stop() will reset the ActionOverTime object to his creation state
  void stop() {
    if (isRunning) {
      _elapsedTime.stop();
      _elapsedTime.reset();
    }
  }
  
}