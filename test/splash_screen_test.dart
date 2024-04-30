import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:setap/main.dart';
import 'package:setap/signin_screen.dart';
import 'firebase_mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter binding is initialized
  setupFirebaseAuthMocks();

  testWidgets('SplashScreen navigation test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: SplashScreen()));

    // Find the arrow Icon
    final arrowIcon = find.byIcon(Icons.arrow_forward);

    // Tap on the arrow Icon
    await tester.tap(arrowIcon);

    // Rebuild the widget after the state has changed.
    await tester.pumpAndSettle();

    // Expect to find the LoginScreen
    expect(find.byType(LoginScreen), findsOneWidget);
  });
}