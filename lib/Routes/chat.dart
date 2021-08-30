import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isval_test/Components/chat_components.dart';
import 'package:isval_test/Components/header.dart';

class ChatRoute extends StatefulWidget {
  const ChatRoute();
  @override
  State<StatefulWidget> createState() => ChatState();
  final messaggioTest =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
}

class ChatState extends State<ChatRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: Header(),
      body: Column(
        children: [
          ChatInMessage(
            message: widget.messaggioTest,
          ),
          ChatOutMessage(message: widget.messaggioTest)
        ],
      ),
    );
  }
}
