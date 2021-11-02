
import 'package:flutter/material.dart';
import 'package:flutter_discord/screens/chat/widgets/chat_page_header.dart';
import 'package:flutter_discord/themes/palette.dart';

class ChatPage extends StatefulWidget {

  static const String route = '/chat_route';

  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.discordDarkGray,
      body: SafeArea(
        child: Column(
          children: const [
            ChatPageHeader()
          ],
        )
      ),
    );
  }
}
