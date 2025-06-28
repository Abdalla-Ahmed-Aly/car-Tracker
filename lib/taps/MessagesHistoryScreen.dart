import 'package:flutter/material.dart';

class MessagesHistoryScreen extends StatelessWidget {
  const MessagesHistoryScreen({super.key});
static const String routeName = '/messagesHistoryScreen';
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Row(
        children: [
         
           Text(
            'MessagesHistoryScreen',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}