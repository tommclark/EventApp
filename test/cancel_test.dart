import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:setap/myBook.dart';
import 'package:setap/create.dart';

void main() {
  testWidgets('Testing cancellation of events within two days', (WidgetTester tester) async {
    // Create a list of events to simulate booking
    List<Event> events = [
      Event(
        userID: '1',
        name: 'Test Event',
        date: DateTime.now().add(Duration(days: 1)), // Event date is one day from now
        time: TimeOfDay(hour: 10, minute: 0),
        description: 'Test Description',
        location: 'Test Location',
        ticketPrice: 10.0,
        totalPrice: 10.0,
      ),
    ];

    // Create a new instance of the BookedEventsPage widget
    final bookedEventsPage = MaterialApp(
      home: BookedEventsPage(),
    );

    // Pump the widget and wait for it to settle
    await tester.pumpWidget(bookedEventsPage);
    await tester.pumpAndSettle();

    // Simulate tapping on the delete button to cancel the event
    // Ensure that the cancellation dialog appears
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pumpAndSettle();

    // Verify that the cancellation dialog with the appropriate message appears
    expect(find.text('Cannot Cancel Event'), findsOneWidget);
    expect(find.text('You cannot cancel this event because it is within two days from the present date.'), findsOneWidget);
  });
}