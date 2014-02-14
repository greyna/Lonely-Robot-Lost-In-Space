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