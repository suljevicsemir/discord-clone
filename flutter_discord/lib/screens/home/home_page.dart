


import 'package:flutter/material.dart';
import 'package:flutter_discord/screens/chat/chat_page.dart';

class HomePage extends StatefulWidget {
  static const String route = '/home_route';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double width = 411;

  bool isChat = false;

  double offset = 411 - 50;
  double startOffset = 411 - 50;

  double delta =  50;

  double positionBeforeDragStart = 411 - 50;
  double position = 411 - 50;

  double difference = 0;

  double lastKnownPosition = 0;

  double positionOnStartDrag = 411 - 50;


  bool fromLeft = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onHorizontalDragStart: (DragStartDetails details) {
            setState(() {
              if(details.globalPosition.dx < width / 2) {
                positionOnStartDrag = details.globalPosition.dx;
                fromLeft = true;
              }
              else {
                positionOnStartDrag = details.globalPosition.dx;
                fromLeft = false;
              }
            });
          },
          onHorizontalDragUpdate: (DragUpdateDetails details) {
            if(fromLeft) {
              if(details.delta.dx > 0 && offset < startOffset) {
                setState(() {
                  offset = 0 + (-positionOnStartDrag + details.globalPosition.dx);
                });
              }
              else if(details.delta.dx < 0 ){
                setState(() {
                  offset = 0 + (-positionOnStartDrag + details.globalPosition.dx);
                });
              }
            }
            else {
              if(details.delta.dx > 0 && offset < startOffset) {
                offset = startOffset - (positionOnStartDrag - details.globalPosition.dx);
                if(offset >= startOffset) {
                  offset = startOffset;
                }
                setState(() {

                });
              }
              else if(details.delta.dx < 0 ){
                offset = startOffset - (positionOnStartDrag - details.globalPosition.dx);
                if(offset >= startOffset) {
                  offset = startOffset;
                }
                setState(() {

                });
              }
            }
          },
          onHorizontalDragEnd: (DragEndDetails details) {
            if(details.velocity.pixelsPerSecond.dx > 500) {
              if(fromLeft) {
                setState(() {
                  offset = startOffset;
                  fromLeft = false;
                });
              }
              else {
                setState(() {
                  offset = 0;
                  fromLeft = true;
                });
              }
              return;
            }
            if(offset > (width / 2)) {
              setState(() {
                offset = startOffset;
              });
            }
            else {
              setState(() {
                offset = 0;
              });
            }
          },
          child: Stack(
            children: [
              Positioned.fill(
                right: 40,
                child: Container(
                  color: Colors.red,
                ),
              ),
              //chat
              Positioned.fill(
                  left: offset,
                  child: const ChatPage()
              ),
            ],
          ),
        ),
      ),
    );
  }
}
