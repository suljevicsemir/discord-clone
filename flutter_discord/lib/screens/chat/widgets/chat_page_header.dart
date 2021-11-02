

import 'package:flutter/material.dart';
import 'package:flutter_discord/themes/palette.dart';

class ChatPageHeader extends StatelessWidget {
  const ChatPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: const BoxDecoration(
        color: Palette.discordLightGray,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.menu, color: Colors.white,),
          ),
          const Text(
            '@ dolan',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16
            ),
          ),
          const Spacer(),
          Material(
            color: Palette.discordLightGray,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.call, color: Colors.white,),
              ),
            ),
          ),
          Material(
            color: Palette.discordLightGray,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.video_call, color: Colors.white,),
              ),
            ),
          ),
          Material(
            color: Palette.discordLightGray,
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.group, color: Colors.white,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
