import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_game_jam/components/bird.dart';
import 'package:flame_game_jam/components/pipe_group.dart';

import '../components/background.dart';
import '../components/ground.dart';
import 'configuration.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird()
    ]);

    interval.onTick = () => add(PipeGroup());
  }

  @override
  void onTap() {
    super.onTap();
    bird.fly();
  }


  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
  }

}