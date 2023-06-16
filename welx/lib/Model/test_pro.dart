import 'package:flutter/cupertino.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../class/crud.dart';

class Test_Pro extends ChangeNotifier {
  int idFilm = 603692;
  String idYoutube = "";
  YoutubePlayerController? controller;
  int index = 0;
  Crud crud = Crud();
  var movies = {};
 
  changeIndex(int i) {
    index = i;
    notifyListeners();
  }

 
}
