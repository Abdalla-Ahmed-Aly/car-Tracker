import 'package:car_tracker/taps/CarAlarmScreen.dart';
import 'package:car_tracker/taps/CarStatusScreen.dart';
import 'package:car_tracker/taps/MessagesHistoryScreen.dart';
import 'package:car_tracker/taps/PayFinesScreen.dart';
import 'package:car_tracker/taps/TrafficViolationsScreen.dart';
import 'package:car_tracker/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Tracker',
      routes: {Home.routeName: (_) =>  Home(),
      Carstatusscreen.routeName: (_)=> Carstatusscreen(),
      Caralarmscreen.routeName: (_)=> Caralarmscreen(),
      TrafficViolationsScreen.routeName: (_)=> TrafficViolationsScreen(),
      PayFinesScreen.routeName: (_)=> PayFinesScreen(),
      MessagesHistoryScreen.routeName: (_)=> MessagesHistoryScreen(),
      },
      initialRoute: Home.routeName,
    );
  }
}
