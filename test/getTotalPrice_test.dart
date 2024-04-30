import 'package:flutter_test/flutter_test.dart';
import 'package:setap/bookingscreen.dart'; // Import the file containing the method

void main() {
  test('Testing updateTotalPrice method', () {
    // Create an instance of the class containing the method
    EventBookingPageState pageState = EventBookingPageState();

    // Set initial total price
    pageState.totalPrice = 0;

    // Call the method with test inputs
    pageState.updateTotalPrice('2', 10.0);

    // Assert that the totalPrice is updated correctly
    expect(pageState.totalPrice, 20.0);
  });
}
