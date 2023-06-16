import 'package:flutter/material.dart';

import '../class/Crud.dart';

class SearchProv extends ChangeNotifier {
  Crud crud = Crud();
  TextEditingController? query;
  List data = [];
  initstat() {
    query = TextEditingController();
    notifyListeners();
  }

  getMovis(String query) async {
    data = [];
    var res = await crud.getMovisee(
        "https://api.themoviedb.org/3/search/movie?query=$query&include_adult=false&page=1");
    data.addAll(res["results"]);
    
    notifyListeners();
  }
}
