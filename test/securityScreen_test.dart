import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:setap/security.dart';

void main() {
  testWidgets('Security Page Widget Test', (WidgetTester tester) async {
  
    await tester.pumpWidget(MaterialApp(
      home: Security(),
    ));


    expect(find.text('Privacy & Security'), findsOneWidget);


    expect(find.byIcon(Icons.arrow_back), findsOneWidget);

  
    expect(find.text('Permissions'), findsOneWidget);
    expect(find.text('Location services'), findsOneWidget);
    expect(find.text('Notification Settings'), findsOneWidget);
    expect(find.text('Push Notification'), findsOneWidget);
    expect(find.text('Receive weekly push notification'), findsOneWidget);

  });
}
