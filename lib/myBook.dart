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
        title: Text(
          'Your Events',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: _bookedEvents.isEmpty
          ? Center(
        child: Text(
          'No events booked yet.',
          style: TextStyle(color: Colors.white),
        ),
      )
          : ListView.builder(
        itemCount: _bookedEvents.length,
        itemBuilder: (context, index) {
          final event = _bookedEvents[index];
          return ListTile(
            tileColor: Color(0xffc58fff),
            title: Text(
              event.name,
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Date: ${event.date.toString()}',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Location: ${event.location}',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Description: ${event.description}',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Organizer: ${event.userID}',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Ticket Price: £${event.ticketPrice.toStringAsFixed(3)}',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Total Price: £${event.totalPrice.toStringAsFixed(3)}',
                  style: TextStyle(color: Colors.white),
                ), // Display total price
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _showDeleteConfirmationDialog(context, event);
              },
            ),
            onTap: () {
              // Handle tapping on a booked event if needed
            },
          );
        },
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, Event event) {
    // Check if the event date is within two days from the present date
    DateTime twoDaysFromNow = DateTime.now().add(Duration(days: 2));
    if (event.date.isBefore(twoDaysFromNow)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Cannot Cancel Event'),
            content: Text('You cannot cancel this event because it is within two days from the present date.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirm Deletion'),
            content: Text('Are you sure you want to cancel this event?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  _cancelEvent(event); // Call _cancelEvent after popping the dialog
                },
                child: Text('Yes'),
              ),
            ],
          );
        },
      );
    }
  }

  void _cancelEvent(Event event) async {

    _bookedEventsBox.delete(event.key);
    setState(() {
      _bookedEvents.remove(event);
    });

    // Calculate the refund amount
    double refundAmount = event.totalPrice * 0.98; // 98% refund

    // Show a confirmation message with refund and service fee deduction
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Event Cancelled'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your payment will be refunded to your account.'),
              Text('Refund Amount: £${refundAmount.toStringAsFixed(2)}'),
              Text('2% of the ticket amount will be deducted as a service fee.'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );

    // Show a confirmation message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Event cancelled successfully!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    _bookedEventsBox.close();
    super.dispose();
  }
}
