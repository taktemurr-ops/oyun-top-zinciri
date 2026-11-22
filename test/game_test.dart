import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_top_zinciri/oyun_top_zinciri.dart';

import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(zincirConfig.title.length, 33);
    expect(zincirConfig.tagline.length, 33);
    for (final s in zincirConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', () {
    final planner = LevelPlanner(gameId: zincirId, optionalMechanics: zincirRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(zincirRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
