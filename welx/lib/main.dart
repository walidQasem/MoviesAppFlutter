import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:welx/Model/DetailsP.dart';
import 'package:welx/Model/test_pro.dart';

import 'Model/SearchP.dart';
import 'Model/navigat.dart';
import 'Screens/navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Test_Pro>(
          create: ((context) => Test_Pro()),
        ),
        ChangeNotifierProvider<Navigate>(
          create: ((context) => Navigate()),
        ),
        ChangeNotifierProvider<SearchProv>(
          create: ((context) => SearchProv()),
        ),
        ChangeNotifierProvider<DetailsP>(
          create: ((context) => DetailsP()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.orange, brightness: Brightness.dark)),
        home: const Navicator(),
      ),
    );
  }
}
