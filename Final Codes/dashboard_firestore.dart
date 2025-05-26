// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Firebase Firestore
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting Text
              greetingText(),
              const SizedBox(height: 16),

              // Battery Card with StreamBuilder
              StreamBuilder<DocumentSnapshot>(
                stream: firestore
                    .collection('robots')
                    .doc('battery')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Card(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text('Error loading battery data'),
                      ),
                    );
                  }

                  int batteryLevel = 0;
                  if (snapshot.hasData && snapshot.data!.exists) {
                    final data = snapshot.data!.data() as Map<String, dynamic>?;
                    batteryLevel = data?['battery'] ?? 0;
                    return batteryCard(batteryLevel);
                  }

                  return const Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              // Temperature Card with FutureBuilder
              temperatureCard(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  // ------- UI FUNCTIONS ------- //

  // Greeting Text
  Widget greetingText() {
    return const Text('Hi Ken!', style: TextStyle(fontSize: 18));
  }

  // Battery Card
  Widget batteryCard(int batteryLevel) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Theme.of(context).primaryColor, Color(0xFF001F3F)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 25, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.battery_charging_full_outlined,
                  size: 25,
                  color: Colors.white,
                ),
                const Text(
                  'Robot Battery',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  // Convert battery level to status text within the card
                  batteryLevel > 75
                      ? 'Battery level is in good condition'
                      : batteryLevel >= 25
                      ? 'Battery level is normal'
                      : 'Battery level is warning',
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 8),
                IconButton(
                  onPressed: _updateBatteryLevel,
                  icon: const Icon(
                    Icons.auto_fix_high_rounded,
                    color: Colors.white,
                  ),
                  tooltip: 'Generate random battery level',
                ),
              ],
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(
                  value: batteryLevel / 100,
                  color: Colors.white,
                  strokeWidth: 6,
                  backgroundColor: Colors.white.withOpacity(0.3),
                ),
              ),
              Text(
                '$batteryLevel%',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Temperature Card
  Widget temperatureCard() {
    return Card(
      surfaceTintColor: const Color(0xFF2C2C30),
      color: const Color(0xFF2C2C30),
      margin: const EdgeInsets.all(0),
      child: Container(
        height: 300,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Temperature',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    // Reset State to Activate FutureBuilder to refresh temperature data
                    setState(() {});
                  },
                  icon: const Icon(Icons.refresh),
                  tooltip: 'Refresh temperature data',
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<DocumentSnapshot>(
                future: firestore.collection('robots').doc('temperature').get(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error loading temperature data'),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return const Center(
                      child: Text('No temperature data available'),
                    );
                  }

                  // Get temperature data from Firestore
                  final data = snapshot.data!.data() as Map<String, dynamic>?;
                  final temperatureArray =
                      data?['data'] as List<dynamic>? ?? [];

                  if (temperatureArray.isEmpty) {
                    return const Center(child: Text('No temperature readings'));
                  }

                  // Convert data to chart points
                  List<FlSpot> spots = [];
                  for (int i = 0; i < temperatureArray.length; i++) {
                    final item = temperatureArray[i] as Map<String, dynamic>;
                    final double value = (item['value'] as num).toDouble();
                    spots.add(FlSpot(i.toDouble(), value));
                  }

                  // Create simple line chart
                  return LineChart(
                    LineChartData(
                      gridData: const FlGridData(
                        show: true,
                        drawVerticalLine: false,
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            getTitlesWidget: (double value, TitleMeta meta) {
                              if (value < 0 ||
                                  value >= temperatureArray.length) {
                                return const Text('');
                              }
                              final item =
                                  temperatureArray[value.toInt()]
                                      as Map<String, dynamic>;
                              final DateTime dateTime =
                                  (item['datetime'] as Timestamp).toDate();
                              return Text(
                                '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                              );
                            },
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (double value, TitleMeta meta) {
                              return Text(
                                '${value.toInt()}°C',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              );
                            },
                            reservedSize: 42,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      minX: 0,
                      maxX: (spots.length - 1).toDouble(),
                      minY:
                          spots
                              .map((spot) => spot.y)
                              .reduce((min, y) => y < min ? y : min) -
                          2,
                      maxY:
                          spots
                              .map((spot) => spot.y)
                              .reduce((max, y) => y > max ? y : max) +
                          2,
                      lineBarsData: [
                        LineChartBarData(
                          spots: spots,
                          isCurved: true,
                          color: Theme.of(context).primaryColor,
                          barWidth: 3,
                          dotData: const FlDotData(show: true),
                          belowBarData: BarAreaData(
                            show: true,
                            color: Theme.of(
                              context,
                            ).primaryColor.withOpacity(0.1),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ------- LOGIC FUNCTIONS ------- //

  // Write random battery value to Firestore
  Future<void> _updateBatteryLevel() async {
    final randomValue = Random().nextInt(101); // 0-100
    await firestore.collection('robots').doc('battery').set({
      'battery': randomValue,
    });
  }
}
