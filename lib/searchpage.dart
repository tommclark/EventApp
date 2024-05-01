import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'create.dart'; // Assuming you have the Event class defined here

class Search extends StatefulWidget {
  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  late List<Event> events;
  late List<Event> filteredEvents;
  late bool isSearching;

  @override
  void initState() {
    super.initState();
    isSearching = true;
    setState(() {
      loadEvents();
    });
  }

  Future<void> loadEvents() async {
    var box = await Hive.openBox<Event>('events');

    events = box.values.toList();
    filteredEvents = [];
    isSearching = false;
  }

  Future<void> addEvent(Event event) async {
    final box = await Hive.openBox<Event>('events');
    await box.add(event);
    await box.close();
  }

  void filterEvents(String query) {
    if (query.isEmpty) {
      filteredEvents = [];
    } else {
      filteredEvents = events
          .where((event) =>
              event.name.toLowerCase().contains(query.toLowerCase()) ||
              event.location.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff331f46),
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffc58fff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          
        ),
        title: Text(
          "Search Events",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: 16,
            color: Color(0xffffffff),
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
              style: TextStyle(
                  color: Colors.white),
              onChanged: (query) {
                setState(() {
                  filterEvents(query);
                });
              },
              decoration: InputDecoration(
                hintText:
                    'Search events by entering either their name or location...',
                    hintStyle: TextStyle(
                      color: Colors.white
                      )
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
                        ticketPrice: filteredEvents[index]
                            .ticketPrice, // Change this according to your data model
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
      color: Color(0xffc58fff),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                eventName,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 8.0),
              Text('Date: $eventDate', style: TextStyle(color: Colors.white)),
              Text('Location: $eventLocation', style: TextStyle(color: Colors.white)),
              SizedBox(height: 8.0),
              Text('Description: $eventDescription', style: TextStyle(color: Colors.white)),
              Text('Organizer: $organizerInfo', style: TextStyle(color: Colors.white)),
              Text('Ticket Price: Â£${ticketPrice.toStringAsFixed(2)}', style: TextStyle(color: Colors.white)),
              Text('Duration: $eventDuration', style: TextStyle(color: Colors.white)),
              Text('Attendees: $attendeeCount', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
