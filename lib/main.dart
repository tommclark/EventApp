import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:setap/signin_screen.dart';
import 'package:setap/signup_screen.dart';
import 'create.dart';
import 'time_date_for_create.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyACR9adGTWIRiNRNNzuoqIDuFPQ33pChsM',
      appId: '1:722797715945:android:dfc7fc9161097c83792b78',
      messagingSenderId: '722797715945',
      projectId: 'setap-1d',
    ),
  );
  await Hive.initFlutter();
  Hive.registerAdapter(TimeOfDayAdapter());
  Hive.registerAdapter(EventAdapter()); // Register your adapter
  await Hive.openBox<Event>('events'); // Open the box for events
  runApp(MaterialApp(home: RegisterScreen(auth: FirebaseAuth.instance)));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              child: Image.asset("assets/backdrop.jpg",
                fit: BoxFit.cover, // This line makes the image cover the entire screen
                height: double.infinity, // These two lines are needed to make the image take up the full screen
                width: double.infinity),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/logo.png",
                    height: 75,
                  ),
                  SizedBox(height: 18,),
                  Row(
                    children: <Widget>[
                      Text(
                        "EVENT",
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 32,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        " APP",
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 32,
                            fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                  SizedBox(height: 14,),
                  Text("There’s a lot happening around you! Our mission is to provide what’s happening near you!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                    ),),
                  SizedBox(height: 14,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => LoginScreen()
                      ));
                    },
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Text("Get Started", style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                          ),),
                          SizedBox(width: 8,),
                          Icon(Icons.arrow_forward, color: Colors.white,size: 32,)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
