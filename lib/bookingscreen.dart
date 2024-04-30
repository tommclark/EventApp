import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'create.dart';
import 'payment.dart';

class EventBookingPage extends StatefulWidget {
  @override
  EventBookingPageState createState() => EventBookingPageState();
}

class EventBookingPageState extends State<EventBookingPage> {
  late Box<Event> eventBox;
  late TextEditingController _ticketQuantityController;
  double totalPrice = 0;

  @override
  void initState() {
    super.initState();
    _openBox();
    _ticketQuantityController = TextEditingController(text: '1');
  }

  Future<void> _openBox() async {
    eventBox = await Hive.openBox<Event>('events');
  }

  void updateTotalPrice(String value, double price) {
    
      totalPrice = price * int.parse(value);
    
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
          ticketPrice: event.ticketPrice,
          totalPrice: totalPrice,
          onTap: () => showConfirmationDialog(
            context,
            event.name,
            event.date.toString(),
            event.location,
            event.description,
            event.userID,
            event.ticketPrice,
          ),
          onChanged: (value) {
            setState(() {
              updateTotalPrice(value, event.ticketPrice);
            });

          },
        );
      },
    );
  }

  void showConfirmationDialog(
      BuildContext context,
      String event,
      String date,
      String location,
      String description,
      String organizer,
      double price,
      ) async {
    // Calculate the total price based on the current value of the ticket quantity field
    updateTotalPrice(_ticketQuantityController.text, price);

    // Flag to track if the quantity is valid
    bool isValidQuantity = _ticketQuantityController.text.isNotEmpty;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
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
                  Text('Ticket Price: £${price.toStringAsFixed(3)}'),
                  Text('Total Price: £${totalPrice.toStringAsFixed(3)}'),
                  SizedBox(height: 8),
                  Text('Select Number of Tickets:'),
                  TextFormField(
                    controller: _ticketQuantityController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        if (value.isEmpty) {
                          isValidQuantity = false;
                        } else {
                          isValidQuantity = true;
                        }
                        // Update the total price when quantity changes
                        updateTotalPrice(value, price);
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: isValidQuantity
                      ? () {
                    Navigator.pop(context);
                  }
                      : null,
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: isValidQuantity
                      ? () async {
                    // Open the booked events box
                    Box<Event> bookedEventsBox =
                    await Hive.openBox<Event>('booked_events');

                    // Add the booked event to the list with total price
                    Event bookedEvent = Event(
                      name: event,
                      date: DateTime.parse(date),
                      time: TimeOfDay.now(),
                      location: location,
                      description: description,
                      userID: organizer,
                      ticketPrice: price,
                      totalPrice: totalPrice, // Store the total price
                    );
                    bookedEventsBox.add(bookedEvent);

                    // Close the dialog
                    Navigator.pop(context);

                    // Show a confirmation message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Event booked successfully!'),
                        duration: Duration(seconds: 2),
                      ),
                    );

                    // Navigate to the payment screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PaymentScreen(totalPrice: totalPrice),
                      ),
                    );
                  }
                      : null,
                  child: Text('Book'),
                ),
              ],
            );
          },
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
  final double totalPrice;
  final VoidCallback onTap;
  final ValueChanged<String>? onChanged;

  EventCard({
    required this.eventName,
    required this.eventDate,
    required this.eventLocation,
    required this.eventDescription,
    required this.organizerInfo,
    required this.ticketPrice,
    required this.totalPrice,
    required this.onTap,
    this.onChanged,
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
              Text('Ticket Price: £${ticketPrice.toStringAsFixed(3)}'),
              Text('Total Price: £${totalPrice.toStringAsFixed(3)}'),
              SizedBox(height: 8.0),

            ],
          ),
        ),
      ),
    );
  }
}