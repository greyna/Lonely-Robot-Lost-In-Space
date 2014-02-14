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