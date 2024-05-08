import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:setap/hosthome.dart';
import 'package:firebase_core/firebase_core.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  final prefs = MockSharedPreferences();

  setUpAll(() async {
    await Firebase.initializeApp();
  });

  testWidgets('displays the correct username', (WidgetTester tester) async {
    when(prefs.getString('username')).thenReturn('TestUser');

    // Build your app and trigger a frame.
    await tester.pumpWidget(HostHomeScreen());

    // Verify that the username is displayed.
    expect(find.text('Hello, TestUser'), findsOneWidget);
  });
}
