import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:mobx_hasura/app/shared/widgets/bottom_bar/bottom_bar_controller.dart';
import 'package:mobx_hasura/app/app_module.dart';

void main() {
  initModule(AppModule());
  BottomBarController bottombar;

  setUp(() {
    bottombar = AppModule.to.get<BottomBarController>();
  });

  group('BottomBarController Test', () {
    test("First Test", () {
      expect(bottombar, isInstanceOf<BottomBarController>());
    });

    test("Set Value", () {
      expect(bottombar.value, equals(0));
      bottombar.increment();
      expect(bottombar.value, equals(1));
    });
  });
}
