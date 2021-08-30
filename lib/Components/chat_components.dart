import 'package:bubble/bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:isval_test/Routes/chat.dart';
import 'package:isval_test/Utility/colorpalette.dart';

class ChatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colorpalette.BIANCO,
        elevation: 20,
        shape: CircleBorder(
            side: BorderSide(color: Colorpalette.AZZURRO_ISVAL, width: 2)),
        hoverColor: Colorpalette.AZZURRO_GRIGIO,
        onPressed: () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext ctx) => ChatRoute())),
        child: Icon(
          FontAwesomeIcons.comments,
          color: Colorpalette.AZZURRO_ISVAL,
        ));
  }
}

class ChatInMessage extends StatelessWidget {
  final String message;
  ChatInMessage({required this.message});
  @override
  Widget build(BuildContext context) {
    return Bubble(
      padding: BubbleEdges.symmetric(vertical: 7, horizontal: 15),
      nip: BubbleNip.leftTop,
      margin: BubbleEdges.only(right: 200, left: 20, top: 10),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message),
          SizedBox(
            height: 10,
          ),
          Text(DateTime.now().toString())
        ],
      ),
      color: Colorpalette.GRIGIO_2,
      radius: Radius.circular(10),
      nipRadius: .5,
    );
  }
}

class ChatOutMessage extends StatelessWidget {
  final String message;
  ChatOutMessage({required this.message});
  @override
  Widget build(BuildContext context) {
    return Bubble(
      padding: BubbleEdges.symmetric(vertical: 7, horizontal: 15),
      nip: BubbleNip.rightTop,
      margin: BubbleEdges.only(left: 200, right: 20, top: 10),
      alignment: Alignment.topRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [Text(message), Text(DateTime.now().toString())],
      ),
      color: Colorpalette.AZZURRO_GRIGIO,
    );
  }
}
