import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapCard extends StatefulWidget {
  const MapCard({super.key});

  @override
  State<MapCard> createState() => _MapCardState();
}

class _MapCardState extends State<MapCard> {
  // موقع السيارة (القاهرة كبداية)
  LatLng carLocation = LatLng(30.0444, 31.2357);

  // دالة تحديث الموقع بشكل تجريبي (تحاكي بيانات من الأردوينو)
  void _updateLocation() {
    setState(() {
      carLocation = LatLng(
        carLocation.latitude + 0.0005,
        carLocation.longitude + 0.0003,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      borderRadius: BorderRadius.circular(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            // خريطة السيارة
            SizedBox(
              height: 280,
              width: double.infinity,
              child: FlutterMap(
                options: MapOptions(
                  center: carLocation,
                  zoom: 14.0,
                ),
                children: [
                  // طبقة البلاط (خريطة بيضاء نظيفة)
                  TileLayer(
                    urlTemplate:
                        "https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png",
                    subdomains: ['a', 'b', 'c'],
                    retinaMode: true,
                  ),
                  // طبقة العلامة (دبوس الموقع)
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: carLocation,
                        width: 60,
                        height: 60,
                        child: Column(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.redAccent,
                              size: 34,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
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
                                style: TextStyle(fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // زر تحديث الموقع
            Positioned(
              bottom: 12,
              right: 12,
              child: ElevatedButton.icon(
                onPressed: _updateLocation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blueAccent,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.refresh),
                label: const Text("Update"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
