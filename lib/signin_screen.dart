import 'package:flutter/material.dart';
import 'package:setap/home.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
            Text(
            'Event App',
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 48.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Your Email',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => HomeScreen()));
            },
            child: Text('Sign In'),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              padding: EdgeInsets.symmetric(vertical: 16.0),
            ),
          ),
          SizedBox(height: 16.0),
          TextButton(
            onPressed: () {

            },
            child: Text(
              "Don't have an account? Sign Up",
            ),
          ),
          SizedBox(height: 16.0),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              ElevatedButton(
              onPressed: () {
          // Implement Google sign-in logic
        },
          child: Text('Sign in with Google'),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.grey,
            padding: EdgeInsets.symmetric(vertical: 12.0),
          ),
        ),
    ],
    ),
    ],
    ),
    ),
    );
  }
}
