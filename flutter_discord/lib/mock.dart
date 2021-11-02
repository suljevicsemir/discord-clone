

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_discord/themes/palette.dart';

class Mock extends StatefulWidget {

  static const String route = '/';

  const Mock({
    Key? key
}): super(key: key);

  @override
  _MockState createState() => _MockState();
}

class _MockState extends State<Mock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.discordLightGray,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.call),
              Icon(Icons.videocam)
            ],
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
      ),
    );
  }
}
