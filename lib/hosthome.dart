import 'package:firebase_auth/firebase_auth.dart';
import 'package:setap/usermode.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'bookingscreen.dart';
import 'data.dart';
import 'profile.dart';
import 'create_page_dart.dart';
import 'searchpage.dart';
import 'event_type_model.dart';
import 'create.dart';
import 'signin_screen.dart';

class HostHomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HostHomeScreen> {
  List<EventTypeModel> eventsType = [];
  List<DateTime> _dateList =
      List<DateTime>.generate(30, (i) => DateTime.now().add(Duration(days: i)));
  String username = 'User';
  DateTime _selectedDate = DateTime.now();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late Box<Event> eventBox;

  String todayDateIs = "12";

  @override
  void initState() {
    super.initState();
    loadUsername();
    eventsType = getEventTypes();
    _openBox();
  }

  void loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? 'User';
    });
  }

  Future<void> _openBox() async {
    eventBox = await Hive.openBox<Event>('events');
  }

  @override
  void dispose() {
    eventBox.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        backgroundColor: Color(0xffc58fff),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  'MENU',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "assets/drawer_header_background.png"), // replace with your image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              title: Text('Switch User Mode',
               style: TextStyle(
                color: Colors.white,
              ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserMode(),
                    ));
              },
            ),
            ListTile(
              title: Text('Create Events',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EventForm()));
              },
            ),
            ListTile(
              title: Text('Search Events',
               style: TextStyle(
                color: Colors.white,
              ),
              ),
              onTap: () {
                // Close the box when navigating to the search page
                eventBox.close();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Search(),
                    ));
              },
            ),
            ListTile(
              title: Text('Logout',
               style: TextStyle(
                color: Colors.white,
              ),
              ),
              onTap: () async {
                await _auth.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Builder(
        builder: (context) => Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xff331f46),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset("assets/logo.png", height: 28),
                        SizedBox(width: 8),
                        Row(
                          children: <Widget>[
                            Text("Event",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                )),
                            Text(" APP",
                                style: TextStyle(
                                  color: Color(0xffc58fff),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                )),
                          ],
                        ),
                        Spacer(),
                        Image.asset("assets/notify.png", height: 22),
                        SizedBox(width: 16),
                        InkWell(
                          onTap: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                          child: Image.asset("assets/menu.png", height: 22),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Hello, $username",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 21),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Let's explore what’s happening nearby",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Profile()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 3, color: Color(0xffff00f1)),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                "assets/profilepic.jpg",
                                height: 40,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    /// Dates
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _dateList.length,
                        itemBuilder: (context, index) {
                          DateTime date = _dateList[index];
                          bool isSelected = _selectedDate.year == date.year &&
                              _selectedDate.month == date.month &&
                              _selectedDate.day == date.day;

                          // Get the day of the week as a string
                          String dayOfWeek;
                          switch (date.weekday) {
                            case 1:
                              dayOfWeek = 'Monday';
                              break;
                            case 2:
                              dayOfWeek = 'Tuesday';
                              break;
                            case 3:
                              dayOfWeek = 'Wednesday';
                              break;
                            case 4:
                              dayOfWeek = 'Thursday';
                              break;
                            case 5:
                              dayOfWeek = 'Friday';
                              break;
                            case 6:
                              dayOfWeek = 'Saturday';
                              break;
                            case 7:
                              dayOfWeek = 'Sunday';
                              break;
                            default:
                              dayOfWeek = '';
                          }

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedDate = date;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Color(0xffc58fff)
                                    : Color(0xff0e091e),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    '${date.day}/${date.month}/${date.year}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    dayOfWeek,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      ),
                    ),
                    
                    SizedBox(height: 16),
                    Text("All Events",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                    SizedBox(height: 16),
                    Container(
                      height: 100,
                      child: ListView.builder(
                          itemCount: eventsType.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return EventTile(
                              imgAssetPath: eventsType[index].imgAssetPath,
                              eventType: eventsType[index].eventType,
                            );
                          }),
                    ),
                    SizedBox(height: 16),
                    Text("Popular Events",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                    Container(
                      child: FutureBuilder<void>(
                        future: _openBox(),
                        builder: (BuildContext context,
                            AsyncSnapshot<void> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return ListView.builder(
                              itemCount: eventBox.length > 3 ? 3 : eventBox.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                Event event = eventBox.getAt(index)!;
                                return EventCard(
                                  eventName: event.name,
                                  eventDate: event.date.toString(),
                                  eventLocation: event.location,
                                  eventDescription: event.description,
                                  organizerInfo: event.userID,
                                  ticketPrice: event.ticketPrice,
                                  imageUrl: '',
                                  onTap: () {},
                                );
                              },
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DateTile extends StatefulWidget {
  String weekDay;
  String date;
  bool isSelected;
  DateTile(
      {required this.weekDay, required this.date, required this.isSelected});

  @override
  State<DateTile> createState() => _DateTileState();
}

class _DateTileState extends State<DateTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: widget.isSelected ? Color(0xffc58fff) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(widget.date,
              style: TextStyle(
                color: widget.isSelected ? Colors.black : Colors.white,
                fontWeight: FontWeight.w600,
              )),
          SizedBox(height: 10),
          Text(widget.weekDay,
              style: TextStyle(
                color: widget.isSelected ? Colors.black : Colors.white,
                fontWeight: FontWeight.w600,
              )),
        ],
      ),
    );
  }
}

class EventTile extends StatefulWidget {
  String imgAssetPath;
  String eventType;
  EventTile({required this.imgAssetPath, required this.eventType});

  @override
  State<EventTile> createState() => _EventTileState();
}

class _EventTileState extends State<EventTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Color(0xffc58fff),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(widget.imgAssetPath, height: 27),
          SizedBox(height: 12),
          Text(widget.eventType,
              style: TextStyle(
                color: Colors.white,
              )),
        ],
      ),
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
  final String imageUrl;
  final VoidCallback onTap;

  EventCard({
    required this.eventName,
    required this.eventDate,
    required this.eventLocation,
    required this.eventDescription,
    required this.organizerInfo,
    required this.ticketPrice,
    required this.imageUrl,
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
              Text('Ticket Price: £${ticketPrice.toStringAsFixed(2)}', style: TextStyle(color: Colors.white)),
              
            ],
          ),
        ),
      ),
    );
  }
}
