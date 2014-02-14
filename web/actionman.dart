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
 * actionman.dart v0.2.0
 * 
 * Code hosted at github.com/greyna/actionman.dart. Made by greyna. Under GPL licence.
 */
library actionman;

import 'dart:html';
import 'dart:async';

part 'assets.dart';
part 'graphics.dart';
part 'game.dart';
part 'player.dart';
part 'util.dart';
part 'input.dart';
part 'global.dart';
part 'level.dart';

void main() {
  game
    ..init()
    ..start();
  print('actionman game started !');
}