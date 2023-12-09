import 'package:flame/game.dart';
import 'package:flame_game_jam/components/bird.dart';

import '../components/background.dart';
import '../components/ground.dart';

class FlappyBirdGame extends FlameGame {
  late Bird bird;
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
    ]);
  }
}