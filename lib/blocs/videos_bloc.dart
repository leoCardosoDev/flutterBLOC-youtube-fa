import 'dart:async';

import 'package:youtubeblocapp/api.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:youtubeblocapp/models/video.dart';

class VideosBloc implements BlocBase {
  Api api;

  VideosBloc() {
    api = Api();

    _searchController.stream.listen(_search);
  }

  List<Video> videos;

  final StreamController<List<Video>> _videoController = StreamController<List<Video>>();
  Stream get outVideos => _videoController.stream;

  final StreamController<String> _searchController = StreamController<String>();
  Sink get inSearch => _searchController.sink;

  void _search(String search) async {
    if (search != null) {
     _videoController.sink.add([]);
     videos = await api.search(search);
    }
    else {
     videos += await api.nextPage();
    }

    _videoController.sink.add(videos);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videoController.close();
    _searchController.close();
  }
}
