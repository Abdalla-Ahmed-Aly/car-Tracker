import 'package:flutter/material.dart';

class Caralarmscreen extends StatelessWidget {
  const Caralarmscreen({super.key});
static const String routeName = '/caralarmscreen';
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Row(
        children: [
         
           Text(
            'caralarmscreen',
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