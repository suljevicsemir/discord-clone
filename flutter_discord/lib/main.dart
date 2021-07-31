import 'package:flutter/material.dart';
import 'package:flutter_discord/mock.dart';
import 'package:flutter_discord/themes/palette.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      initialRoute: Mock.route,
      theme: Palette.darkMode(),
      home: const Mock(),
    );
  }
}


