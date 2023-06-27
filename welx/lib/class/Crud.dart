import 'dart:convert';

import 'package:http/http.dart' as http;

List movisee = [];

class Crud {
  Future getMovisee(String query) async {
    String url = query;
    var respone = await http.get(Uri.parse(url), headers: { 
                'Accept': 'application/json',
                   'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZDIxNGUzZDhhNzZiNjYxODI5ZWQ5MTAwZDRmNjEyYyIsInN1YiI6IjY0ODM2ZTUzYmYzMWYyNTA1NzA1YTZhMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.tBX-ctsnoK0Gzvik9PDPGzm-NUpNPPmnLJJ6N1maA3I',});

    if (respone.statusCode == 200) {
      return jsonDecode(respone.body);
    } else {
      return null;
    }
  }
}