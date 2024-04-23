import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'create.dart'; // Assuming you have the Event class defined here

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late List<Event> events;
  late List<Event> filteredEvents;
  late bool isSearching;

  @override
  void initState() {
    super.initState();
    isSearching = true;
    loadEvents();
  }

  Future<void> loadEvents() async {
    var box = await Hive.openBox<Event>('events');
    setState(() {
      events = box.values.toList();
      filteredEvents = [];
      isSearching = false;
    });
  }

  void filterEvents(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredEvents =
            []; // define filtered events as an empty list so that the search page is empty when there is no query
      } else {
        filteredEvents = events
            .where((event) =>
                event.name.toLowerCase().contains(query.toLowerCase()) ||
                event.location.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 4,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff3a57e8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "AppBar",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 14,
            color: Color(0xff000000),
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Color(0xff212435),
            size: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: TextField(
              onChanged: (query) => filterEvents(query),
              decoration: InputDecoration(
                hintText:
                    'Search events by entering either their name or location...',
              ),
            ),
          ),
          isSearching
              ? CircularProgressIndicator() // Show loading indicator while searching
              : Expanded(
                  child: ListView.builder(
                    itemCount: filteredEvents.length,
                    itemBuilder: (context, index) {
                      return EventCard(
                        eventName: filteredEvents[index].name,
                        eventDate: filteredEvents[index].date.toString(),
                        eventLocation: filteredEvents[index].location,
                        eventDescription: filteredEvents[index].description,
                        organizerInfo: filteredEvents[index].userID,
                        ticketPrice:
                            0, // Change this according to your data model
                        eventDuration:
                            '', // Change this according to your data model
                        imageUrl:
                            '', // Change this according to your data model
                        attendeeCount:
                            0, // Change this according to your data model
                        onTap: () {},
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }

  // Your showConfirmationDialog method here
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
