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
      backgroundColor: Color(0xff331f46),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffc58fff),
        title: Text('Your Events',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16),
        ),
      ),
      body: _bookedEvents.isEmpty
          ? Center(child: Text('No events booked yet.',
          style: TextStyle(
            color: Colors.white)
            )
          )
          : ListView.builder(
        itemCount: _bookedEvents.length,
        itemBuilder: (context, index) {
          final event = _bookedEvents[index];
          return ListTile(
            tileColor: Color(0xffc58fff),
            title: Text(
              event.name,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date: ${event.date.toString()}',
                style: TextStyle(
                  color: Colors.white,
                )),
                Text('Location: ${event.location}', style: TextStyle(color: Colors.white)),
                Text('Description: ${event.description}', style: TextStyle(color: Colors.white)),
                Text('Organizer: ${event.userID}', style: TextStyle(color: Colors.white)),
                Text('Ticket Price: £${event.ticketPrice.toStringAsFixed(3)}', style: TextStyle(color: Colors.white)),
                Text('Total Price: £${event.totalPrice.toStringAsFixed(3)}', style: TextStyle(color: Colors.white)), // Display total price
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