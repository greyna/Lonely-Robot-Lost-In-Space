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

class Input {
  final InputEnum enu;
  final Map<int,bool> _downStates;
  final Map<int,bool> _upStates;
  
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
  
  bool isDown(InputEnum enu) => _downStates[enu._value];
  bool isUp(InputEnum enu) => _upStates[enu._value];
  
  void reset() {
    for (var enu in enu.values) {
      if (_upStates[enu._value] == true) _downStates[enu._value] = false;
      _upStates[enu._value] = false;
    }
  }
}

abstract class InputEnum {
  final int _value;
  const InputEnum._internal(this._value);
  List<InputEnum> get values;
}