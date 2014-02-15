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
library lrlis;

import 'dart:html';
import 'dart:async';
import 'dart:collection';

part 'assets.dart';
part 'graphics.dart';
part 'game.dart';
part 'player.dart';
part 'util.dart';
part 'input.dart';
part 'global.dart';
part 'level.dart';
part 'logic.dart';

void main() {
  game.start();
  print('actionman game started !');
}