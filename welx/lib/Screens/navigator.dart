import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:welx/Model/navigat.dart';

class Navicator extends StatelessWidget {
  const Navicator({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<Navigate>(builder: (context, snapshot, _) {
      return Scaffold(
        bottomNavigationBar: NavigationBar(
            elevation: 0,
            selectedIndex: snapshot.index,
            onDestinationSelected: (int i) {
              snapshot.changPage(i);
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  Icons.movie_sharp,
                  color: Color.fromARGB(245, 255, 255, 255),
                ),
                label: "Home",
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                label: "search",
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite, color: Colors.white),
                label: "favorite",
              ),
              NavigationDestination(
                icon: Icon(Icons.settings, color: Colors.white),
                label: "Setting",
              ),
            ]),
        body: Container(child: snapshot.page.elementAt(snapshot.index)),
      );
    });
  }
}
