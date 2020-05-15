import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtubeblocapp/blocs/favorite_bloc.dart';
import 'package:youtubeblocapp/blocs/videos_bloc.dart';
import 'package:youtubeblocapp/delegates/data_search.dart';
import 'package:youtubeblocapp/models/video.dart';
import 'package:youtubeblocapp/screens/favorites_screen.dart';
import 'package:youtubeblocapp/widgets/video_tile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<VideosBloc>(context);
    final blocFav = BlocProvider.of<FavoriteBloc>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Container(
          height: 25,
          child: Image.asset('assets/images/yt_logo_rgb_dark.png'),
        ),
        elevation: 0,
        backgroundColor: Colors.black87,
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: StreamBuilder<Map<String, Video>>(
              stream: blocFav.outFav,
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return Text(snapshot.data.length.toString());
                }
                else{
                  return Container();
                }
              },
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.star,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FavoritesScreen()
              ));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () async {
              String result = await showSearch(context: context, delegate: DataSearch());
              if (result != null) bloc.inSearch.add(result);
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: bloc.outVideos,
        initialData: [],
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length + 1,
              itemBuilder: (context, index) {
                if (index < snapshot.data.length) {
                  return VideoTile(snapshot.data[index]);
                } else if (index > 1) {
                  bloc.inSearch.add(null);
                  return Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
