import 'package:flutter/material.dart';
import 'package:horoscope/ohmanda_api.dart';
import 'package:horoscope/select_sign_page.dart';
import 'package:horoscope/sign.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SelectSignPage(),
    );
  }
}
