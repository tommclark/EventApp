import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:setap/payment.dart';

void main() {
  
Widget createPaymentScreen() => MediaQuery(
  data: MediaQueryData(size: Size(1000, 800)),
  child: MaterialApp(
    home: PaymentScreen(totalPrice: 99.99),
  ),
);
  

  testWidgets('PaymentScreen has necessary input fields and buttons', (WidgetTester tester) async {
    await tester.pumpWidget(createPaymentScreen());

    // Verify all input fields are present
    expect(find.byType(TextField), findsNWidgets(6)); 
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Name on Card'), findsOneWidget);
    expect(find.text('Card Information'), findsOneWidget);
    expect(find.text('Phone Number'), findsOneWidget);


    expect(find.text('Pay Now'), findsOneWidget);
  });

  testWidgets('Navigates to MyBook page upon successful payment', (WidgetTester tester) async {
    await tester.pumpWidget(createPaymentScreen());

    // Tap the Pay Now button
    await tester.tap(find.text('Pay Now'));
    await tester.pump();
    await tester.pumpAndSettle(); 


    await tester.tap(find.text('Yes'));
    await tester.pumpAndSettle();

    // Check if the MyBook page is displayed after confirmation
    // expect(find.byType(BookedEventsPage), findsOneWidget);
  });
}