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
 * global.dart v0.2.0
 * 
 * Code hosted at github.com/greyna/actionman.dart. Made by greyna. Under GPL licence.
 */
part of actionman;


CanvasElement canvas = querySelector("#canvas");
CanvasRenderingContext2D context = canvas.context2D;
bool imgDrawn = false;
List<Player> players = new List<Player>();
Game game = new Game();
Level level = null;
Input keyboard = new Input(new Keyboard());

class Keyboard extends InputEnum {
  final int _value;
  const Keyboard._internal(this._value): super._internal();
  toString() => 'Keyboard.$_value';
  factory Keyboard() => A;
  static List<Keyboard> get _values => [A, SPACE, ENTER, LEFT, UP, RIGHT, DOWN];
  List<Keyboard> get values => _values;
  
  static const A = const Keyboard._internal(KeyCode.A);
  static const SPACE = const Keyboard._internal(KeyCode.SPACE);
  static const ENTER = const Keyboard._internal(KeyCode.ENTER);
  static const LEFT = const Keyboard._internal(KeyCode.LEFT);
  static const UP = const Keyboard._internal(KeyCode.UP);
  static const RIGHT = const Keyboard._internal(KeyCode.RIGHT);
  static const DOWN = const Keyboard._internal(KeyCode.DOWN);
  
  operator ==(var other) {
    if (other is Keyboard)
      return _value == other._value;
    else if (other is int)
      return _value == other;
    else
      return false;
  }
  int get hashCode => _value;
  
}