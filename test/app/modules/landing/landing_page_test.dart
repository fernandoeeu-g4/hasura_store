import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular_test.dart';

import 'package:mobx_hasura/app/modules/landing/landing_page.dart';

main() {
  testWidgets('LandingPage has title', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(LandingPage(title: 'Landing')));
    final titleFinder = find.text('Landing');
    expect(titleFinder, findsOneWidget);
  });
}
