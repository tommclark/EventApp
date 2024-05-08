import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:setap/account.dart';

void main() {

  testWidgets('Account screen renders UI elements correctly', (WidgetTester tester) async {

    await tester.pumpWidget(MaterialApp(home: Account()));

    // Verify that the background color is correct
    expect(find.byType(Scaffold), findsOneWidget);
    expect((tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor), equals(Color(0xff331f46)));

    // Verify that the app bar is rendered correctly
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Account'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);

    // Verify that the profile picture and camera icon are displayed
    expect(find.byType(Image), findsOneWidget);
    expect(find.byIcon(Icons.photo_camera), findsOneWidget);

    // Verify that the text field labels are rendered correctly
    expect(find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.labelText == 'Username'), findsOneWidget);
    expect(find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.labelText == 'First Name'), findsOneWidget);
    expect(find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.labelText == 'Surname'), findsOneWidget);
    expect(find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.labelText == 'Email'), findsOneWidget);
    expect(find.byWidgetPredicate((widget) => widget is TextField && widget.decoration?.labelText == 'Phone Number'), findsOneWidget);

    // Verify that the "Save" and "Cancel" buttons are displayed
    expect(find.text('Save'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
  });


  testWidgets('Account screen text fields can be edited', (WidgetTester tester) async {

    await tester.pumpWidget(MaterialApp(home: Account()));

    // Enter text in the text fields
    await tester.enterText(find.byType(TextField).at(0), 'testuser');
    await tester.enterText(find.byType(TextField).at(1), 'Please');
    await tester.enterText(find.byType(TextField).at(2), 'Work');
    await tester.enterText(find.byType(TextField).at(3), 'Pleasework@example.com');
    await tester.enterText(find.byType(TextField).at(4), '1234567890');

    // Verify that the text fields display the entered text
    expect(find.text('testuser'), findsOneWidget);
    expect(find.text('Please'), findsOneWidget);
    expect(find.text('Work'), findsOneWidget);
    expect(find.text('Pleasework@example.com'), findsOneWidget);
    expect(find.text('1234567890'), findsOneWidget);
  });
}
