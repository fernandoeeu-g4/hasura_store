import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:mobx_hasura/app/modules/landing/landing_controller.dart';
import 'package:mobx_hasura/app/modules/landing/landing_module.dart';

void main() {
  initModule(LandingModule());
  LandingController landing;

  setUp(() {
    landing = LandingModule.to.get<LandingController>();
  });

  group('LandingController Test', () {
    test("First Test", () {
      expect(landing, isInstanceOf<LandingController>());
    });

    test("Set Value", () {
      expect(landing.value, equals(0));
      landing.increment();
      expect(landing.value, equals(1));
    });
  });
}
