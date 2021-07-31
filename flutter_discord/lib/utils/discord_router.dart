


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_discord/mock.dart';

class DiscordRoutes {

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {

    switch (settings.name) {
      default:
        return MaterialPageRoute(
          builder: (_) => const Mock()
        );
    }

  }

}