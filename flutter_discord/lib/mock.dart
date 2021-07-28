

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      body: SafeArea(
        child: Center(
          child: Text("Welcome"),
        ),
      ),
    );
  }
}
