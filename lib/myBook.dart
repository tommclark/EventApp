import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'create.dart';

class BookedEventsPage extends StatefulWidget {
  @override
  _BookedEventsPageState createState() => _BookedEventsPageState();
}

class _BookedEventsPageState extends State<BookedEventsPage> {
  late Box<Event> _bookedEventsBox;
  List<Event> _bookedEvents = [];

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    _bookedEventsBox = await Hive.openBox<Event>('booked_events');
    _bookedEvents = _bookedEventsBox.values.toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Events'),
      ),
      body: _bookedEvents.isEmpty
          ? Center(child: Text('No events booked yet.'))
          : ListView.builder(
        itemCount: _bookedEvents.length,
        itemBuilder: (context, index) {
          final event = _bookedEvents[index];
          return ListTile(
            title: Text(event.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date: ${event.date.toString()}'),
                Text('Location: ${event.location}'),
                Text('Description: ${event.description}'),
                Text('Organizer: ${event.userID}'),
                Text('Ticket Price: £${event.ticketPrice.toStringAsFixed(3)}'),
                Text('Total Price: £${event.totalPrice.toStringAsFixed(3)}'), // Display total price
              ],
            ),

            onTap: () {
              // Handle tapping on a booked event if needed
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _bookedEventsBox.close();
    super.dispose();
  }
}
