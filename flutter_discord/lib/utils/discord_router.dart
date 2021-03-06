


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_discord/mock.dart';
import 'package:flutter_discord/screens/chat/chat_page.dart';

class DiscordRoutes {

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {

    switch (settings.name) {

      case ChatPage.route:
        return MaterialPageRoute(builder: (_) => const ChatPage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Mock()
        );
    }

  }

}