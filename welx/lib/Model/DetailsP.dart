import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../class/crud.dart';

class DetailsP extends ChangeNotifier {
  YoutubePlayerController? controller;

  Crud crud = Crud();
  getId(int id) async {
    var res = await crud.getMovisee(
        "https://api.themoviedb.org/3/movie/$id/videos?language=en-US");
    controller = YoutubePlayerController(
      initialVideoId: res["results"].isEmpty == false
          ? res["results"][0]["key"]
          : "hGOcFPzx1H0",
      flags: const YoutubePlayerFlags(
        forceHD: true,
        controlsVisibleAtStart: true,
        captionLanguage: "ar",
        isLive: false,
        autoPlay: true,
      ),
    );
    notifyListeners();
  }
}
