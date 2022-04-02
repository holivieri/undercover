import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:undercover_mobile/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  //Run: flutter test integration_test

  testWidgets('Login correct should allow access to app',
      (WidgetTester tester) async {
    //setup
    await app.main();
    await tester.pumpAndSettle();
    final Finder loginButton = find.byKey(const Key('loginButton'));

    //do
    await tester.tap(loginButton);
    //test
    expect(find.text('Must enter email/passowrd'), findsOneWidget);
  });
}
