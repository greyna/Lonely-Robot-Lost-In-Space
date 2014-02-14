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
 * input.dart v0.1.2
 * 
 * Code hosted at github.com/greyna/actionman.dart. Made by greyna. Under GPL licence.
 */
part of actionman;

/// Input is an enum of keys as well as container for static input methods.
class Input {
  final _value;
  const Input._internal(this._value);
  toString() => 'Input.$_value';

  static const A = const Input._internal('A');
  static const SPACE = const Input._internal('SPACE');
  static const ENTER = const Input._internal('ENTER');
  static const LEFT = const Input._internal('LEFT');
  static const UP = const Input._internal('UP');
  static const RIGHT = const Input._internal('RIGHT');
  static const DOWN = const Input._internal('DOWN');
  static const KeyDown = const Input._internal('KeyDown');
  static const KeyUp = const Input._internal('KeyUp');
  
  static Map<Input,int> keycodesFromKeys =
    {Input.A : KeyCode.A,
     Input.SPACE : KeyCode.SPACE,
     Input.ENTER : KeyCode.ENTER,
     Input.LEFT : KeyCode.LEFT,
     Input.UP : KeyCode.UP,
     Input.RIGHT : KeyCode.RIGHT,
     Input.DOWN : KeyCode.DOWN};
  static Map<int, Input> keysFromKeycodes = null;
  static Map<Input,List<Function>> downCallbacks = new Map<Input,List<Function>>();
  static Map<Input,List<Function>> upCallbacks = new Map<Input,List<Function>>();
  
  static void init() {
    keysFromKeycodes = new Map.fromIterables(keycodesFromKeys.values, keycodesFromKeys.keys);
    
    window.onKeyDown.listen( (e) {
      int keyCode = e.keyCode;
      if (keysFromKeycodes.containsKey(keyCode)) {
        e.preventDefault();
        List<Function> callback = downCallbacks[keysFromKeycodes[keyCode]];
        if (callback!=null)
          for (Function f in callback)
            f();
      }
    });
    
    window.onKeyUp.listen( (e) {
      int keyCode = e.keyCode;
      if (keysFromKeycodes.containsKey(keyCode)) {
        e.preventDefault();
        List<Function> callback = upCallbacks[keysFromKeycodes[keyCode]];
        if (callback!=null)
          for (Function f in callback)
            f();
      }
    });
  }
  
  static InputCallback addCallback(Input key, Input keyType, Function callback) {
    _addCallback(key, keyType, callback);
    return new InputCallback(key, keyType, callback);
  }
  
  static void _addCallback(Input key, Input keyType, Function callback) {
    if (!keycodesFromKeys.containsKey(key))
      throw "'$key' is not mapped to a keycode";
    
    switch (keyType) {
      case Input.KeyDown:
        if (!downCallbacks.containsKey(key)) downCallbacks[key] = new List<Function>();
        downCallbacks[key].add(callback);
        break;
      case Input.KeyUp:
        if (!upCallbacks.containsKey(key)) upCallbacks[key] = new List<Function>();
        upCallbacks[key].add(callback);
        break;
      default:
        throw 'programmer mistake at 100%';
    }
  }
  
  static InputCallback removeCallback(Input key, Input keyType, Function callback) {
    _removeCallback(key, keyType, callback);
    return new InputCallback(key, keyType, callback);
  }
  
  static void _removeCallback(Input key, Input keyType, Function callback) {
    switch (keyType) {
      case Input.KeyDown:
        if (!downCallbacks.containsKey(key)) return;
        downCallbacks[key].remove(callback);
        break;
      case Input.KeyUp:
        if (!upCallbacks.containsKey(key)) return;
        upCallbacks[key].remove(callback);
        break;
      default:
        throw 'programmer mistake at 100%';
    }
  }
}

// just a data wrapper and helper for an unique input callback
class InputCallback {
  final Input key;
  final Input keyType;
  final Function callback;
  
  InputCallback(this.key,this.keyType,this.callback);
  
  void add() => Input._addCallback(key, keyType, callback);
  void remove() => Input._removeCallback(key, keyType, callback);
}