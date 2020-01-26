import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:mobx_hasura/app/modules/landing/widgets/app_indexed_stack/app_indexed_stack_widget.dart';

main() {
  testWidgets('AppIndexedStackWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(AppIndexedStackWidget()));
    final textFinder = find.text('AppIndexedStack');
    expect(textFinder, findsOneWidget);
  });
}
