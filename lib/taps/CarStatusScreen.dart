import 'package:flutter/material.dart';

class Carstatusscreen extends StatelessWidget {
  const Carstatusscreen({super.key});
static const String routeName = '/carstatusscreen';
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Row(
        children: [
         
           Text(
            'CarStatusScreen',
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