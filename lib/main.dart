
import 'package:flutter/material.dart';
import 'package:smart_moskea/requests/authServices.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Moskea',
      home: AuthServices().handleAuth(),
      theme: ThemeData(
        accentColor: Color(0xFFFEF9EB),
        primaryColor: Colors.deepOrangeAccent,
      ),
    );
  }
}


