import 'package:flutter/material.dart';

class EventBookingPage extends StatefulWidget {
  @override
  _EventBookingPageState createState() => _EventBookingPageState();
}

class _EventBookingPageState extends State<EventBookingPage> {
  String selectedEvent = "";
  int selectedQuantity = 1; 

  
  bool validatePayment() {
    
    return true;
  }

  void bookEvent(int quantity) {
    
    print("Event booked: $selectedEvent, Quantity: $quantity");
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
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            EventCard(
              eventName: 'Music Festival',
              eventDate: 'February 20, 2024',
              eventLocation: 'Outdoor Arena',
              eventDescription: 'A day filled with live music performances from various artists.',
              organizerInfo: 'Music Events Inc.',
              ticketPrice: 25.99, 
              eventDuration: '12:00 PM - 10:00 PM',
              imageUrl: 'https://example.com/music_festival_poster.jpg',
              attendeeCount: 500,
              onTap: () => showConfirmationDialog(
                'Music Festival',
                'February 20, 2024',
                'Outdoor Arena',
                'A day filled with live music performances from various artists.',
                'Music Events Inc.',
                25.99,
                '12:00 PM - 10:00 PM',
                'https://example.com/music_festival_poster.jpg',
                500,
              ),
            ),
            EventCard(
              eventName: 'Tech Conference',
              eventDate: 'February 25, 2024',
              eventLocation: 'Tech Convention Center',
              eventDescription: 'Explore the latest trends and innovations in technology.',
              organizerInfo: 'Tech Innovations LLC',
              ticketPrice: 49.99, 
              eventDuration: '9:00 AM - 6:00 PM',
              imageUrl: 'https://example.com/tech_conference_banner.jpg',
              attendeeCount: 300,
              onTap: () => showConfirmationDialog(
                'Tech Conference',
                'February 25, 2024',
                'Tech Convention Center',
                'Explore the latest trends and innovations in technology.',
                'Tech Innovations LLC',
                49.99,
                '9:00 AM - 6:00 PM',
                'https://example.com/tech_conference_banner.jpg',
                300,
              ),
            ),
            
            EventCard(
              eventName: 'Art Exhibition',
              eventDate: 'March 5, 2024',
              eventLocation: 'City Art Gallery',
              eventDescription: 'Discover stunning artworks from talented local and international artists.',
              organizerInfo: 'Artistic Creations Foundation',
              ticketPrice: 15.99, 
              eventDuration: '10:00 AM - 5:00 PM',
              imageUrl: 'https://example.com/art_exhibition_poster.jpg',
              attendeeCount: 200,
              onTap: () => showConfirmationDialog(
                'Art Exhibition',
                'March 5, 2024',
                'City Art Gallery',
                'Discover stunning artworks from talented local and international artists.',
                'Artistic Creations Foundation',
                15.99,
                '10:00 AM - 5:00 PM',
                'https://example.com/art_exhibition_poster.jpg',
                200,
              ),
            ),
            EventCard(
              eventName: 'Food Festival',
              eventDate: 'March 15, 2024',
              eventLocation: 'Culinary Square',
              eventDescription: 'Indulge in a variety of delicious cuisines from top chefs and food vendors.',
              organizerInfo: 'Gourmet Delights Events',
              ticketPrice: 35.99, 
              eventDuration: '6:00 PM - 11:00 PM',
              imageUrl: 'https://example.com/food_festival_banner.jpg',
              attendeeCount: 400,
              onTap: () => showConfirmationDialog(
                'Food Festival',
                'March 15, 2024',
                'Culinary Square',
                'Indulge in a variety of delicious cuisines from top chefs and food vendors.',
                'Gourmet Delights Events',
                35.99,
                '6:00 PM - 11:00 PM',
                'https://example.com/food_festival_banner.jpg',
                400,
              ),
            ),
            EventCard(
              eventName: 'Fitness Workshop',
              eventDate: 'March 25, 2024',
              eventLocation: 'Wellness Center',
              eventDescription: 'Join expert trainers for a day of fitness routines, wellness tips, and health advice.',
              organizerInfo: 'Healthy Living Co.',
              ticketPrice: 19.99, 
              eventDuration: '8:00 AM - 3:00 PM',
              imageUrl: 'https://example.com/fitness_workshop_poster.jpg',
              attendeeCount: 150,
              onTap: () => showConfirmationDialog(
                'Fitness Workshop',
                'March 25, 2024',
                'Wellness Center',
                'Join expert trainers for a day of fitness routines, wellness tips, and health advice.',
                'Healthy Living Co.',
                19.99,
                '8:00 AM - 3:00 PM',
                'https://example.com/fitness_workshop_poster.jpg',
                150,
              ),
            ),
           
          ],
        ),
      ),
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
      selectedEvent = event;
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
              Text('Event: $selectedEvent'),
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
                  selectedQuantity = int.tryParse(value) ?? 1;
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
                
                if (validatePayment()) {
                  bookEvent(selectedQuantity);
                  Navigator.pop(context); 
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Event booked successfully!'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else {
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Invalid payment information. Please try again.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: Text('Book'),
            ),
          ],
        );
      },
    );
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
