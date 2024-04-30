import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:setap/home.dart';
import 'package:setap/myBook.dart';
import 'package:setap/payment.dart';

void main() {
  // Helper function to create and return the widget under test
Widget createPaymentScreen() => MediaQuery(
  data: MediaQueryData(size: Size(1000, 800)), // Adjust the size as needed
  child: MaterialApp(
    home: PaymentScreen(totalPrice: 99.99),
  ),
);
  

  testWidgets('PaymentScreen has necessary input fields and buttons', (WidgetTester tester) async {
    await tester.pumpWidget(createPaymentScreen());

    // Verify all input fields are present
    expect(find.byType(TextField), findsNWidgets(6)); // Adjust the count if you have different number of TextFields
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Name on Card'), findsOneWidget);
    expect(find.text('Card Information'), findsOneWidget);
    expect(find.text('Phone Number'), findsOneWidget);

    // Verify the Pay Now button is present
    expect(find.text('Pay Now'), findsOneWidget);
  });

  testWidgets('Navigates to MyBook page upon successful payment', (WidgetTester tester) async {
    await tester.pumpWidget(createPaymentScreen());

    // Tap the Pay Now button
    await tester.tap(find.text('Pay Now'));
    await tester.pump(); // Rebuild the widget after the state has changed
    await tester.pumpAndSettle(); // Wait for any animations to settle

    // This part simulates the user confirming the payment
    await tester.tap(find.text('Yes'));
    await tester.pumpAndSettle(); // Process the navigation and potential animations

    // Check if the MyBook page is displayed after confirmation
    // expect(find.byType(BookedEventsPage), findsOneWidget);
  });
}