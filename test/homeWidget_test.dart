import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:setap/home.dart';

void main() {
  testWidgets('HomeScreen has a title and several widgets', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    // Verify that HomeScreen has a title
    expect(find.text('Hello, User'), findsOneWidget);
    expect(find.text('Let\'s explore what’s happening nearby'), findsOneWidget);

    // Verify that HomeScreen has several widgets
    expect(find.byType(Image), findsWidgets);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(Container), findsWidgets);
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(Row), findsWidgets);
  });
}