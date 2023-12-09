import 'package:flame/game.dart';
import 'package:flame_game_jam/screens/main_menu_screen.dart';
import 'package:flutter/material.dart';

import 'game/flappy_bird_game.dart';

void main() {
  final game = FlappyBirdGame();
  runApp(GameWidget(
    game: game,
    initialActiveOverlays: const [MainMenuScreen.id],
    overlayBuilderMap: {
      'mainmenu': (context, _) => MainMenuScreen(game: game),
    },
  ));
}
