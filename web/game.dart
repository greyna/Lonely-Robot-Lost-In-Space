part of actionman;

class Game {
  bool looping = false;
  Level level;
  
  void init() {
    Assets.init();
    Input.init();
    
    level = new Level(canvas.width, canvas.height, Assets.imgs['assets/img/background.jpg']);
    
    players.add(new Player(0,0, Assets.imgs['assets/img/zelda.png']));
  }
  void start() {
    if (!looping) {
      looping = true;
      window.animationFrame.then(_gameLoop);
    }
  }
  void stop() {
    looping = false;
  }

  void _gameLoop(num delta) {
    if (!looping) return;
    players[0].logic();
    draw();
    window.animationFrame.then(_gameLoop);
  }
}