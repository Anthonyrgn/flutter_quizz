import 'package:flutter/material.dart';
import 'package:flutterquizz/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData
        (// This is the theme of your application.

        primarySwatch: Colors.deepOrange,
      ),
      home: HomePage(),
    );
  }
}

