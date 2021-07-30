

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_discord/themes/palette.dart';

class Mock extends StatefulWidget {

  const Mock({
    Key? key
}): super(key: key);

  @override
  _MockState createState() => _MockState();
}

class _MockState extends State<Mock> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Palette.discordLightGray,
      body: SafeArea(
        child: Center(
          child: Text("Welcome", style: TextStyle(fontFamily: "Whitney", color: Colors.white, fontWeight: FontWeight.w700, letterSpacing: 1.0, fontSize: 18)),
        ),
      ),
    );
  }
}
