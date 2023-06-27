import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../class/Crud.dart';

class Deatails_Screen extends StatefulWidget {
  const Deatails_Screen({super.key, required this.i, required this.image});
  final int i;
  final String image;

  @override
  State<Deatails_Screen> createState() => _Deatails_ScreenState();
}

Crud crud = Crud();

class _Deatails_ScreenState extends State<Deatails_Screen> {
  late YoutubePlayerController controller;
  @override
  getId(int id) async {
    var res = await crud.getMovisee(
        "https://api.themoviedb.org/3/movie/$id/videos?language=en-US");
    setState(() {
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
    });
  }

  @override
  void initState() {
    controller = YoutubePlayerController(
        initialVideoId: "hGOcFPzx1H0",
        flags: const YoutubePlayerFlags(
          forceHD: true,
          controlsVisibleAtStart: true,
          captionLanguage: "ar",
          isLive: false,
          autoPlay: true,
        ));
    getId(widget.i);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: crud.getMovisee(
              "https://api.themoviedb.org/3/movie/${widget.i}?language=en-US"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(children: [
                Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Opacity(
                      opacity: 0.5,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Transform.scale(
                                scale: 2,
                                child: YoutubePlayer(
                                  controller: controller,
                                  showVideoProgressIndicator: false,
                                  progressIndicatorColor: Colors.blueAccent,
                                  progressColors: const ProgressBarColors(
                                      bufferedColor: Colors.red,
                                      playedColor: Colors.blueAccent,
                                      handleColor: Colors.blueAccent,
                                      backgroundColor: Colors.red),
                                  onReady: () {
                                    // Perform any necessary actions when the player is ready.
                                  },
                                ),
                              ),
                            ),
                          ))),
                ),
                Center(
                  child: Text(
                    "${snapshot.data["original_title"]}",
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "${snapshot.data["overview"]}",
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(fontSize: 13)),
                  ),
                ),
              ]);
            }
            return Center(
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                    Color.fromARGB(255, 244, 117, 54),
                    BlendMode.srcIn), // Change the color here
                child: Lottie.network(
                  'https://assets9.lottiefiles.com/packages/lf20_khry0zat.json', // Replace with the path to your JSON file
                  width: 100,
                  height: 100,
                ),
              ),
            );
          },
        ));
  }
}
