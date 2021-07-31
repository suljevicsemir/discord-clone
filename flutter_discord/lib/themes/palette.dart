


import 'package:flutter/material.dart';

class Palette {
  static const Color discordBlue      = Color(0xff7289da);
  static const Color discordWhite     = Color(0xffffffff);
  static const Color discordLightGray = Color(0xff2c2f33);
  static const Color discordDarkGray  = Color(0xff23272a);

  static const String _whitneyTheme = "Whitney";


  static ThemeData darkMode() {
    return ThemeData(
      textTheme: const TextTheme(

        //timestamp next to messages
        subtitle1: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w200,
          color: Colors.grey
        ),

        // name in a chat
        headline6: TextStyle(
          fontSize: 19,
          fontFamily: _whitneyTheme,
          fontWeight: FontWeight.w600,
          color: Colors.white
        ),

        //text messages in a chat
        caption: TextStyle(
          fontSize: 17,
          fontFamily: _whitneyTheme,
          color: Colors.white,
          fontWeight: FontWeight.w600
        )
      ),

      iconTheme: const IconThemeData(
        color: Colors.grey
      )

    );
  }


}