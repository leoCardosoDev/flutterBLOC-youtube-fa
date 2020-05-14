import 'package:flutter/material.dart';
import 'package:youtubeblocapp/delegates/data_search.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(height: 25, child: Image.asset('assets/images/yt_logo_rgb_dark.png'),),
        elevation: 0,
        backgroundColor: Colors.black87,
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text('0'),
          ),
          IconButton(
            icon: Icon(Icons.star, color: Colors.white,),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.white,),
            onPressed: () async {
              String result = await showSearch(context: context, delegate: DataSearch());
              print(result);
            },
          ),
        ],
      ),
      body: Container(),
    );
  }
}
