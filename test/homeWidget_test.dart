import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:setap/attendeehome.dart';

void main() {
  testWidgets('HomeScreen has a title and several widgets', (WidgetTester tester) async {

    // await tester.pumpWidget(MaterialApp(home: HomeScreenState()));


    expect(find.text('Hello, User'), findsOneWidget);
    expect(find.text('Let\'s explore what’s happening nearby'), findsOneWidget);

    
    expect(find.byType(Image), findsWidgets);
    expect(find.byType(Text), findsWidgets);
    expect(find.byType(Container), findsWidgets);
    expect(find.byType(Column), findsWidgets);
    expect(find.byType(Row), findsWidgets);
  });
}