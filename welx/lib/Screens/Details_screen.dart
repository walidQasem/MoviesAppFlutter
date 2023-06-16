import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:welx/class/Crud.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Model/DetailsP.dart';

class Deatails_Screen extends StatelessWidget {
  const Deatails_Screen({super.key, required this.image, required this.i});
  final String image;
  final int i;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final myNotifier = context.read<DetailsP>();
      myNotifier.getId(i); // Call the function on initialization
    });

    print(i);
    Crud crud = Crud();
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: crud.getMovisee(
              "https://api.themoviedb.org/3/movie/$i?language=en-US"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(children: [
                Hero(
                    tag: i,
                    child: Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: Opacity(
                          opacity: 0.5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                                Consumer<DetailsP>(builder: (context, data, _) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Transform.scale(
                                    scale: 2,
                                    child: YoutubePlayer(
                                      controller: data.controller!,
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
                              );
                            }),
                          )),
                    )),
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
