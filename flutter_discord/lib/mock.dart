

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_discord/themes/palette.dart';

import 'package:socket_io_client/socket_io_client.dart' as io;

class Mock extends StatefulWidget {

  static const String route = '/';

  const Mock({
    Key? key
}): super(key: key);

  @override
  _MockState createState() => _MockState();
}

class _MockState extends State<Mock> {

  io.Socket socket = io.io("http://10.0.2.2:4000", {
    'transports': ['websocket'],
    "autoConnect" : false
  });


  @override
  void initState() {
    super.initState();
    socket.on("connect", (data) {
      socket.emit("login", {
        'userId' : "this is id",
        "jwt"    : "this is jwt"
      });
    });



    socket.connect();

  }

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
          socket.disconnect();
        },
      ),
    );
  }
}
