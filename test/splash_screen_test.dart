import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:setap/main.dart';
import 'package:setap/signin_screen.dart';
import 'firebase_mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setupFirebaseAuthMocks();

  testWidgets('SplashScreen navigation test', (WidgetTester tester) async {
    
    await tester.pumpWidget(MaterialApp(home: SplashScreen()));


    final arrowIcon = find.byIcon(Icons.arrow_forward);


    await tester.tap(arrowIcon);


    await tester.pumpAndSettle();


    expect(find.byType(LoginScreen), findsOneWidget);
  });
}