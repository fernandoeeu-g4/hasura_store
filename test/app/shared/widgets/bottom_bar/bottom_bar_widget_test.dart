import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:mobx_hasura/app/shared/widgets/bottom_bar/bottom_bar_widget.dart';

main() {
  testWidgets('BottomBarWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(BottomBarWidget()));
    final textFinder = find.text('BottomBar');
    expect(textFinder, findsOneWidget);
  });
}
