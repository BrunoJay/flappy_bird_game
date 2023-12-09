import 'package:flame_game_jam/game/flappy_bird_game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../game/assets.dart';

class GameOverScreen extends StatelessWidget {
  final FlappyBirdGame game;
  static const String id = 'gameover';

  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Score: ${game.bird.score}',
              style: const TextStyle(
                fontSize: 60,
                color: Colors.white,
                fontFamily: 'Game'
              )
            ),
            Image.asset(Assets.gameOver),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onRestart,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0), // Set corner radius to 2
                ),
              ),
              child: const Text(
                'Restart',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white, // Set text color to white
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onRestart() {
    game.bird.reset();
    game.overlays.remove('gameover');
    game.resumeEngine();
  }
}