import 'package:flutter/material.dart';
import 'package:setap/attendeehome.dart';
import 'package:setap/hosthome.dart';

class UserMode extends StatefulWidget {
  @override
  _UserModeState createState() => _UserModeState();
}

class _UserModeState extends State<UserMode> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xff331f46),
                  Color(0xffc58fff),
                ],
                stops: [0.5, 0.5],
              ),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              double buttonSize = constraints.maxWidth * 0.3; // 30% of screen width
              return Center(
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GestureDetector(
                            onTapDown: (details) {
                              _controller.forward();
                            },
                            onTapUp: (details) {
                              _controller.reverse();
                            },
                            child: ScaleTransition(
                              scale: _animation,
                              child: Column(
                                children: [
                                  Padding(padding: EdgeInsets.only(top: 50)), // added padding at the top
                                  Text('Select to Host Events', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)), // added label
                                  SizedBox(height: 60), // added padding
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      backgroundColor: Color(0xffc58fff),
                                      minimumSize: Size(buttonSize, buttonSize),
                                      side: BorderSide(color: Colors.white, width: 2), // added border
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => HostHomeScreen()), // replace with your first page
                                      );
                                    },
                                    child: Text('Host', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)), // modified text style
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: GestureDetector(
                            onTapDown: (details) {
                              _controller.forward();
                            },
                            onTapUp: (details) {
                              _controller.reverse();
                            },
                            child: ScaleTransition(
                              scale: _animation,
                              child: Column(
                                children: [
                                  Padding(padding: EdgeInsets.only(top: 50)), // added padding at the top
                                  Text('Select to Search Events', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)), // added label
                                  SizedBox(height: 60), // added padding
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      backgroundColor: Color(0xff331f46),
                                      minimumSize: Size(buttonSize, buttonSize),
                                      side: BorderSide(color: Colors.white, width: 2), // added border
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => AttendeeHomeScreen()), // replace with your second page
                                      );
                                    },
                                    child: Text('Attendee', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)), // modified text style
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}