import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:youtubeblocapp/blocs/favorite_bloc.dart';
import 'package:youtubeblocapp/blocs/videos_bloc.dart';
import 'package:youtubeblocapp/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
     bloc: VideosBloc(),
      child: BlocProvider(
       bloc: FavoriteBloc(),
       child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Tube',
        home: HomeScreen(),
       ),
      ),
    );
  }
}