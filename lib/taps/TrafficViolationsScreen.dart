import 'package:flutter/material.dart';

class TrafficViolationsScreen extends StatelessWidget {
  const TrafficViolationsScreen({super.key});
static const String routeName = '/trafficViolationsScreen';
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Row(
        children: [
         
           Text(
            'TrafficViolationsScreen',
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