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
 * assets.dart v0.1.2
 * 
 * Code hosted at github.com/greyna/actionman.dart. Made by greyna. Under GPL licence.
 */
part of actionman;

class Assets {
  static Map<String, ImageElement> imgs = new Map<String, ImageElement>();

  static void init() {
    loadImg('assets/img/zelda.png');
    loadImg('assets/img/background.jpg');
  }
  
  static void loadImg(String path) {
    ImageElement image = new Element.tag('img');
    image.src = path;
    imgs[path] = image;
  }
}