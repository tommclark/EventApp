// // ignore_for_file: invalid_use_of_protected_member

// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_test/hive_test.dart';
// import 'package:setap/searchpage.dart'; // Import the file where loadEvents method is defined
// import 'package:setap/create.dart'; // Import the Event class
// import 'package:flutter/material.dart';

// // Mock class for Hive
// class MockBox extends Mock implements Box<Event> {}

// void main() {

//     setUpAll(() async {
//     // Initialize Hive with a temporary directory for testing.
//     await initializeHiveForTest();
//   });
//   group('loadEvents', () {
//     test('loads events from Hive and updates state', () async {
//       // Mocking Hive.openBox<Event>('events')
//       final mockBox = MockBox();
//       when(Hive.openBox<Event>('events')).thenAnswer((_) => Future.value(mockBox));

//       // Mock events data
//       final eventsData = [
//         Event(userID: 1.toString(),
//       name: 'hello',
//       date: DateTime.parse('2024-01-01'),
//       time: TimeOfDay(hour: 10, minute: 0),
//       description: 'test',
//       location: 'portsmouth',
//       ticketPrice: 10.0,
//       totalPrice: 10.0,),
//         Event(userID: 1.toString(),
//       name: 'hello',
//       date: DateTime.parse('2024-01-01'),
//       time: TimeOfDay(hour: 10, minute: 0),
//       description: 'test',
//       location: 'portsmouth',
//       ticketPrice: 10.0,
//       totalPrice: 10.0,),
//         Event(userID: 1.toString(),
//       name: 'hello',
//       date: DateTime.parse('2024-01-01'),
//       time: TimeOfDay(hour: 10, minute: 0),
//       description: 'test',
//       location: 'portsmouth',
//       ticketPrice: 10.0,
//       totalPrice: 10.0,),
//       ];

//       // Stubbing box.values.toList() to return eventsData
//       when(mockBox.values).thenReturn(eventsData);

//       // Create instance of class where loadEvents method is defined
//       final SearchState search = SearchState();

//       // Call the method
//       await search.loadEvents();

//       // Verify that setState was called with the correct values
//       // verify(search.setState(captureAny)).captured.single;

//       // Check the captured argument of setState to ensure it updates state correctly
//       // final capturedArgument = verify(search.setState(captureAny)).captured.single;
//       expect(search.events, equals(eventsData));
//       expect(search.filteredEvents, isEmpty); // Assuming filteredEvents is cleared
//       expect(search.isSearching, isFalse); // Assuming isSearching is set to false
//     });
//   });
// }
