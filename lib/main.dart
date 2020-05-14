import 'package:flutter/material.dart';
import 'package:youtubeblocapp/api.dart';
import 'package:youtubeblocapp/screens/home_screen.dart';

void main() {
  runApp(MyApp());

  Api api = Api();
  api.search('novinha');
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Tube',
      home: HomeScreen(),
    );
  }
}