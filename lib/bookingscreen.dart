import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'create.dart';

class EventBookingPage extends StatefulWidget {
  @override
  _EventBookingPageState createState() => _EventBookingPageState();
}

class _EventBookingPageState extends State<EventBookingPage> {
  late Box<Event> eventBox;

  @override
  void initState() {
    super.initState();
    _openBox();
  }

  Future<void> _openBox() async {
    eventBox = await Hive.openBox<Event>('events');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Booking'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade200, Colors.blue.shade800],
          ),
        ),
        child: FutureBuilder(
          future: _openBox(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return _buildEventList();
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Widget _buildEventList() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: eventBox.length,
      itemBuilder: (context, index) {
        Event event = eventBox.getAt(index)!;
        return EventCard(
          eventName: event.name,
          eventDate: event.date.toString(),
          eventLocation: event.location,
          eventDescription: event.description,
          organizerInfo: event.userID,
          ticketPrice: 0, // Change this according to your data model
          eventDuration: '', // Change this according to your data model
          imageUrl: '', // Change this according to your data model
          attendeeCount: 0, // Change this according to your data model
          onTap: () => showConfirmationDialog(
            event.name,
            event.date.toString(),
            event.location,
            event.description,
            event.userID,
            0, // Change this according to your data model
            '', // Change this according to your data model
            '', // Change this according to your data model
            0, // Change this according to your data model
          ),
        );
      },
    );
  }

  void showConfirmationDialog(
    String event,
    String date,
    String location,
    String description,
    String organizer,
    double price,
    String duration,
    String imageUrl,
    int attendees,
  ) {
    setState(() {
      // You can handle booking logic here if needed
      // For example:
      // selectedEvent = event;
      // Perform booking actions
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Confirmation'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Event: $event'),
              SizedBox(height: 8),
              Text('Date: $date'),
              Text('Location: $location'),
              SizedBox(height: 8),
              Text('Description: $description'),
              Text('Organizer: $organizer'),
              Text('Ticket Price: £${price.toStringAsFixed(2)}'), 
              Text('Duration: $duration'),
              Text('Attendees: $attendees'),
              SizedBox(height: 8),
              Text('Select Number of Tickets:'),
              
              TextFormField(
                keyboardType: TextInputType.number,
                initialValue: '1',
                onChanged: (value) {
                  // Handle quantity change if needed
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); 
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Perform booking action here if needed
                // For example:
                // if (validatePayment()) {
                //   bookEvent(selectedQuantity);
                //   Navigator.pop(context); 
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //       content: Text('Event booked successfully!'),
                //       duration: Duration(seconds: 2),
                //     ),
                //   );
                // } else {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //       content: Text('Invalid payment information. Please try again.'),
                //       duration: Duration(seconds: 2),
                //     ),
                //   );
                // }
              },
              child: Text('Book'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    eventBox.close();
    super.dispose();
  }
}

class EventCard extends StatelessWidget {
  final String eventName;
  final String eventDate;
  final String eventLocation;
  final String eventDescription;
  final String organizerInfo;
  final double ticketPrice;
  final String eventDuration;
  final String imageUrl;
  final int attendeeCount;
  final VoidCallback onTap;

  EventCard({
    required this.eventName,
    required this.eventDate,
    required this.eventLocation,
    required this.eventDescription,
    required this.organizerInfo,
    required this.ticketPrice,
    required this.eventDuration,
    required this.imageUrl,
    required this.attendeeCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.only(bottom: 16.0),
      color: Colors.white.withOpacity(0.9), 
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                eventName,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text('Date: $eventDate'),
              Text('Location: $eventLocation'),
              SizedBox(height: 8.0),
              Text('Description: $eventDescription'),
              Text('Organizer: $organizerInfo'),
              Text('Ticket Price: £${ticketPrice.toStringAsFixed(2)}'), 
              Text('Duration: $eventDuration'),
              Text('Attendees: $attendeeCount'),
            ],
          ),
        ),
      ),
    );
  }
}