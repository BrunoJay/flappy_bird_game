import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_game_jam/components/pipe.dart';
import 'package:flame_game_jam/game/configuration.dart';
import 'package:flutter/material.dart';

import '../game/flappy_bird_game.dart';
import '../game/pipe_position.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappyBirdGame> {
  PipeGroup();

  final _random = Random();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final spacing = 200 + _random.nextDouble() * (heightMinusGround / 4); //spacing in between the pipes
    final centerY = spacing + _random.nextDouble() * (heightMinusGround - spacing);
    await addAll([
      Pipe(
        pipePosition: PipePosition.top,
        height: centerY - spacing/2,
      ),
      Pipe(
        pipePosition: PipePosition.bottom,
        height: heightMinusGround - (centerY + spacing / 2),
      ),
    ]);
  }


  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;

    if (position.x < -10) {
      removeFromParent();
      updateScore();
    }

    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
  }

  void updateScore() {
    gameRef.bird.score += 1;
  }
}