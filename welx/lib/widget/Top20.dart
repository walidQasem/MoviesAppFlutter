import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

import '../Screens/Details_screen.dart';
import '../class/crud.dart';

class Top20 extends StatelessWidget {
  const Top20({super.key});

  @override
  Widget build(BuildContext context) {
    Crud crud = Crud();
    return FutureBuilder(
      future: crud.getMovisee(
          "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            height: 200,
            decoration: const BoxDecoration(),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data['results'].length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Deatails_Screen(
                                  image:
                                      "https://image.tmdb.org/t/p/w500/${snapshot.data['results'][index]['poster_path']}",
                                  i: snapshot.data['results'][index]["id"],
                                )),
                      );
                    },
                    child: Hero(
                      tag: snapshot.data['results'][index]['id'],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Opacity(
                          opacity: 0.7,
                          child: SizedBox(
                            width: 120,
                            height: 100,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                    "https://image.tmdb.org/t/p/w500/${snapshot.data['results'][index]['poster_path']}",
                                    fit: BoxFit.cover, frameBuilder: (context,
                                        child, frame, wasSynchronouslyLoaded) {
                                  return child;
                                }, loadingBuilder:
                                        (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Center(
                                      child: ColorFiltered(
                                        colorFilter: const ColorFilter.mode(
                                            Color.fromARGB(255, 244, 117, 54),
                                            BlendMode
                                                .srcIn), // Change the color here
                                        child: Lottie.network(
                                          'https://assets9.lottiefiles.com/packages/lf20_exi9acin.json', // Replace with the path to your JSON file
                                          width: 200,
                                          height: 150,
                                        ),
                                      ),
                                    );
                                  }
                                })),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          );
        }
        return const Text("loading");
      },
    );
  }
}
