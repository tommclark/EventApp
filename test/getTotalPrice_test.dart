import 'package:flutter_test/flutter_test.dart';
import 'package:setap/bookingscreen.dart'; 

void main() {
  test('Testing updateTotalPrice method', () {

    EventBookingPageState pageState = EventBookingPageState();

    // Set initial total price
    pageState.totalPrice = 0;


    pageState.updateTotalPrice('2', 10.0);

    // Test that the totalPrice is updated correctly
    expect(pageState.totalPrice, 20.0);
  });
}
