import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:provider/provider.dart';
 
import '../class/Crud.dart';

import '../widget/top20.dart';
import 'Details_screen.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
 
    PageController pageController = PageController(initialPage: 1);
    Crud crud = Crud();
    return Scaffold(
        primary: false,
        extendBodyBehindAppBar: true, // Extend the body behind the app bar

        body: SafeArea(
          child: FutureBuilder(
              future: crud.getMovisee(
                  "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc"),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                              height: 550,
                              child: PageView.builder(
                                  itemCount: snapshot.data['results'].length,
                                  itemBuilder: (context, i) {
                                    return SizedBox(
                                      height: 800,
                                      width: 700,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Opacity(
                                            opacity:
                                                0.4, // Opacity of the image (0.0 to 1.0)
                                            child: Stack(
                                              children: [
                                                SizedBox(
                                                  height: 550,
                                                  width: 700,
                                                  child: Image.network(
                                                    "https://image.tmdb.org/t/p/w500/${snapshot.data['results'][i]['poster_path']}",
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Positioned(
                                                  child: Container(
                                                    height: 10,
                                                    decoration:
                                                        const BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color:
                                                              Color.fromARGB(
                                                                  245,
                                                                  31,
                                                                  18,
                                                                  0),
                                                          spreadRadius: 300,
                                                          blurRadius: 200,
                                                          offset:
                                                              Offset(0, 650),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          AppBar(
                                            actions: [
                                              Center(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: const Color
                                                                .fromARGB(80,
                                                            117, 117, 117),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    15)),
                                                    height: 40,
                                                    child: const Center(
                                                        child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text("Movise"),
                                                    )),
                                                  ),
                                                ),
                                              ),
                                              
                                            ],
                                            title: Text(
                                              "Welx",
                                              style: GoogleFonts.ubuntu(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: const Color.fromARGB(
                                                      255, 244, 117, 54)),
                                            ),
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    0, 197, 40, 40),
                                            elevation: 0,
                                          ),
                                          Positioned(
                                              bottom: 150,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    width: 300,
                                                    child: Text(
                                                      "${snapshot.data['results'][i]["original_title"]}",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          GoogleFonts.ubuntu(
                                                              fontSize: 32,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  ),
                                                  Text(
                                                    "Action . Movise . ${snapshot.data['results'][i]["release_date"]}",
                                                    style: GoogleFonts.ubuntu(
                                                      fontSize: 12,
                                                    ),
                                                  )
                                                ],
                                              )),
                                          Positioned(
                                              bottom: 70,
                                              child: Row(
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Deatails_Screen(
                                                                  image:
                                                                      "https://image.tmdb.org/t/p/w500/${snapshot.data['results'][i]['backdrop_path']}",
                                                                  i: snapshot.data[
                                                                          'results']
                                                                      [
                                                                      i]['id'],
                                                                )),
                                                      );
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      20),
                                                          color: const Color
                                                                  .fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255)),
                                                      height: 50,
                                                      width: 90,
                                                      child: const Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .play_arrow_rounded,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      0,
                                                                      0,
                                                                      0),
                                                              size: 23,
                                                            ),
                                                            Text(
                                                              "Play",
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      14),
                                                            )
                                                          ]),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: const Color
                                                                .fromARGB(
                                                            94, 81, 81, 81)),
                                                    height: 50,
                                                    width: 90,
                                                    child: const Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons.add,
                                                            color:
                                                                Colors.white,
                                                          ),
                                                          Text(
                                                            "Add",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )
                                                        ]),
                                                  )
                                                ],
                                              )),
                                        ],
                                      ),
                                    );
                                  }))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Text(
                          "Top 20",
                          style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const Top20(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Text(
                          "Derama",
                          style: GoogleFonts.ubuntu(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      const Top20(),
                    ],
                  );
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
              }),
        ));
  }
}
