import 'package:flutter_test/flutter_test.dart';
import 'package:setap/event_type_model.dart'; // Import the EventTypeModel class
import 'package:setap/data.dart'; // Import the file containing the getEventTypes function

void main() {
  test('Testing getEventTypes function', () {
    // Call the getEventTypes function to get the list of event types
    List<EventTypeModel> eventTypes = getEventTypes();

    // Assert that the length of the list is as expected
    expect(eventTypes.length, 5);

    // Assert each EventTypeModel in the list has the expected properties
    expect(eventTypes[0].imgAssetPath, "assets/concert.png");
    expect(eventTypes[0].eventType, "Concert");

    expect(eventTypes[1].imgAssetPath, "assets/sports.png");
    expect(eventTypes[1].eventType, "Sports");

    expect(eventTypes[2].imgAssetPath, "assets/education.png");
    expect(eventTypes[2].eventType, "Education");

    expect(eventTypes[3].imgAssetPath, "assets/visitors.png");
    expect(eventTypes[3].eventType, "Exibitions"); // Typo here, should it be "Exhibitions"?

    expect(eventTypes[4].imgAssetPath, "assets/seminar.png");
    expect(eventTypes[4].eventType, "Seminar");
  });
}
