import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:setap/create_page_dart.dart'; 
import 'package:setap/create.dart'; 
import 'package:flutter/material.dart';
import 'package:hive_test/hive_test.dart';


class EventAdapter extends TypeAdapter<Event> {
  @override
  final int typeId = 0; 

  @override
  Event read(BinaryReader reader) {
    return Event(
      userID: reader.readString(),
      name: reader.readString(),
      date: DateTime.parse(reader.readString()),
      time: TimeOfDay(hour: reader.readInt(), minute: reader.readInt()),
      description: reader.readString(),
      location: reader.readString(),
      ticketPrice: reader.readDouble(),
      totalPrice: reader.readDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, Event obj) {
    writer.writeString(obj.userID);
    writer.writeString(obj.name);
    writer.writeString(obj.date.toString());
    writer.writeInt(obj.time.hour);
    writer.writeInt(obj.time.minute);
    writer.writeString(obj.description);
    writer.writeString(obj.location);
    writer.writeDouble(obj.ticketPrice);
    writer.writeDouble(obj.totalPrice);
  }
}

void main() {
  setUpAll(() async {

    Hive.registerAdapter(EventAdapter());

    await setUpTestHive();
  });

  test('Testing _saveEvent function', () async {
  // Mock event data
  Event event = Event(
    userID: '1',
    name: 'Test Event',
    date: DateTime.now(),
    time: TimeOfDay(hour: 10, minute: 0),
    description: 'This is a test event',
    location: 'Test Location',
    ticketPrice: 10.0,
    totalPrice: 10.0,
  );

  EventFormState eventFormState = EventFormState();

  Box<Event> box = await Hive.openBox<Event>('events');


  eventFormState.saveEvent(event);

  
  if (box.isNotEmpty) {

    Event savedEvent = box.getAt(0)!; 

    

    // Assert that the saved event matches the original event
    expect(savedEvent.userID, event.userID);
    expect(savedEvent.name, event.name);
    expect(savedEvent.date, event.date);
    expect(savedEvent.time, event.time);
    expect(savedEvent.description, event.description);
    expect(savedEvent.location, event.location);
    expect(savedEvent.ticketPrice, event.ticketPrice);
    expect(savedEvent.totalPrice, event.totalPrice);
  }


});


}