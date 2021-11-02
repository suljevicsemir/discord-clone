import 'package:flutter/material.dart';
import 'package:flutter_discord/screens/chat/chat_page.dart';
import 'package:flutter_discord/themes/palette.dart';
import 'package:flutter_discord/utils/discord_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: ChatPage.route,
      theme: Palette.darkMode(),
      onGenerateRoute: DiscordRoutes.onGenerateRoute,
    );
  }
}


