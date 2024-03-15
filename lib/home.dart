import 'package:flutter/material.dart';
import 'bookingscreen.dart';
import 'data.dart';
import 'profile.dart';
import 'create_page_dart.dart';
import 'searchpage.dart';
import 'date_model.dart';
import 'event_type_model.dart';
import 'events_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<DateModel> dates = [];
  List<EventTypeModel> eventsType = [];
  List<EventsModel> events = [];

  String todayDateIs = "12";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dates = getDates();
    eventsType = getEventTypes();
    events = getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('MENU', style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),),
              decoration: BoxDecoration(
                  color: Color(0xffc58fff),
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Profile()));
              },
            ),
            ListTile(
              title: Text('Create Events'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => EventForm()));
              },
            ),
            ListTile(
              title: Text('Search Events'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Search()));
              },
            ),
            ListTile(
              title: Text('Book Events'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => EventBookingPage()));
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
                  color: Color(0xff331f46)
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 60,horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset("assets/logo.png",height: 28,),
                        SizedBox(width: 8,),
                        Row(
                          children: <Widget>[
                            Text("Event", style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w800
                            ),),
                            Text(" APP", style: TextStyle(
                                color: Color(0xffc58fff),
                                fontSize: 22,
                                fontWeight: FontWeight.w800
                            ),)
                          ],
                        ),
                        Spacer(),
                        Image.asset("assets/notify.png", height: 22,),
                        SizedBox(width: 16,),
                        InkWell(
                          onTap: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                          child: Image.asset("assets/menu.png", height: 22,),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Hello, User!", style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 21
                            ),),
                            SizedBox(height: 6,),
                            Text("Let's explore what’s happening nearby",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15
                              ),)
                          ],
                        ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 3,
                                color: Color(0xffff00f1)
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset("assets/profilepic.jpg", height: 40,)),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),

                    /// Dates
                    Container(
                      height: 60,
                      child: ListView.builder(
                          itemCount: dates.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return DateTile(
                              weekDay: dates[index].weekDay,
                              date: dates[index].date,
                              isSelected: todayDateIs == dates[index].date,
                            );
                          }),
                    ),

                    /// Events
                    SizedBox(height: 16,),
                    Text("All Events", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),),
                    SizedBox(height: 16,),
                    Container(
                      height: 100,
                      child: ListView.builder(
                          itemCount: eventsType.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return EventTile(
                              imgAssetPath: eventsType[index].imgAssetPath,
                              eventType: eventsType[index].eventType,
                            );
                          }),
                    ),

                    /// Popular Events
                    SizedBox(height: 16,),
                    Text("Popular Events", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),),
                    Container(
                      child: ListView.builder(
                          itemCount: events.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index){
                            return PopularEventTile(
                              desc: events[index].desc,
                              imgeAssetPath: events[index].imgeAssetPath,
                              date: events[index].date,
                              address: events[index].address,
                            );

                          }),
                    )
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
  DateTile({required this.weekDay, required this.date, required this.isSelected});

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
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(widget.date, style: TextStyle(
              color: widget.isSelected ? Colors.black : Colors.white,
              fontWeight: FontWeight.w600
          ),),
          SizedBox(height: 10,),
          Text(widget.weekDay, style: TextStyle(
              color: widget.isSelected ? Colors.black : Colors.white,
              fontWeight: FontWeight.w600
          ),)
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
          borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(widget.imgAssetPath, height: 27,),
          SizedBox(height: 12,),
          Text(widget.eventType, style: TextStyle(
              color: Colors.white
          ),)
        ],
      ),
    );
  }
}

class PopularEventTile extends StatefulWidget {

  String desc;
  String date;
  String address;
  String imgeAssetPath;/// later can be changed with imgUrl
  PopularEventTile({required this.address,required this.date,required this.imgeAssetPath,required this.desc});
  @override
  State<PopularEventTile> createState() => _PopularEventTileState();
}

class _PopularEventTileState extends State<PopularEventTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color: Color(0xffc58fff),
          borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16),
              width: MediaQuery.of(context).size.width - 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.desc, style: TextStyle(
                      color: Colors.white,
                      fontSize: 18
                  ),),
                  SizedBox(height: 8,),
                  Row(
                    children: <Widget>[
                      Image.asset("assets/calender.png", height: 12,),
                      SizedBox(width: 8,),
                      Text(widget.date, style: TextStyle(
                          color: Colors.white,
                          fontSize: 10
                      ),)
                    ],
                  ),
                  SizedBox(height: 4,),
                  Row(
                    children: <Widget>[
                      Image.asset("assets/location.png", height: 12,),
                      SizedBox(width: 8,),
                      Text(widget.address, style: TextStyle(
                          color: Colors.white,
                          fontSize: 10
                      ),)
                    ],
                  ),
                ],
              ),
            ),
          ),
          ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
              child: Image.asset(widget.imgeAssetPath, height: 100,width: 120, fit: BoxFit.cover,)),
        ],
      ),
    );
  }
}



