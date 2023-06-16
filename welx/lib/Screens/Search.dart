import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:welx/Model/SearchP.dart';
import 'package:welx/Screens/Details_screen.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search Film",
          style: GoogleFonts.ubuntu(
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15)),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Consumer<SearchProv>(builder: (context, req, _) {
          return ListView(children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(242, 36, 36, 36)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  onChanged: (String query) {
                    req.getMovis(query);
                  },
                  controller: req.query,
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                "search results : ${req.data.length}",
                style: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                    itemCount: req.data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 0,
                      mainAxisExtent: 170,
                    ),
                    itemBuilder: (contex, i) {
                      if (req.data[i]["poster_path"] != null) {
                        print(req.data[i]["poster_path"]);
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Deatails_Screen(
                                        image:
                                            "https://image.tmdb.org/t/p/w500/${req.data[i]["poster_path"]}",
                                        i: req.data[i]["id"],
                                      )),
                            );
                          },
                          child: Hero(
                            tag: req.data[i]["id"],
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Opacity(
                                    opacity: 0.7,
                                    child: Image.network(
                                      "https://image.tmdb.org/t/p/w500/${req.data[i]["poster_path"]}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: ColorFiltered(
                            colorFilter: const ColorFilter.mode(
                                Color.fromARGB(255, 244, 117, 54),
                                BlendMode.srcIn), // Change the color here
                            child: Lottie.network(
                              'https://assets9.lottiefiles.com/packages/lf20_exi9acin.json', // Replace with the path to your JSON file
                              width: 200,
                              height: 150,
                            ),
                          ),
                        );
                      }
                    }),
              ),
            )
          ]);
        }),
      ),
    );
  }
}
