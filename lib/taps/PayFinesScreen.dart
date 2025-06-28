import 'package:flutter/material.dart';

class PayFinesScreen extends StatelessWidget {
  const PayFinesScreen({super.key});
static const String routeName = '/payFinesScreen';
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Row(
        children: [
         
           Text(
            'PayFinesScreen',
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