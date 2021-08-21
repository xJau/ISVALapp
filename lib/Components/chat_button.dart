import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:isval_test/Utility/colorpalette.dart';

class ChatButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colorpalette.BIANCO,
        elevation: 20,
        shape: CircleBorder(side: BorderSide(color: Colorpalette.AZZURRO_ISVAL,width: 2)),
        hoverColor: Colorpalette.AZZURRO_GRIGIO,
          onPressed: () => print('chat'),
          child: Icon(
            FontAwesomeIcons.comments,
            color: Colorpalette.AZZURRO_ISVAL,
          ));
  }

}