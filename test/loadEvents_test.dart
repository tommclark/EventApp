

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';
import 'package:setap/searchpage.dart'; 
import 'package:setap/create.dart'; 


class MockBox extends Mock implements Box<Event> {}

void main() {

    setUp(() async {
    
    await setUpTestHive();
  });
  group('loadEvents', () {
    test('loads events from Hive and updates state', () async {



      // Empty event data upon initialisation
      final eventsData = [];  

      final SearchState search = SearchState();
      
      search.events = eventsData.cast<Event>();

      await search.loadEvents();
      

      expect(search.events, equals([]));
    });
  });

  tearDown(() async {
    await tearDownTestHive();
  });
}
