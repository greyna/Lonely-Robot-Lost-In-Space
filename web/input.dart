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
 * input.dart v0.2.1
 * 
 * Code hosted at github.com/greyna/actionman.dart. Made by greyna. Under GPL licence.
 */
part of actionman;

class Input {
  final InputEnum enu;
  final Map<InputEnum,bool> _downStates;
  final Map<InputEnum,bool> _upStates;
  
  Input(InputEnum enu):
    enu = enu,
    _downStates = new Map.fromIterable(enu.values, value: (item) => false),
    _upStates = new Map.fromIterable(enu.values, value: (item) => false)
  {
    
    window.onKeyDown.listen( (e) {
      if (enu.values.contains(e.keyCode)) {
        e.preventDefault();
        _downStates[e.keyCode] = true;
      }
    });
    
    window.onKeyUp.listen( (e) {
      if (enu.values.contains(e.keyCode)) {
        e.preventDefault();
        _upStates[e.keyCode] = true;
      }
    });
  }
  
  bool isDown(InputEnum enu) => _downStates[enu];
  bool isUp(InputEnum enu) => _upStates[enu];
  
  void reset() {
    for (var enu in enu.values) {
      if (_upStates[enu] == true) _downStates[enu] = false;
      _upStates[enu] = false;
    }
  }
}

abstract class InputEnum {
  const InputEnum._internal();
  List<InputEnum> get values;
}