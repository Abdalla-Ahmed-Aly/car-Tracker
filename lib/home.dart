import 'package:car_tracker/taps/MapCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:car_tracker/taps/customeCard.dart';
import 'package:car_tracker/taps/CarStatusScreen.dart';
import 'package:car_tracker/taps/CarAlarmScreen.dart';
import 'package:car_tracker/taps/TrafficViolationsScreen.dart';
import 'package:car_tracker/taps/PayFinesScreen.dart';
import 'package:car_tracker/taps/MessagesHistoryScreen.dart';

class Home extends StatelessWidget {
  static const String routeName = '/home';

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Row(
          children: [
            SvgPicture.asset('assets/images/car.svg', height: 26, width: 26),
            const SizedBox(width: 12),
            const Text(
              'Connected',
              style: TextStyle(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Speed Card
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.speed, color: Colors.blueAccent, size: 28),
                  SizedBox(width: 12),
                  Text(
                    'Speed: 52 km/h',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Map Card
            const MapCard(),

            const SizedBox(height: 24),

            // Info Cards
            CustomCard(
              icon: Icons.check_circle,
              color: Colors.green,
              title1:
                  'Car is turned on and moving\nwithout user mobile connected',
              onTap: () {
                Navigator.pushNamed(context, Carstatusscreen.routeName);
              },
            ),
            CustomCard(
              icon: Icons.notifications,
              title1: 'Car alarm has been launched',
              onTap: () {
                Navigator.pushNamed(context, Caralarmscreen.routeName);
              },
            ),
            CustomCard(
              icon: Icons.speaker_notes_rounded,
              title1: 'Traffic Violations',
              title2:
                  'List of current and previous traffic violations recorded for the car.',
              onTap: () {
                Navigator.pushNamed(
                    context, TrafficViolationsScreen.routeName);
              },
            ),
            CustomCard(
              icon: Icons.payments,
              title1: 'Pay Fines',
              title2:
                  'Settle unpaid traffic fines directly through the app.',
              onTap: () {
                Navigator.pushNamed(context, PayFinesScreen.routeName);
              },
            ),
            CustomCard(
              icon: Icons.message_rounded,
              title1: 'Messages & History',
              title2:
                  'View communication messages and previous system alerts related to the vehicle.',
              onTap: () {
                Navigator.pushNamed(
                    context, MessagesHistoryScreen.routeName);
              },
            ),

            const SizedBox(height: 24),

            // زر تعطيل السيارة
            ElevatedButton.icon(
              onPressed: () {
                print("تم الضغط على زر تعطيل السيارة");
              },
              icon: const Icon(Icons.power_settings_new, color: Colors.white),
              label: const Text(
                "Disable Car",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 4,
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
