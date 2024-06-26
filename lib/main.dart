import 'package:flutter/material.dart';
import 'package:flutterproject/pages/home_page.dart';
//import 'package:hive_flutter/hive_flutter.dart';

void main() {

  // init the hive
  //Hive.

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.amber // appbar color in all pages (not working on chrome emulator)
      ),
    );
  }
}
