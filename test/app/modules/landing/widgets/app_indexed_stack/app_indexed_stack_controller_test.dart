import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:mobx_hasura/app/modules/landing/widgets/app_indexed_stack/app_indexed_stack_controller.dart';
import 'package:mobx_hasura/app/modules/landing/landing_module.dart';

void main() {
  initModule(LandingModule());
  AppIndexedStackController appindexedstack;

  setUp(() {
    appindexedstack = LandingModule.to.get<AppIndexedStackController>();
  });

  group('AppIndexedStackController Test', () {
    test("First Test", () {
      expect(appindexedstack, isInstanceOf<AppIndexedStackController>());
    });

    test("Set Value", () {
      expect(appindexedstack.value, equals(0));
      appindexedstack.increment();
      expect(appindexedstack.value, equals(1));
    });
  });
}
