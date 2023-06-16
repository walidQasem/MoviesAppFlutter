import 'package:flutter/material.dart';
import 'package:welx/Screens/Home_screen.dart';
import 'package:welx/Screens/Search.dart';

class Navigate extends ChangeNotifier {
  List<Widget> page = [const Home_Screen(), const Search()];
  int index = 0;
  changPage(int newIndex) {
    index = newIndex;
    notifyListeners();
  }
}
