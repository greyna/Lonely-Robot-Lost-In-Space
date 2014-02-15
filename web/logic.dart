part of actionman;

/// This method is executed at the beginning of the game (before game looping)
void init() {
  level = new Level(canvas.width, canvas.height, Assets.imgs['game_assets/img/star-background.jpg']);
  players.add(new Player(0,0, Assets.imgs['game_assets/img/zelda.png']));
}

/// This method is executed at each period, whatever happens.
void update() {
  players[0].update();
  keyboard.reset();
}