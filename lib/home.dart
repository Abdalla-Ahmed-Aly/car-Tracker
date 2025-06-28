import 'package:car_tracker/taps/CarAlarmScreen.dart';
import 'package:car_tracker/taps/CarStatusScreen.dart';
import 'package:car_tracker/taps/MessagesHistoryScreen.dart';
import 'package:car_tracker/taps/PayFinesScreen.dart';
import 'package:car_tracker/taps/TrafficViolationsScreen.dart';
import 'package:car_tracker/taps/customeCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Home extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LatLng carLocation = LatLng(30.0444, 31.2357); // Initial location (Cairo)

  /// Simulates changing car location.
  /// In real apps, use GPS or live data.
  void _changeCarLocation() {
    setState(() {
      carLocation = LatLng(
        carLocation.latitude + 0.001,
        carLocation.longitude + 0.001,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            SvgPicture.asset('assets/images/car.svg', height: 24, width: 24),
            const SizedBox(width: 10),
            const Text(
              'Connected',
              style: TextStyle(
                fontSize: 18,
                color: Colors.green,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Speed Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.speed, color: Colors.blueAccent),
                    SizedBox(width: 10),
                    Text(
                      'Speed: 52 km/h',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Map Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height: 250,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      FlutterMap(
                        options: MapOptions(center: carLocation, zoom: 13.0),
                        children: [
                          TileLayer(
                            urlTemplate:
                                "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                          ),
                          MarkerLayer(
                            markers: [
                              Marker(
                                point: carLocation,
                                width: 60,
                                height: 60,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Colors.red,
                                      size: 30,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(6),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 4,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: const Text(
                                        "My Car",
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Update Location Button
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: ElevatedButton.icon(
                          onPressed: _changeCarLocation,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                          ),
                          icon: const Icon(
                            Icons.refresh_sharp,
                            size: 18,
                            color: Colors.blueAccent,
                          ),
                          label: const Text(
                            'Update Location',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Info Cards
            Column(
              children: [
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
                    Navigator.pushNamed(context, TrafficViolationsScreen.routeName);
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
                    Navigator.pushNamed(context, MessagesHistoryScreen.routeName);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
